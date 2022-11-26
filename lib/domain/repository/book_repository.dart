import 'package:bookstore/domain/model/book_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookResponse>>> fetchAllBooks();

  Future<Either<Failure, BookResponse>> fetchBook({
    required String id,
  });
}
