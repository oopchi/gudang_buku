import 'package:bookstore/domain/model/discount_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_discount_response.g.dart';

@HiveType(typeId: 14)
@JsonSerializable()
class UserDiscountResponse extends Equatable {
  const UserDiscountResponse({
    this.id,
    this.discount,
    this.numUsed,
    this.claimDate,
  });

  factory UserDiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDiscountResponseFromJson(json);

  @HiveField(74)
  final String? id;
  @HiveField(76)
  final DiscountResponse? discount;
  @HiveField(77)
  final int? numUsed;
  @HiveField(78)
  final DateTime? claimDate;

  Map<String, dynamic> toJson() => _$UserDiscountResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        discount,
        numUsed,
        claimDate,
      ];
}
