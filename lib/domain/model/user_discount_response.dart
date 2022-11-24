import 'package:bookstore/domain/model/discount_response.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_discount_response.g.dart';

@JsonSerializable()
class UserDiscountResponse extends Equatable {
  const UserDiscountResponse({
    this.id,
    this.user,
    this.discount,
    this.numUsed,
    this.claimDate,
  });

  factory UserDiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDiscountResponseFromJson(json);

  final int? id;
  final UserResponse? user;
  final DiscountResponse? discount;
  final int? numUsed;
  final DateTime? claimDate;

  Map<String, dynamic> toJson() => _$UserDiscountResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        user,
        discount,
        numUsed,
        claimDate,
      ];
}
