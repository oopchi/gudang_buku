import 'package:bookstore/domain/model/author_response.dart';
import 'package:bookstore/domain/model/genre_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class BookResponse extends Equatable {
  const BookResponse({
    this.id,
    this.title,
    this.overview,
    this.price,
    this.deletedAt,
    this.releasedDate,
    this.authors,
    this.genres,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);

  @HiveField(16)
  final String? id;
  @HiveField(17)
  final String? title;
  @HiveField(18)
  final String? overview;
  @HiveField(19)
  final int? price;
  @HiveField(20)
  final DateTime? deletedAt;
  @HiveField(21)
  final DateTime? releasedDate;
  @HiveField(22)
  final List<AuthorResponse?>? authors;
  @HiveField(23)
  final List<GenreResponse?>? genres;

  Map<String, dynamic> toJson() => _$BookResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        overview,
        price,
        deletedAt,
        releasedDate,
        authors,
        genres,
      ];
}
