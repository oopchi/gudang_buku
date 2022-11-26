import 'package:bookstore/domain/model/address_response.dart';
import 'package:bookstore/domain/model/courier_response.dart';
import 'package:bookstore/domain/model/discount_response.dart';
import 'package:bookstore/domain/model/payment_method_response.dart';
import 'package:bookstore/domain/model/transaction_detail_response.dart';
import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_response.g.dart';

@HiveType(typeId: 13)
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
    this.transactionDetails,
  });

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  @HiveField(62)
  final String? id;
  @HiveField(63)
  final DateTime? checkedOutAt;
  @HiveField(64)
  final String? status;
  @HiveField(65)
  final PaymentMethodResponse? paymentMethod;
  @HiveField(66)
  final CourierResponse? courier;
  @HiveField(67)
  final DateTime? complaintStartedAt;
  @HiveField(68)
  final DateTime? complaintResolvedAt;
  @HiveField(69)
  final UserResponse? complaintHandler;
  @HiveField(70)
  final String? resiNumber;
  @HiveField(71)
  final UserResponse? user;
  @HiveField(72)
  final DiscountResponse? discount;
  @HiveField(73)
  final AddressResponse? address;
  @HiveField(88)
  final List<TransactionDetailResponse?>? transactionDetails;

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
        transactionDetails,
      ];
}
