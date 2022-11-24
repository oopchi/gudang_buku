import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_response.g.dart';

@JsonSerializable()
class DiscountResponse extends Equatable {
  const DiscountResponse({
    this.id,
    this.name,
    this.maxUse,
    this.discountType,
    this.description,
    this.amount,
    this.rewardType,
    this.issuer,
    this.requiredMerit,
    this.startDate,
    this.endDate,
  });

  factory DiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscountResponseFromJson(json);

  final int? id;
  final String? name;
  final int? maxUse;
  final String? discountType;
  final String? description;
  final int? amount;
  final String? rewardType;
  final UserResponse? issuer;
  final int? requiredMerit;
  final DateTime? startDate;
  final DateTime? endDate;

  Map<String, dynamic> toJson() => _$DiscountResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        maxUse,
        discountType,
        description,
        amount,
        rewardType,
        issuer,
        requiredMerit,
        startDate,
        endDate,
      ];
}
