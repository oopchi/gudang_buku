import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends Equatable {
  const UserResponse({
    this.id,
    this.meritAmount,
    this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  final String? id;
  final int? meritAmount;
  final String? role;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        meritAmount,
        role,
      ];

  UserResponse copyWith({
    int? meritAmount,
    String? role,
  }) {
    return UserResponse(
      id: id,
      meritAmount: meritAmount,
      role: role,
    );
  }

  static UserResponse newUserResponse({
    required String id,
    int? meritAmount,
    String? role,
  }) {
    return UserResponse(
      id: id,
      meritAmount: meritAmount,
      role: role,
    );
  }
}
