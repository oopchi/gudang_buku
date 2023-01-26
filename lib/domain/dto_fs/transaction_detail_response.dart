import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_detail_response.g.dart';

@JsonSerializable()
class TransactionDetailResponse extends Equatable {
  const TransactionDetailResponse({
    this.id,
    this.bookId,
    this.quantity,
    this.transactionId,
  });

  factory TransactionDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailResponseFromJson(json);

  final String? id;

  final int? quantity;

  final String? bookId;

  final String? transactionId;

  Map<String, dynamic> toJson() => _$TransactionDetailResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        bookId,
        quantity,
        transactionId,
      ];
}
