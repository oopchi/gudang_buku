import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_detail_response.g.dart';

@HiveType(typeId: 12)
@JsonSerializable()
class TransactionDetailResponse extends Equatable {
  const TransactionDetailResponse({
    this.id,
    this.book,
    this.quantity,
  });

  factory TransactionDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionDetailResponseFromJson(json);

  @HiveField(58)
  final String? id;
  @HiveField(59)
  final int? quantity;
  @HiveField(61)
  final BookResponse? book;

  Map<String, dynamic> toJson() => _$TransactionDetailResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        book,
        quantity,
      ];
}
