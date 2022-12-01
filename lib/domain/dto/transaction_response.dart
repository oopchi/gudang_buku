import 'package:bookstore/util/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse extends Equatable {
  const TransactionResponse({
    this.id,
    this.addressId,
    this.checkedOutAt,
    this.complaintHandlerId,
    this.complaintResolvedAt,
    this.complaintStartedAt,
    this.courierId,
    this.discountId,
    this.paymentMethodId,
    this.resiNumber,
    this.status,
    this.userId,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  final String? id;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? checkedOutAt;

  final String? status;

  final String? paymentMethodId;

  final String? courierId;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? complaintStartedAt;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? complaintResolvedAt;

  final String? complaintHandlerId;

  final String? resiNumber;

  final String? userId;

  final String? discountId;

  final String? addressId;

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        checkedOutAt,
        status,
        paymentMethodId,
        courierId,
        complaintStartedAt,
        complaintResolvedAt,
        complaintHandlerId,
        resiNumber,
        userId,
        discountId,
        addressId,
      ];
}
