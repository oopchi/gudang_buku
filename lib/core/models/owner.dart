import 'package:json_annotation/json_annotation.dart';

part 'owner.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Owner {
  const Owner({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.receivedEventsUrl,
    this.type,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.siteAdmin,
  });
  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? receivedEventsUrl;
  final String? type;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final bool? siteAdmin;

  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
