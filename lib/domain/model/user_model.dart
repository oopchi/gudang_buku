import 'dart:ffi';

import 'package:gudang_buku/domain/model/token_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  const UserModel({
    this.email,
    required this.createdAt,
    this.emailVerified = false,
    required this.id,
    required this.name,
    this.password,
    this.phoneNum,
    this.phoneNumVerified = false,
    this.profilePicture,
    this.updatedAt,
    required this.accessToken,
    required this.refreshToken,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final List<int>? profilePicture;
  @HiveField(2)
  final String? email;
  @HiveField(3)
  final bool emailVerified;
  @HiveField(4)
  final String? password;
  @HiveField(5)
  final String name;
  @HiveField(6)
  final String? phoneNum;
  @HiveField(7)
  final bool phoneNumVerified;
  @HiveField(8)
  final DateTime createdAt;
  @HiveField(9)
  final DateTime? updatedAt;
  @HiveField(10)
  final TokenModel accessToken;
  @HiveField(11)
  final TokenModel refreshToken;
}
