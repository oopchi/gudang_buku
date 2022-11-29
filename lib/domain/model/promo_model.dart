import 'package:bookstore/domain/model/product_card_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PromoModel extends Equatable {
  const PromoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.productCardModels,
    this.dateTimeRange,
    required this.amount,
    required this.amountType,
  });

  final String id;
  final String title;
  final String description;
  final List<ProductCardModel> productCardModels;
  final DateTimeRange? dateTimeRange;
  final int amount;
  final String amountType;

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        description,
        productCardModels,
        dateTimeRange,
        amount,
        amountType,
      ];
}
