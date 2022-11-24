import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'author_response.g.dart';

@JsonSerializable()
class AuthorResponse extends Equatable {
  const AuthorResponse({
    this.id,
    this.name,
    this.description,
  });

  factory AuthorResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthorResponseFromJson(json);

  final int? id;
  final String? name;
  final String? description;

  Map<String, dynamic> toJson() => _$AuthorResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
      ];
}
