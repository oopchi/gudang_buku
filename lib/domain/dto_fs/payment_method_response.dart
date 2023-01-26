import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method_response.g.dart';

@JsonSerializable()
class PaymentMethodResponse extends Equatable {
  const PaymentMethodResponse({
    this.id,
    this.name,
  });

  factory PaymentMethodResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodResponseFromJson(json);

  final String? id;

  final String? name;

  Map<String, dynamic> toJson() => _$PaymentMethodResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
