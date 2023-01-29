import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:gudang_buku/config/constant/file.dart';
import 'package:gudang_buku/domain/dto/book_request.pb.dart';
import 'package:gudang_buku/domain/dto/book_response.pb.dart';
import 'package:gudang_buku/domain/dto/book_service.pbgrpc.dart';
import 'package:dartz/dartz.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
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
    required BookServiceClient bookServiceClient,
    required LocalStorage localStorage,
  })  : _bookServiceClient = bookServiceClient,
        _localStorage = localStorage;

  final BookServiceClient _bookServiceClient;
  final LocalStorage _localStorage;

  Future<Either<Failure, ListPaginationModel<BookModel>>> _receiveBooks(
      ResponseStream<BookResponse> response) async {
    try {
      final Map<int, BookResponse> bookMap = <int, BookResponse>{};

      final Map<int, Map<int, ImageData>> fileMap =
          <int, Map<int, ImageData>>{};

      late final PaginationResponse pagination;

      await for (final BookResponse book in response) {
        final int key = book.id.toInt();
        bookMap[key] ??= BookResponse();
        fileMap[key] ??= <int, ImageData>{};
        switch (book.whichData()) {
          case BookResponse_Data.imageData:
            fileMap[key]?[book.imageData.imageID.toInt()] ??= ImageData();

            final ImageData id = fileMap[key]![book.imageData.imageID.toInt()]!;
            final Either<Failure, void> res = id.add(book.imageData);
            if (res.isLeft()) {
              return Left(res.asLeft());
            }

            fileMap[key]?[book.imageData.imageID.toInt()] = id;
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
            e.value.content.authors.toAuthorModels();

        final List<GenreModel> genres = e.value.content.genres.toGenreModels();

        final List<ImageData>? files = fileMap[e.value.id.toInt()]
            ?.entries
            .map(
              (e) => e.value,
            )
            .toList();

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

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> addUserFavoriteBook(
      AddUserFavoriteBookRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.addUserFavoriteBook(request);

    return _receiveBooks(response);
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> getAllBooks(
      ListBooksRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.listBooks(request);

    return _receiveBooks(response);
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>>
      getAllUserFavoriteBooks(ListUserFavoriteBooksRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.listUserFavoriteBooks(request);

    return _receiveBooks(response);
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>>
      removeUserFavoriteBook(DeleteUserFavoriteBookRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.deleteUserFavoriteBook(request);

    return _receiveBooks(response);
  }

  Stream<CreateBookRequest> _createBook(CreateBookContent content,
      Map<int, ImageMetaData> metadatas, Map<int, Uint8List> files) async* {
    yield CreateBookRequest(
      content: content,
    );

    for (final MapEntry<int, ImageMetaData> entry in metadatas.entries) {
      yield CreateBookRequest(
        imageData: ImageData(
          imageID: Int64(entry.key),
          metaData: entry.value,
        ),
      );

      final ReadBuffer readBuffer =
          ReadBuffer(ByteData.view(files[entry.key]!.buffer));

      while (readBuffer.hasRemaining) {
        final Uint8List byte = readBuffer.getUint8List(AppFile.maxByte);
        yield CreateBookRequest(
          imageData: ImageData(
            imageID: Int64(entry.key),
            chunk: byte,
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> createBook(
      CreateBookContent content,
      Map<int, ImageMetaData> metadatas,
      Map<int, Uint8List> files) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.createBook(_createBook(content, metadatas, files));

    return _receiveBooks(response);
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> getBook(
      GetBookRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.getBook(request);

    return _receiveBooks(response);
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> forceDeleteBooks(
      DeleteBooksRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.forceDeleteBooks(request);

    return _receiveBooks(response);
  }

  @override
  Future<Either<Failure, ListPaginationModel<BookModel>>> softDeleteBooks(
      DeleteBooksRequest request) async {
    final ResponseStream<BookResponse> response =
        _bookServiceClient.softDeleteBooks(request);

    return _receiveBooks(response);
  }
}
