import 'package:bookstore/domain/model/genre_response.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class GenreRepository {
  Future<Either<Failure, List<GenreResponse>>> fetchAllGenres();
}
