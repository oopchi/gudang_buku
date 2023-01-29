import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gudang_buku/domain/dto/book_request.pb.dart';
import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:gudang_buku/domain/model/book_model.dart';
import 'package:gudang_buku/domain/model/list_pagination_model.dart';
import 'package:gudang_buku/util/failure_helper.dart';

abstract class BookService {
  Future<Either<Failure, ListPaginationModel<BookModel>>> getAllBooks(
      ListBooksRequest request);

  Future<Either<Failure, ListPaginationModel<BookModel>>> addUserFavoriteBook(
      AddUserFavoriteBookRequest request);

  Future<Either<Failure, ListPaginationModel<BookModel>>>
      getAllUserFavoriteBooks(ListUserFavoriteBooksRequest request);

  Future<Either<Failure, ListPaginationModel<BookModel>>>
      removeUserFavoriteBook(DeleteUserFavoriteBookRequest request);

  Future<Either<Failure, ListPaginationModel<BookModel>>> createBook(
      CreateBookContent content,
      Map<int, ImageMetaData> metadatas,
      Map<int, Uint8List> files);

  Future<Either<Failure, ListPaginationModel<BookModel>>> getBook(
      GetBookRequest request);

  Future<Either<Failure, ListPaginationModel<BookModel>>> forceDeleteBooks(
      DeleteBooksRequest request);

  Future<Either<Failure, ListPaginationModel<BookModel>>> softDeleteBooks(
      DeleteBooksRequest request);
}
