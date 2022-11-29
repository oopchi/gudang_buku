import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/dto/role_response.dart';
import 'package:bookstore/domain/dto/user_discount_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@HiveType(typeId: 15)
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
    this.userDiscounts,
    this.favorites,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  @HiveField(79)
  final String? id;
  @HiveField(80)
  final String? name;
  @HiveField(81)
  final String? email;
  @HiveField(82)
  final String? password;
  @HiveField(83)
  final String? rememberToken;
  @HiveField(84)
  final String? phoneNumber;
  @HiveField(85)
  final int? meritAmount;
  @HiveField(86)
  final RoleResponse? role;
  @HiveField(87)
  final List<UserDiscountResponse?>? userDiscounts;
  @HiveField(88)
  final List<BookResponse?>? favorites;

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
        userDiscounts,
        favorites,
      ];

  static UserResponse newUserResponse({
    required String id,
    String? email,
    int? meritAmount,
    String? name,
    String? password,
    String? phoneNumber,
    String? rememberToken,
    RoleResponse? role,
    List<UserDiscountResponse?>? userDiscounts,
  }) {
    return UserResponse(
      id: id,
      email: email,
      meritAmount: meritAmount,
      name: name,
      password: password,
      phoneNumber: phoneNumber,
      rememberToken: rememberToken,
      role: role,
      userDiscounts: userDiscounts,
    );
  }
}
