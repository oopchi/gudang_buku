import 'package:bookstore/domain/model/role_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  const UserResponse({
    this.id,
    this.name,
    this.email,
    this.password,
    this.rememberToken,
    this.phoneNumber,
    this.meritAmount,
    this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? rememberToken;
  final String? phoneNumber;
  final int? meritAmount;
  final RoleResponse? role;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        email,
        password,
        rememberToken,
        phoneNumber,
        meritAmount,
        role,
      ];
}
