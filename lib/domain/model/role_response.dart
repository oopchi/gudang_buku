import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role_response.g.dart';

@HiveType(typeId: 11)
@JsonSerializable()
class RoleResponse extends Equatable {
  const RoleResponse({
    this.id,
    this.name,
  });

  factory RoleResponse.fromJson(Map<String, dynamic> json) =>
      _$RoleResponseFromJson(json);

  @HiveField(56)
  final String? id;
  @HiveField(57)
  final String? name;

  Map<String, dynamic> toJson() => _$RoleResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
