import 'package:gudang_buku/domain/dto/author_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class AuthorRepository {
  Future<Either<Failure, List<AuthorResponse>>> fetchAllAuthorWithId({
    required List<String> authorIds,
  });

  Future<Either<Failure, List<AuthorResponse>>> fetchAllAuthor();
}
