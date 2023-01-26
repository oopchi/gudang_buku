import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse extends Equatable {
  const GenreResponse({
    this.id,
    this.name,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);

  final String? id;

  final String? name;

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
