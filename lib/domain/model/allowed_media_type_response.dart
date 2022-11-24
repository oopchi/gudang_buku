import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'allowed_media_type_response.g.dart';

@JsonSerializable()
class AllowedMediaTypeResponse extends Equatable {
  const AllowedMediaTypeResponse({
    this.id,
    this.mediaType,
    this.extension,
    this.maxSizeByte,
  });

  factory AllowedMediaTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$AllowedMediaTypeResponseFromJson(json);

  final int? id;
  final String? mediaType;
  final String? extension;
  final double? maxSizeByte;

  Map<String, dynamic> toJson() => _$AllowedMediaTypeResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        mediaType,
        extension,
        maxSizeByte,
      ];
}
