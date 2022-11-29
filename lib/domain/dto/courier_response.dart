import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'courier_response.g.dart';

@HiveType(typeId: 5)
@JsonSerializable()
class CourierResponse extends Equatable {
  const CourierResponse({
    this.id,
    this.name,
  });

  factory CourierResponse.fromJson(Map<String, dynamic> json) =>
      _$CourierResponseFromJson(json);

  @HiveField(29)
  final String? id;
  @HiveField(30)
  final String? name;

  Map<String, dynamic> toJson() => _$CourierResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
      ];
}
