import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'amount_type_response.g.dart';

@JsonSerializable()
class AmountTypeResponse extends Equatable {
  const AmountTypeResponse({
    this.id,
    this.name,
  });

  factory AmountTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$AmountTypeResponseFromJson(json);

  final String? id;
  final String? name;

  Map<String, dynamic> toJson() => _$AmountTypeResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
