import 'package:gudang_buku/domain/dto/genre_response.dart';
import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class GenreRepository {
  Future<Either<Failure, List<GenreResponse>>> fetchAllGenres();
}
