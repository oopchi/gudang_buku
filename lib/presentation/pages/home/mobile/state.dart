import 'package:bookstore/domain/model/book_response.dart';
import 'package:bookstore/domain/model/genre_response.dart';
import 'package:equatable/equatable.dart';

class HomeMobileState extends Equatable {
  const HomeMobileState();

  HomeMobileState init() {
    return const HomeMobileState();
  }

  HomeMobileState clone() {
    return const HomeMobileState();
  }

  @override
  List<Object?> get props => <Object?>[];
}

class HomeMobileFailure extends HomeMobileState {
  const HomeMobileFailure({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => <Object?>[];
}

class HomeMobileLoaded extends HomeMobileState {
  const HomeMobileLoaded({
    required this.selectedGenre,
    required this.newArrivalBooks,
    required this.popularBooks,
    required this.recommendedBooks,
    required this.searchedBooks,
    required this.topByGenreBooks,
  });

  final GenreResponse selectedGenre;
  final List<BookResponse> topByGenreBooks;
  final List<BookResponse> newArrivalBooks;
  final List<BookResponse> recommendedBooks;
  final List<BookResponse> popularBooks;
  final List<BookResponse> searchedBooks;

  @override
  List<Object?> get props => <Object?>[];
}
