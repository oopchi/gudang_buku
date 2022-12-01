import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'allowed_media_response.g.dart';

@JsonSerializable()
class AllowedMediaResponse extends Equatable {
  const AllowedMediaResponse({
    this.id,
    this.mediaType,
    this.extension,
    this.maxSizeByte,
  });

  factory AllowedMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$AllowedMediaResponseFromJson(json);

  final String? id;

  final String? mediaType;

  final String? extension;

  final double? maxSizeByte;

  Map<String, dynamic> toJson() => _$AllowedMediaResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        mediaType,
        extension,
        maxSizeByte,
      ];
}
