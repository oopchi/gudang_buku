import 'package:bookstore/util/json_helper.dart';
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
    this.releasedDate,
    this.promoId,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) =>
      _$BookResponseFromJson(json);

  final String? id;

  final String? title;

  final String? overview;

  final int? price;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? deletedAt;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? releasedDate;

  final String? promoId;

  Map<String, dynamic> toJson() => _$BookResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        overview,
        price,
        deletedAt,
        releasedDate,
      ];
}
