import 'package:bookstore/domain/model/transaction_response.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class ChatResponse extends Equatable {
  const ChatResponse({
    this.id,
    this.content,
    this.sentAt,
    this.transaction,
    this.user,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  @HiveField(24)
  final String? id;
  @HiveField(25)
  final DateTime? sentAt;
  @HiveField(26)
  final String? content;
  @HiveField(27)
  final TransactionResponse? transaction;
  @HiveField(28)
  final UserResponse? user;

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        sentAt,
        content,
        transaction,
        user,
      ];
}
