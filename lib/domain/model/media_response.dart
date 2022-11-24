import 'package:bookstore/domain/model/allowed_media_type_response.dart';
import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media_response.g.dart';

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

  final int? id;
  final String? url;
  final BookResponse? book;
  final AllowedMediaTypeResponse? allowedMediaType;
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
