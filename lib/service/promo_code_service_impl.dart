import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/dto/pagination_response.pb.dart';
import 'package:gudang_buku/domain/dto/promo_code_request.pb.dart';
import 'package:gudang_buku/domain/dto/promo_code_response.pb.dart';
import 'package:gudang_buku/domain/dto/promo_code_service.pbgrpc.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/domain/model/list_pagination_model.dart';
import 'package:gudang_buku/domain/model/pagination_model.dart';
import 'package:gudang_buku/domain/model/promo_code_model.dart';
import 'package:gudang_buku/service/promo_code_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/discount_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/file_streamer.dart';

class PromoCodeServiceImpl implements PromoCodeService {
  const PromoCodeServiceImpl({
    required PromoCodeServiceClient promoCodeServiceClient,
  }) : _promoCodeServiceClient = promoCodeServiceClient;

  final PromoCodeServiceClient _promoCodeServiceClient;

  @override
  Future<Either<Failure, ListPaginationModel<PromoCodeModel>>>
      getAllOngoingPromoCodes({
    int? pageID,
    int? pageSize,
  }) async {
    try {
      final Map<int, PromoCodeResponse> promoCodeMap =
          <int, PromoCodeResponse>{};

      ImageData? file;

      PaginationModel? pagination;

      final ResponseStream<PromoCodeResponse> response = _promoCodeServiceClient
          .listOngoingPromoCodes(ListOngoingPromoCodesRequest());

      await for (final PromoCodeResponse promoCode in response) {
        final int key = promoCode.id.toInt();
        promoCodeMap[key] ??= PromoCodeResponse();

        switch (promoCode.whichData()) {
          case PromoCodeResponse_Data.content:
            promoCodeMap[key]?.content = promoCode.content;
            break;
          case PromoCodeResponse_Data.imageData:
            file ??= ImageData();

            final ImageData id = file;

            final Either<Failure, void> res = id.add(promoCode.imageData);
            if (res.isLeft()) {
              return Left(res.asLeft());
            }

            file = id;
            break;
          case PromoCodeResponse_Data.notSet:
            break;
          default:
        }
      }

      final List<PromoCodeModel> promoCodeModels =
          promoCodeMap.entries.map((MapEntry<int, PromoCodeResponse> e) {
        final DateTime? updatedAt = e.value.content.hasUpdatedAt()
            ? e.value.content.updatedAt.toDateTime()
            : null;

        final DateTime? expirationDate = e.value.content.hasExpirationDate()
            ? e.value.content.expirationDate.toDateTime()
            : null;

        return PromoCodeModel(
          id: e.value.id.toInt(),
          promoClassID: e.value.content.promoClassID.toInt(),
          code: e.value.content.code,
          discountAmount: e.value.content.discountAmount,
          discountType: e.value.content.discountType.toDiscountType(),
          maximumDiscountAmount: e.value.content.maximumDiscountAmount,
          minimumPurchaseAmount: e.value.content.minimumPurchaseAmount,
          createdAt: e.value.content.createdAt.toDateTime(),
          updatedAt: updatedAt,
          file: file,
          expirationDate: expirationDate,
          numOfUse: e.value.content.numOfUse,
        );
      }).toList();

      final ListPaginationModel<PromoCodeModel> promoCodePaginationList =
          ListPaginationModel<PromoCodeModel>(
        contents: promoCodeModels,
        paginationModel: pagination ??
            PaginationModel(
              totalElements: promoCodeModels.length,
              currElements: promoCodeModels.length,
              currPage: 1,
            ),
      );

      return Right(promoCodePaginationList);
    } on GrpcError catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      Left(ServerFailure(e.toString()));
    }

    return Left(ServerFailure('hi'));
  }
}
