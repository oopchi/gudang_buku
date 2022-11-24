import 'package:bookstore/domain/model/book_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restock_response.g.dart';

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

  final int? id;
  final DateTime? arrivedAt;
  final int? quantity;
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
