import 'package:bookstore/domain/model/book_response.dart';
import 'package:bookstore/domain/model/genre_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_genre_response.g.dart';

@JsonSerializable()
class BookGenreResponse extends Equatable {
  const BookGenreResponse({
    this.id,
    this.book,
    this.genre,
  });

  factory BookGenreResponse.fromJson(Map<String, dynamic> json) =>
      _$BookGenreResponseFromJson(json);

  final int? id;
  final BookResponse? book;
  final GenreResponse? genre;

  Map<String, dynamic> toJson() => _$BookGenreResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        book,
        genre,
      ];
}
