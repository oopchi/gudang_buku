import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_response.g.dart';

@JsonSerializable()
class RoleResponse extends Equatable {
  const RoleResponse({
    this.id,
    this.name,
  });

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);

  final int? id;
  final String? name;

  Map<String, dynamic> toJson() => _$RoleResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
