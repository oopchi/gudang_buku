import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_discount_response.g.dart';

@JsonSerializable()
class UserDiscountResponse extends Equatable {
  const UserDiscountResponse({
    this.id,
    this.discountId,
    this.numUsed,
  });

  factory UserDiscountResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDiscountResponseFromJson(json);

  final String? id;

  final String? discountId;

  final int? numUsed;

  Map<String, dynamic> toJson() => _$UserDiscountResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        discountId,
        numUsed,
      ];
}
