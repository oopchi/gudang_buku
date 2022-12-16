import 'package:gudang_buku/util/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse extends Equatable {
  const ChatResponse({
    this.id,
    this.content,
    this.sentAt,
    this.transactionId,
    this.userId,
  });

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  final String? id;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? sentAt;

  final String? content;

  final String? transactionId;

  final String? userId;

  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        sentAt,
        content,
        transactionId,
        userId,
      ];
}
