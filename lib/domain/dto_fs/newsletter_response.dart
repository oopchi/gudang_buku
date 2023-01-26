import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'newsletter_response.g.dart';

@JsonSerializable()
class NewsletterResponse extends Equatable {
  const NewsletterResponse({
    this.id,
    this.email,
  });

  factory NewsletterResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsletterResponseFromJson(json);

  final String? id;
  final String? email;

  Map<String, dynamic> toJson() => _$NewsletterResponseToJson(this);

  @override
  List<Object?> get props => <Object?>[
        id,
        email,
      ];
}
