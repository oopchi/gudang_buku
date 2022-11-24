import 'package:bookstore/domain/model/author_response.dart';
import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_author_response.g.dart';

@JsonSerializable()
class BookAuthorResponse extends Equatable {
  const BookAuthorResponse({
    this.id,
    this.author,
    this.book,
  });

  factory BookAuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$BookAuthorResponseFromJson(json);

  final int? id;
  final BookResponse? book;
  final AuthorResponse? author;

  Map<String, dynamic> toJson() => _$BookAuthorResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        author,
        book,
      ];
}
