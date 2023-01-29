import 'package:gudang_buku/domain/dto/image_data.pb.dart';
import 'package:equatable/equatable.dart';
import 'package:gudang_buku/util/discount_helper.dart';

class PromoCodeModel extends Equatable {
  const PromoCodeModel({
    required this.id,
    required this.code,
    required this.createdAt,
    required this.discountAmount,
    required this.discountType,
    this.expirationDate,
    required this.maximumDiscountAmount,
    required this.minimumPurchaseAmount,
    required this.numOfUse,
    required this.promoClassID,
    this.updatedAt,
    this.file,
  });

  final int id;
  final String code;
  final double discountAmount;
  final DiscountType discountType;
  final DateTime? expirationDate;
  final double minimumPurchaseAmount;
  final double maximumDiscountAmount;
  final int numOfUse;
  final int promoClassID;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final ImageData? file;

  @override
  List<Object?> get props => <Object?>[
        id,
        code,
        discountAmount,
        discountType,
        expirationDate,
        minimumPurchaseAmount,
        maximumDiscountAmount,
        numOfUse,
        promoClassID,
        createdAt,
        updatedAt,
        file,
      ];
}
