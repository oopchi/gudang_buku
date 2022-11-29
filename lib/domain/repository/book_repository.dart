import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithLimit({
    BookResponse? latestBook,
    int limit = 10,
  });

  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithAnyPromo({
    required List<String> promoIds,
  });

  Future<Either<Failure, BookResponse>> fetchBook({
    required String id,
  });
}
