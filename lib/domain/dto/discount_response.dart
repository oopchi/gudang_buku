import 'package:bookstore/domain/dto/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'discount_response.g.dart';

@HiveType(typeId: 6)
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

  @HiveField(31)
  final String? id;
  @HiveField(32)
  final String? name;
  @HiveField(33)
  final int? maxUse;
  @HiveField(34)
  final String? discountType;
  @HiveField(35)
  final String? description;
  @HiveField(36)
  final int? amount;
  @HiveField(37)
  final String? rewardType;
  @HiveField(38)
  final UserResponse? issuer;
  @HiveField(39)
  final int? requiredMerit;
  @HiveField(40)
  final DateTime? startDate;
  @HiveField(41)
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
