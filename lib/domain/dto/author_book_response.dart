import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_book_response.g.dart';

@JsonSerializable()
class AuthorBookResponse extends Equatable {
  const AuthorBookResponse({
    this.id,
    this.bookId,
    this.authorId,
  });

  factory AuthorBookResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorBookResponseFromJson(json);

  final String? id;
  final String? bookId;
  final String? authorId;

  Map<String, dynamic> toJson() => _$AuthorBookResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        bookId,
        authorId,
      ];
}
