import 'package:gudangBuku/domain/dto/author_book_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorBookRepository {
  Future<Either<Failure, List<AuthorBookResponse>>>
      fetchAllAuthorBookWithBookId({
    required String bookId,
  });

  Future<Either<Failure, String>> addAuthorBook({
    required String bookId,
    required String authorId,
  });
}
