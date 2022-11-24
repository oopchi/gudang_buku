import 'package:bookstore/domain/model/address_response.dart';
import 'package:bookstore/domain/model/courier_response.dart';
import 'package:bookstore/domain/model/discount_response.dart';
import 'package:bookstore/domain/model/payment_method_response.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_response.g.dart';

@JsonSerializable()
class TransactionResponse extends Equatable {
  const TransactionResponse({
    this.id,
    this.address,
    this.checkedOutAt,
    this.complaintHandler,
    this.complaintResolvedAt,
    this.complaintStartedAt,
    this.courier,
    this.discount,
    this.paymentMethod,
    this.resiNumber,
    this.status,
    this.user,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  final int? id;
  final DateTime? checkedOutAt;
  final String? status;
  final PaymentMethodResponse? paymentMethod;
  final CourierResponse? courier;
  final DateTime? complaintStartedAt;
  final DateTime? complaintResolvedAt;
  final UserResponse? complaintHandler;
  final String? resiNumber;
  final UserResponse? user;
  final DiscountResponse? discount;
  final AddressResponse? address;

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        checkedOutAt,
        status,
        paymentMethod,
        courier,
        complaintStartedAt,
        complaintResolvedAt,
        complaintHandler,
        resiNumber,
        user,
        discount,
        address,
      ];
}
