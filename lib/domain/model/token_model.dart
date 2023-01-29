import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class TokenModel extends Equatable {
  const TokenModel({
    required this.token,
    required this.expiresAt,
  });

  @HiveField(12)
  final String token;
  @HiveField(13)
  final DateTime expiresAt;

  @override
  List<Object?> get props => <Object?>[
        token,
        expiresAt,
      ];
}
