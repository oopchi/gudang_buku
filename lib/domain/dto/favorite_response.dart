import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_response.g.dart';

@JsonSerializable()
class FavoriteResponse extends Equatable {
  const FavoriteResponse({
    this.id,
    this.bookId,
    this.userId,
  });

  factory FavoriteResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoriteResponseFromJson(json);

  final String? id;
  final String? bookId;
  final String? userId;

  Map<String, dynamic> toJson() => _$FavoriteResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        bookId,
        userId,
      ];
}
