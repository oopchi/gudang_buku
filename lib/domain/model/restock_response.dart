import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restock_response.g.dart';

@HiveType(typeId: 10)
@JsonSerializable()
class RestockResponse extends Equatable {
  const RestockResponse({
    this.id,
    this.arrivedAt,
    this.book,
    this.quantity,
  });

  factory RestockResponse.fromJson(Map<String, dynamic> json) =>
      _$RestockResponseFromJson(json);

  @HiveField(52)
  final String? id;
  @HiveField(53)
  final DateTime? arrivedAt;
  @HiveField(54)
  final int? quantity;
  @HiveField(55)
  final BookResponse? book;

  Map<String, dynamic> toJson() => _$RestockResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        arrivedAt,
        quantity,
        book,
      ];
}
