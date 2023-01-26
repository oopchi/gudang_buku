import 'package:gudang_buku/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

abstract class BookGenreRepository {
  Future<Either<Failure, List<String>>> fetchAllBookIdWithGenreId({
    required String genreId,
  });
}
