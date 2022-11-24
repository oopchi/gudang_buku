import 'package:bookstore/domain/model/book_response.dart';
import 'package:bookstore/domain/model/transaction_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_detail_response.g.dart';

@JsonSerializable()
class TransactionDetailResponse extends Equatable {
  const TransactionDetailResponse({
    this.id,
    this.book,
    this.quantity,
    this.transaction,
  });

  factory TransactionDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailResponseFromJson(json);

  final int? id;
  final int? quantity;
  final TransactionResponse? transaction;
  final BookResponse? book;

  Map<String, dynamic> toJson() => _$TransactionDetailResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        book,
        quantity,
        transaction,
      ];
}
