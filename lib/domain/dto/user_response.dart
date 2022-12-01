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
    this.avatarUrl,
    this.roleId,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  final String? id;

  final String? name;

  final String? email;

  final String? password;

  final String? rememberToken;

  final String? phoneNumber;

  final int? meritAmount;

  final String? roleId;

  final String? avatarUrl;

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
        roleId,
        avatarUrl,
      ];

  static UserResponse newUserResponse({
    required String id,
    String? email,
    int? meritAmount,
    String? name,
    String? password,
    String? phoneNumber,
    String? rememberToken,
    String? roleId,
    String? avatarUrl,
  }) {
    return UserResponse(
      id: id,
      email: email,
      meritAmount: meritAmount,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
      rememberToken: rememberToken,
      roleId: roleId,
      avatarUrl: avatarUrl,
    );
  }
}
