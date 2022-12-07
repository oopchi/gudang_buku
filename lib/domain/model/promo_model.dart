import 'package:bookstore/domain/model/product_model.dart';
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
  final List<ProductModel> productCardModels;
  final DateTimeRange? dateTimeRange;
  final int amount;
  final String amountType;

  PromoModel copyWith({
    String? id,
    String? title,
    String? description,
    List<ProductModel>? productCardModels,
    DateTimeRange? dateTimeRange,
    int? amount,
    String? amountType,
  }) =>
      PromoModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        productCardModels: productCardModels ?? this.productCardModels,
        amount: amount ?? this.amount,
        amountType: amountType ?? this.amountType,
      );

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
