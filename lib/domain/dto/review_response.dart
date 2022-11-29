import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_response.g.dart';

@HiveType(typeId: 0)
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

  @HiveField(200)
  final String? id;
  @HiveField(201)
  final String? content;
  @HiveField(202)
  final DateTime? date;
  @HiveField(203)
  final double? stars;
  @HiveField(204)
  final String? bookId;
  @HiveField(205)
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
