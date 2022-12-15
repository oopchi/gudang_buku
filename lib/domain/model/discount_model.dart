import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DiscountModel extends Equatable {
  const DiscountModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.amountType,
    required this.code,
    required this.imageUrl,
    required this.minAmount,
    this.maxUse,
    this.maxAmount,
    this.dateTimeRange,
  });

  final String id;

  final String name;

  final int? maxUse;

  final String amountType;

  final String code;

  final int amount;

  final int minAmount;

  final int? maxAmount;

  final String imageUrl;

  final DateTimeRange? dateTimeRange;

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        maxUse,
        amountType,
        code,
        amount,
        minAmount,
        maxAmount,
        imageUrl,
        dateTimeRange,
      ];
}
