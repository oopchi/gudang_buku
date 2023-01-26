import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_picture_response.g.dart';

@JsonSerializable()
class ReviewPictureResponse extends Equatable {
  const ReviewPictureResponse({
    this.id,
    this.allowedMediaId,
    this.reviewId,
    this.url,
  });

  factory ReviewPictureResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewPictureResponseFromJson(json);

  final String? id;
  final String? url;
  final String? reviewId;
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
