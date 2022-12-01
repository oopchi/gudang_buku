import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_genre_response.g.dart';

@JsonSerializable()
class BookGenreResponse extends Equatable {
  const BookGenreResponse({
    this.id,
    this.bookId,
    this.genreId,
  });

  factory BookGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$BookGenreResponseFromJson(json);

  final String? id;
  final String? bookId;
  final String? genreId;

  Map<String, dynamic> toJson() => _$BookGenreResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        bookId,
        genreId,
      ];
}
