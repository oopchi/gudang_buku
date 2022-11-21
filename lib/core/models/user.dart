import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  const User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.receivedEventsUrl,
    this.type,
    this.score,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.eventsUrl,
    this.siteAdmin,
  });

  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? receivedEventsUrl;
  final String? type;
  final double? score;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? eventsUrl;
  final bool? siteAdmin;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
