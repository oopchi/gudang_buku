import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:gudang_buku/domain/dto/discount_service.pbgrpc.dart';
import 'package:gudang_buku/domain/dto/discount_request.pb.dart';
import 'package:gudang_buku/domain/dto/discount_response.pb.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/pagination_response.pb.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/discount_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/service/discount_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/file_streamer.dart';

class DiscountServiceImpl implements DiscountService {
  const DiscountServiceImpl({
    required DiscountServiceClient discountServiceClient,
  }) : _discountServiceClient = discountServiceClient;

  final DiscountServiceClient _discountServiceClient;

  @override
  Future<Either<Failure, List<DiscountModel>>> getAllDiscounts() async {
    try {
      final Map<int, DiscountResponse> discountMap = <int, DiscountResponse>{};

      final Map<int, Map<int, BookResponse>> bookMapMap =
          <int, Map<int, BookResponse>>{};

      final Map<int, PaginationResponse> paginationMap =
          <int, PaginationResponse>{};

      final ResponseStream<DiscountResponse> response =
          _discountServiceClient.listDiscounts(ListDiscountRequest());

      await for (final DiscountResponse discount in response) {
        final int key = discount.id.toInt();
        discountMap[key] ??= DiscountResponse();

        switch (discount.whichData()) {
          case DiscountResponse_Data.content:
            discountMap[key]?.content = discount.content;
            break;
          case DiscountResponse_Data.book:
            bookMapMap[key] ??= <int, BookResponse>{};
            bookMapMap[key]![discount.book.id.toInt()] ??= BookResponse();
            switch (discount.book.whichData()) {
              case BookResponse_Data.imageData:
                final Either<Failure, void> res = discountMap[key]!
                    .book
                    .imageData
                    .add(discount.book.imageData);
                if (res.isLeft()) {
                  return Left(res.asLeft());
                }
                break;
              case BookResponse_Data.content:
                bookMapMap[key]![discount.book.id.toInt()]!.content =
                    discount.book.content;
                break;
              case BookResponse_Data.pagination:
                paginationMap[key] = discount.book.pagination;
                break;
              case BookResponse_Data.notSet:
                break;
            }
            break;
          case DiscountResponse_Data.notSet:
            break;
          default:
        }
      }

      final List<DiscountModel> discountModels =
          discountMap.entries.map((MapEntry<int, DiscountResponse> e) {
        final DateTime? updatedAt = e.value.content.hasUpdatedAt()
            ? e.value.content.updatedAt.toDateTime()
            : null;

        final List<BookModel> books = bookMapMap[e.value.id]?.entries.map((e) {
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
                file: e.value.imageData,
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
        return DiscountModel(
          id: e.value.id.toInt(),
          discountAmount: e.value.content.discountAmount,
          createdAt: e.value.content.createdAt.toDateTime(),
          updatedAt: updatedAt,
          discountType: e.value.content.discountType,
          expirationDate: expirationDate,
          maximumDiscountAmount: e.value.content.maximumDiscountAmount,
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
