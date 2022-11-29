import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'allowed_media_type_response.g.dart';

@HiveType(typeId: 1)
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

  @HiveField(9)
  final String? id;
  @HiveField(10)
  final String? mediaType;
  @HiveField(11)
  final String? extension;
  @HiveField(12)
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
