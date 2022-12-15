import 'package:gudangBuku/util/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'promo_response.g.dart';

@JsonSerializable()
class PromoResponse extends Equatable {
  const PromoResponse({
    this.id,
    this.amount,
    this.description,
    this.endDate,
    this.name,
    this.amountTypeId,
    this.startDate,
  });

  factory PromoResponse.fromJson(Map<String, dynamic> json) =>
      _$PromoResponseFromJson(json);

  final String? id;

  final String? name;

  final String? description;

  final String? amountTypeId;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? startDate;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? endDate;

  final int? amount;

  Map<String, dynamic> toJson() => _$PromoResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
        amountTypeId,
        startDate,
        endDate,
        amount,
      ];
}
