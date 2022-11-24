import 'package:bookstore/domain/model/transaction_response.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

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

  final int? id;
  final DateTime? sentAt;
  final String? content;
  final TransactionResponse? transaction;
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
