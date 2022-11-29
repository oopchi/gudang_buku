import 'package:bookstore/domain/local/local_storage.dart';
import 'package:bookstore/domain/dto/genre_response.dart';
import 'package:bookstore/domain/repository/genre_repository.dart';
import 'package:bookstore/util/failure_helper.dart';
import 'package:dartz/dartz.dart';

class GenreController {
  const GenreController({
    required GenreRepository genreRepository,
    required LocalStorage localStorage,
  })  : _genreRepository = genreRepository,
        _localStorage = localStorage;
  final GenreRepository _genreRepository;
  final LocalStorage _localStorage;

  Future<Either<Failure, List<GenreResponse>>> loadAllGenres() async {
    if (await _localStorage.isEmpty(LocalStoragePath.genre)) {
      return _genreRepository.fetchAllGenres();
    }

    return Right(await _localStorage.readAll(LocalStoragePath.genre));
  }
}
