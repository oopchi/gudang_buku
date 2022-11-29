import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_picture_response.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class ReviewPictureResponse extends Equatable {
  const ReviewPictureResponse({
    this.id,
    this.url,
    this.reviewId,
    this.allowedMediaId,
  });

  factory ReviewPictureResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewPictureResponseFromJson(json);

  @HiveField(206)
  final String? id;
  @HiveField(207)
  final String? url;
  @HiveField(208)
  final String? reviewId;
  @HiveField(209)
  final String? allowedMediaId;

  Map<String, dynamic> toJson() => _$ReviewPictureResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        url,
        reviewId,
        allowedMediaId,
      ];
}
