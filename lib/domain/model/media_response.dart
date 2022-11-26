import 'package:bookstore/domain/model/allowed_media_type_response.dart';
import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_response.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class MediaResponse extends Equatable {
  const MediaResponse({
    this.id,
    this.url,
    this.allowedMediaType,
    this.book,
    this.isCover,
  });

  factory MediaResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaResponseFromJson(json);

  @HiveField(45)
  final String? id;
  @HiveField(46)
  final String? url;
  @HiveField(47)
  final BookResponse? book;
  @HiveField(48)
  final AllowedMediaTypeResponse? allowedMediaType;
  @HiveField(49)
  final bool? isCover;

  Map<String, dynamic> toJson() => _$MediaResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        url,
        book,
        allowedMediaType,
        isCover,
      ];
}
