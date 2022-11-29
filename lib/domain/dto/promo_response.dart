import 'package:bookstore/domain/dto/book_response.dart';
import 'package:bookstore/domain/dto/role_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promo_response.g.dart';

@HiveType(typeId: 20)
@JsonSerializable()
class PromoResponse extends Equatable {
  const PromoResponse({
    this.id,
    this.amount,
    this.description,
    this.endDate,
    this.name,
    this.promoType,
    this.startDate,
  });

  factory PromoResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoResponseFromJson(json);

  @HiveField(100)
  final String? id;
  @HiveField(101)
  final String? name;
  @HiveField(102)
  final String? description;
  @HiveField(103)
  final String? promoType;
  @HiveField(104)
  final DateTime? startDate;
  @HiveField(105)
  final DateTime? endDate;
  @HiveField(106)
  final int? amount;

  Map<String, dynamic> toJson() => _$PromoResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
        promoType,
        startDate,
        endDate,
        amount,
      ];
}
