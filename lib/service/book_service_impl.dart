import 'package:grpc/grpc.dart';
import 'package:gudang_buku/domain/dto/book_request.pb.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:gudang_buku/domain/dto/book_service.pbgrpc.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/pagination_response.pb.dart';
import 'package:gudang_buku/domain/model/author_model.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/genre_model.dart';
import 'package:gudang_buku/domain/model/list_pagination_model.dart';
import 'package:gudang_buku/domain/model/pagination_model.dart';
import 'package:gudang_buku/infra/local/local_storage.dart';
import 'package:gudang_buku/service/book_service.dart';
import 'package:gudang_buku/util/dartz_helper.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:gudang_buku/util/file_streamer.dart';

class BookServiceImpl implements BookService {
  const BookServiceImpl({
    required BookServiceClient discountServiceClient,
    required LocalStorage localStorage,
  })  : _discountServiceClient = discountServiceClient,
        _localStorage = localStorage;

  final BookServiceClient _discountServiceClient;
  final LocalStorage _localStorage;

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> getAllBooks({
    int? pageID,
    int? pageSize,
    String? sort,
    double? minPrice,
    double? maxPrice,
    int? minRating,
    int? maxRating,
  }) async {
    try {
      final Map<int, BookResponse> bookMap = <int, BookResponse>{};

      late final PaginationResponse pagination;

      final ResponseStream<BookResponse> response =
          _discountServiceClient.listBooks(ListBooksRequest(
        maxPrice: maxPrice,
        maxRating: maxRating,
        minPrice: minPrice,
        minRating: minRating,
        pageID: pageID,
        pageSize: pageSize,
        sort: sort,
      ));

      await for (final BookResponse book in response) {
        final int key = book.id.toInt();
        bookMap[key] ??= BookResponse();
        switch (book.whichData()) {
          case BookResponse_Data.imageData:
            final Either<Failure, void> res =
                bookMap[key]!.imageData.add(book.imageData);
            if (res.isLeft()) {
              return Left(res.asLeft());
            }
            break;
          case BookResponse_Data.content:
            bookMap[key]!.content = book.content;
            break;
          case BookResponse_Data.pagination:
            pagination = book.pagination;
            break;
          case BookResponse_Data.notSet:
            break;
        }
      }

      final List<BookModel> books = bookMap.entries.map((e) {
        final DateTime? updatedAt = e.value.content.hasUpdatedAt()
            ? e.value.content.updatedAt.toDateTime()
            : null;

        final List<AuthorModel> authors =
            e.value.content.authors.asMap().entries.map(
          (e) {
            final DateTime? updatedAt =
                e.value.hasUpdatedAt() ? e.value.updatedAt.toDateTime() : null;

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
            final DateTime? updatedAt =
                e.value.hasUpdatedAt() ? e.value.updatedAt.toDateTime() : null;

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
          stock: e.value.content.hasStock() ? e.value.content.stock : null,
          weight: e.value.content.hasWeight() ? e.value.content.weight : null,
        );
      }).toList();

      final ListPaginationModel<BookModel> result =
          ListPaginationModel<BookModel>(
        contents: books,
        paginationModel: PaginationModel(
          currElements: pagination.currentElements.toInt(),
          currPage: pagination.currentPage,
          totalElements: pagination.totalElements.toInt(),
        ),
      );

      return Right(result);
    } on GrpcError catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      Left(ServerFailure(e.toString()));
    }

    return Left(ServerFailure('hi'));
  }
}
