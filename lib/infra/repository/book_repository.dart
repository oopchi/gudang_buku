import 'package:gudang_buku/domain/dto_fs/book_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookResponse>>> fetchAllBooks();

  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithIds({
    required List<String> ids,
  });
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithLimit({
    BookResponse? latestBook,
    int limit = 10,
  });

  // Don't use this for the moment
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithAnyPromo({
    required List<String> promoIds,
  });

  // Use this instead
  Future<Either<Failure, List<BookResponse>>> fetchAllBooksWithPromoId({
    required String promoId,
  });

  Future<Either<Failure, BookResponse>> fetchBook({
    required String id,
  });

  Future<Either<Failure, String>> addBook({
    required BookResponse bookResponse,
  });
}
