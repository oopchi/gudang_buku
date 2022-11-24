import 'package:bookstore/domain/model/user_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_response.g.dart';

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

  final int? id;
  final String? name;
  final String? streetDetail;
  final int? provinceId;
  final int? cityId;
  final int? subdistrictId;
  final int? nationId;
  final String? phoneNumber;
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
