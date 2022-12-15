import 'package:gudangBuku/domain/dto/genre_response.dart';
import 'package:gudangBuku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class GenreRepository {
  Future<Either<Failure, List<GenreResponse>>> fetchAllGenres();
}
