import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/domain/model/genre_response.dart';
import 'package:bookstore/domain/repository/genre_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class GenreCubit extends Cubit<GenreState> {
  GenreCubit({
    required GenreRepository genreRepository,
  })  : _genreRepository = genreRepository,
        super(const GenreState().init());

  final GenreRepository _genreRepository;

  Future<void> load() async {
    final Either<Failure, List<GenreResponse>> res =
        await _genreRepository.fetchAllGenres();

    res.fold(
      (l) => null,
      (List<GenreResponse> genres) {
        emit(GenreLoaded(
          genres: genres,
        ));
      },
    );
  }
}
