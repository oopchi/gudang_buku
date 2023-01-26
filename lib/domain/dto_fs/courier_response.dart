import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'courier_response.g.dart';

@JsonSerializable()
class CourierResponse extends Equatable {
  const CourierResponse({
    this.id,
    this.name,
  });

  factory CourierResponse.fromJson(Map<String, dynamic> json) =>
      _$CourierResponseFromJson(json);

  final String? id;

  final String? name;

  Map<String, dynamic> toJson() => _$CourierResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
