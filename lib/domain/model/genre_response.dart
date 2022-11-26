import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@HiveType(typeId: 7)
@JsonSerializable()
class GenreResponse extends Equatable {
  const GenreResponse({
    this.id,
    this.name,
    this.books,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  @HiveField(42)
  final String? id;
  @HiveField(43)
  final String? name;
  @HiveField(44)
  final List<BookResponse?>? books;

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        books,
      ];
}
