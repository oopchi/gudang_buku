import 'package:bookstore/domain/dto/author_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorRepository {
  Future<Either<Failure, List<AuthorResponse>>> fetchAllAuthorWithId({
    required List<String> authorIds,
  });
}
