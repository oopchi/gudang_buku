import 'package:gudang_buku/util/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_response.g.dart';

@JsonSerializable()
class DiscountResponse extends Equatable {
  const DiscountResponse({
    this.id,
    this.name,
    this.maxUse,
    this.amountType,
    this.description,
    this.amount,
    this.issuerId,
    this.requiredMerit,
    this.startDate,
    this.endDate,
    this.minAmount,
    this.maxAmount,
    this.url,
  });

  factory DiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscountResponseFromJson(json);

  final String? id;

  final String? name;

  final int? maxUse;

  final String? amountType;

  final String? description;

  final int? amount;

  final String? issuerId;

  final int? requiredMerit;

  final int? minAmount;

  final int? maxAmount;

  final String? url;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? startDate;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? endDate;

  Map<String, dynamic> toJson() => _$DiscountResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        maxUse,
        amountType,
        description,
        amount,
        issuerId,
        requiredMerit,
        startDate,
        endDate,
        minAmount,
        maxAmount,
        url,
      ];
}
