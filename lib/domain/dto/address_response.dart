import 'package:bookstore/domain/dto/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class AddressResponse extends Equatable {
  const AddressResponse({
    this.id,
    this.name,
    this.streetDetail,
    this.provinceId,
    this.cityId,
    this.nationId,
    this.phoneNumber,
    this.subdistrictId,
    this.user,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? streetDetail;
  @HiveField(3)
  final int? provinceId;
  @HiveField(4)
  final int? cityId;
  @HiveField(5)
  final int? subdistrictId;
  @HiveField(6)
  final int? nationId;
  @HiveField(7)
  final String? phoneNumber;
  @HiveField(8)
  final UserResponse? user;

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        streetDetail,
        provinceId,
        cityId,
        subdistrictId,
        nationId,
        phoneNumber,
        user,
      ];
}
