import 'package:bookstore/util/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse extends Equatable {
  const ReviewResponse({
    this.id,
    this.content,
    this.date,
    this.stars,
    this.bookId,
    this.userId,
  });

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  final String? id;

  final String? content;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? date;

  final double? stars;

  final String? bookId;

  final String? userId;

  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        content,
        date,
        stars,
        bookId,
        userId,
      ];
}
