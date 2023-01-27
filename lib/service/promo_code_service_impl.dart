import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:gudang_buku/domain/dto/discount_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/discount_request.pb.dart';
import 'package:gudang_buku/domain/dto/discount_response.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/dto/pagination_response.pb.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/service/discount_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/file_streamer.dart';

class PromoCodeServiceImpl implements PromoCodeService {
  const PromoCodeServiceImpl({
    required PromoCodeServiceClient discountServiceClient,
  }) : _discountServiceClient = discountServiceClient;

  final PromoCodeServiceClient _discountServiceClient;

  @override
  Future<Either<Failure, List<PromoCodeModel>>> getAllPromoCodes() async {
    try {
      final Map<int, PromoCodeResponse> discountMap =
          <int, PromoCodeResponse>{};

      final Map<int, Map<int, BookResponse>> bookMap =
          <int, Map<int, BookResponse>>{};

      final Map<int, Map<int, ImageData>> fileMap =
          <int, Map<int, ImageData>>{};

      final Map<int, PaginationResponse> paginationMap =
          <int, PaginationResponse>{};

      final ResponseStream<PromoCodeResponse> response =
          _discountServiceClient.listPromoCodes(ListPromoCodeRequest());

      await for (final PromoCodeResponse discount in response) {
        final int key = discount.id.toInt();
        discountMap[key] ??= PromoCodeResponse();

        switch (discount.whichData()) {
          case PromoCodeResponse_Data.content:
            discountMap[key]?.content = discount.content;
            break;
          case PromoCodeResponse_Data.book:
            final int bookKey = discount.book.id.toInt();

            bookMap[key] ??= <int, BookResponse>{};
            bookMap[key]![bookKey] ??= BookResponse();

            fileMap[bookKey] ??= <int, ImageData>{};

            switch (discount.book.whichData()) {
              case BookResponse_Data.imageData:
                fileMap[bookKey]![discount.book.imageData.imageID.toInt()] ??=
                    ImageData();

                final ImageData id =
                    fileMap[bookKey]![discount.book.imageData.imageID.toInt()]!;

                final Either<Failure, void> res =
                    id.add(discount.book.imageData);
                if (res.isLeft()) {
                  return Left(res.asLeft());
                }

                fileMap[bookKey]![discount.book.imageData.imageID.toInt()] = id;
                break;
              case BookResponse_Data.content:
                bookMap[key]![bookKey]!.content = discount.book.content;
                break;
              case BookResponse_Data.pagination:
                paginationMap[key] = discount.book.pagination;
                break;
              case BookResponse_Data.notSet:
                break;
            }
            break;
          case PromoCodeResponse_Data.notSet:
            break;
          default:
        }
      }

      final List<PromoCodeModel> discountModels =
          discountMap.entries.map((MapEntry<int, PromoCodeResponse> e) {
        final DateTime? updatedAt = e.value.content.hasUpdatedAt()
            ? e.value.content.updatedAt.toDateTime()
            : null;

        final List<BookModel> books = bookMap[e.value.id]?.entries.map((e) {
              final DateTime? updatedAt = e.value.content.hasUpdatedAt()
                  ? e.value.content.updatedAt.toDateTime()
                  : null;

              final List<AuthorModel> authors =
                  e.value.content.authors.asMap().entries.map(
                (e) {
                  final DateTime? updatedAt = e.value.hasUpdatedAt()
                      ? e.value.updatedAt.toDateTime()
                      : null;

                  return AuthorModel(
                    name: e.value.name,
                    id: e.value.id.toInt(),
                    createdAt: e.value.createdAt.toDateTime(),
                    updatedAt: updatedAt,
                  );
                },
              ).toList();

              final List<GenreModel> genres =
                  e.value.content.genres.asMap().entries.map(
                (e) {
                  final DateTime? updatedAt = e.value.hasUpdatedAt()
                      ? e.value.updatedAt.toDateTime()
                      : null;

                  return GenreModel(
                    name: e.value.name,
                    id: e.value.id.toInt(),
                    createdAt: e.value.createdAt.toDateTime(),
                    updatedAt: updatedAt,
                  );
                },
              ).toList();

              final List<ImageData>? files =
                  fileMap[e.value.id]?.entries.map((e) => e.value).toList();

              return BookModel(
                id: e.value.id.toInt(),
                title: e.value.content.title,
                averageRating: e.value.content.averageRating,
                createdAt: e.value.content.createdAt.toDateTime(),
                isRated: e.value.content.isRated,
                numOfBought: e.value.content.numOfBought.toInt(),
                numOfRating: e.value.content.numOfRating.toInt(),
                price: e.value.content.price,
                productStatus: e.value.content.productStatus,
                description: e.value.content.hasDescription()
                    ? e.value.content.description
                    : null,
                updatedAt: updatedAt,
                authors: authors,
                genres: genres,
                files: files,
                stock:
                    e.value.content.hasStock() ? e.value.content.stock : null,
                weight:
                    e.value.content.hasWeight() ? e.value.content.weight : null,
              );
            }).toList() ??
            [];

        final DateTime? expirationDate = e.value.content.hasExpirationDate()
            ? e.value.content.expirationDate.toDateTime()
            : null;
        return PromoCodeModel(
          id: e.value.id.toInt(),
          discountAmount: e.value.content.discountAmount,
          createdAt: e.value.content.createdAt.toDateTime(),
          updatedAt: updatedAt,
          discountType: e.value.content.discountType,
          expirationDate: expirationDate,
          maximumPromoCodeAmount: e.value.content.maximumPromoCodeAmount,
          numOfUse: e.value.content.numOfUse,
          books: books,
        );
      }).toList();

      return Right(discountModels);
    } on GrpcError catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      Left(ServerFailure(e.toString()));
    }

    return Left(ServerFailure('hi'));
  }
}
