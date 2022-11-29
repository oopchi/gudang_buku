import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_response.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class AuthorResponse extends Equatable {
  const AuthorResponse({
    this.id,
    this.name,
    this.description,
  });

  factory AuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorResponseFromJson(json);

  @HiveField(13)
  final String? id;
  @HiveField(14)
  final String? name;
  @HiveField(15)
  final String? description;

  Map<String, dynamic> toJson() => _$AuthorResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
      ];
}
