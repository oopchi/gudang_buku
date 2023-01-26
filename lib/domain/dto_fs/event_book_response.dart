import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_book_response.g.dart';

@JsonSerializable()
class EventBookResponse extends Equatable {
  const EventBookResponse({
    this.id,
    this.bookId,
    this.eventId,
  });

  factory EventBookResponse.fromJson(Map<String, dynamic> json) =>
      _$EventBookResponseFromJson(json);

  final String? id;
  final String? bookId;
  final String? eventId;

  Map<String, dynamic> toJson() => _$EventBookResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        bookId,
        eventId,
      ];
}
