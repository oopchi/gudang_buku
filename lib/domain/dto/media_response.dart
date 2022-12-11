import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_response.g.dart';

@JsonSerializable()
class MediaResponse extends Equatable {
  const MediaResponse({
    this.id,
    this.url,
    this.mediaType,
    this.bookId,
  });

  factory MediaResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaResponseFromJson(json);

  final String? id;

  final String? url;

  final String? bookId;

  final String? mediaType;

  Map<String, dynamic> toJson() => _$MediaResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        url,
        mediaType,
        bookId,
      ];
}
