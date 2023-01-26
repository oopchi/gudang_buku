import 'package:equatable/equatable.dart';
import 'package:gudang_buku/domain/model/book_model.dart';

class DiscountModel extends Equatable {
  const DiscountModel({
    required this.id,
    required this.createdAt,
    required this.discountAmount,
    required this.discountType,
    this.expirationDate,
    this.maximumDiscountAmount,
    this.numOfUse,
    this.updatedAt,
    required this.books,
  });

  final int id;
  final double discountAmount;
  final double? maximumDiscountAmount;
  final String discountType;
  final DateTime? expirationDate;
  final int? numOfUse;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final List<BookModel> books;

  @override
  List<Object?> get props => <Object?>[
        id,
        createdAt,
        discountAmount,
        discountType,
        expirationDate,
        maximumDiscountAmount,
        numOfUse,
        updatedAt,
        books,
      ];
}
