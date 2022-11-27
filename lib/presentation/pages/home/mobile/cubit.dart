import 'package:bookstore/domain/controller/book_controller.dart';
import 'package:bookstore/domain/controller/user_controller.dart';
import 'package:bookstore/domain/model/user_response.dart';
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
    required UserController userController,
    required BookController bookController,
  })  : _genreRepository = genreRepository,
        _bookController = bookController,
        _userController = userController,
        _bookRepository = bookRepository,
        super(const HomeMobileState().init());

  final GenreRepository _genreRepository;
  final BookRepository _bookRepository;
  final UserController _userController;
  final BookController _bookController;

  Future<void> load() async {
    emit(const HomeMobileLoading());

    late final List<GenreResponse> genreOptions;
    late final List<BookResponse> bookResponses;
    late final List<BookResponse> popularBooks;
    late final List<BookResponse> newArrivalBooks;
    late final UserResponse userResponse;
    late final GenreResponse selectedGenre;

    final Either<Failure, UserResponse> userRes =
        await _userController.loadUser();

    userRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (UserResponse r) => userResponse = r,
    );

    if (state is! HomeMobileLoading) return;

    final Either<Failure, List<GenreResponse>> genreRes =
        await _genreRepository.fetchAllGenres();

    genreRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<GenreResponse> r) => genreOptions = r,
    );

    if (genreOptions.isNotEmpty) {
      selectedGenre = genreOptions[0];
    } else {
      selectedGenre = const GenreResponse();
    }

    if (state is! HomeMobileLoading) return;

    final Either<Failure, List<BookResponse>> bookRes =
        await _bookRepository.fetchAllBooksWithLimit();

    bookRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<BookResponse> r) => bookResponses = r,
    );

    if (state is! HomeMobileLoading) return;

    final Either<Failure, List<BookResponse>> popularBookRes =
        await _bookController.getPopularBooks(bookResponses);

    popularBookRes.fold(
      (Failure l) => emit(
        HomeMobileFailure(
          message: l.message,
        ),
      ),
      (List<BookResponse> r) => popularBooks = r,
    );

    if (state is! HomeMobileLoading) return;

    newArrivalBooks = _bookController.getNewArrivals(bookResponses);

    final HomeMobileLoaded model = HomeMobileLoaded(
      userResponse: userResponse,
      selectedGenre: selectedGenre,
      newArrivalBooks: newArrivalBooks,
      popularBooks: popularBooks,
      recommendedBooks: bookResponses,
      searchedBooks: bookResponses,
      topByGenreBooks: bookResponses,
      genreOptions: genreOptions,
    );

    emit(model);
  }
}
