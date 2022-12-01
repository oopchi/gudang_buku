import 'package:bookstore/util/json_helper.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable()
class EventResponse extends Equatable {
  const EventResponse({
    this.id,
    this.name,
    this.description,
    this.endDate,
    this.startDate,
    this.coverUrl,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);

  final String? id;

  final String? name;

  final String? description;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? startDate;

  @JsonKey(
    fromJson: JsonHelper.fromTimestamp,
    toJson: JsonHelper.toTimestamp,
  )
  final DateTime? endDate;

  final String? coverUrl;

  Map<String, dynamic> toJson() => _$EventResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
        startDate,
        endDate,
        coverUrl,
      ];
}
