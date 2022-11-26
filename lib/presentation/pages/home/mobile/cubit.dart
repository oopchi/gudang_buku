import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookstore/domain/model/book_response.dart';
import 'package:bookstore/domain/model/genre_response.dart';
import 'package:bookstore/domain/repository/book_repository.dart';
import 'package:bookstore/domain/repository/genre_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:bookstore/util/failure_helper.dart';

import 'state.dart';

class HomeMobileCubit extends Cubit<HomeMobileState> {
  HomeMobileCubit({
    required GenreRepository genreRepository,
    required BookRepository bookRepository,
  })  : _genreRepository = genreRepository,
        _bookRepository = bookRepository,
        super(const HomeMobileState().init());

  final GenreRepository _genreRepository;
  final BookRepository _bookRepository;

  List<GenreResponse>? genres;

  List<BookResponse>? books;

  Future<String?> _loadGenres() async {
    final Either<Failure, List<GenreResponse>> res =
        await _genreRepository.fetchAllGenres();

    return res.fold(
      (l) => l.message,
      (List<GenreResponse> genres) {
        this.genres = genres;
        return null;
      },
    );
  }

  Future<String?> _loadAllBooks() async {
    final Either<Failure, List<BookResponse>> res =
        await _bookRepository.fetchAllBooks();

    return res.fold(
      (l) => l.message,
      (List<BookResponse> books) {
        this.books = books;
        return null;
      },
    );
  }

  Future<void> load() async {
    String? errMsg;
    errMsg = await _loadGenres();
    if (errMsg != null) {
      emit(HomeMobileFailure(message: errMsg));
      return;
    }

    errMsg = null;
    errMsg = await _loadAllBooks();

    if (errMsg != null) {
      emit(HomeMobileFailure(message: errMsg));
      return;
    }

    final HomeMobileLoaded model = HomeMobileLoaded(
      selectedGenre: selectedGenre,
      newArrivalBooks: newArrivalBooks,
      popularBooks: popularBooks,
      recommendedBooks: recommendedBooks,
      searchedBooks: searchedBooks,
      topByGenreBooks: topByGenreBooks,
    );
  }
}
