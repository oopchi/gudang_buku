import 'package:bookstore/domain/model/genre_response.dart';
import 'package:equatable/equatable.dart';

class GenreState extends Equatable {
  const GenreState();

  GenreState init() {
    return const GenreState();
  }

  GenreState clone() {
    return const GenreState();
  }

  @override
  List<Object?> get props => [];
}

class GenreLoaded extends GenreState {
  final List<GenreResponse> genres;

  const GenreLoaded({
    required this.genres,
  });

  @override
  List<Object?> get props => <Object?>[
        genres,
      ];
}
