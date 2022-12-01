import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  const UserResponse({
    this.id,
    this.meritAmount,
    this.roleId,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  final String? id;
  final int? meritAmount;
  final String? roleId;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        meritAmount,
        roleId,
      ];

  UserResponse copyWith({
    int? meritAmount,
    String? roleId,
  }) {
    return UserResponse(
      id: id,
      meritAmount: meritAmount,
      roleId: roleId,
    );
  }

  static UserResponse newUserResponse({
    required String id,
    int? meritAmount,
    String? roleId,
  }) {
    return UserResponse(
      id: id,
      meritAmount: meritAmount,
      roleId: roleId,
    );
  }
}
