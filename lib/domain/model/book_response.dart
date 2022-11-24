import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_response.g.dart';

@JsonSerializable()
class BookResponse extends Equatable {
  const BookResponse({
    this.id,
    this.title,
    this.overview,
    this.price,
    this.deletedAt,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);

  final int? id;
  final String? title;
  final String? overview;
  final int? price;
  final DateTime? deletedAt;

  Map<String, dynamic> toJson() => _$BookResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        overview,
        price,
        deletedAt,
      ];
}
