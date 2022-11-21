import 'package:json_annotation/json_annotation.dart';

part 'pull_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PullRequest {
  const PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) =>
      _$PullRequestFromJson(json);

  final String? url;
  final String? htmlUrl;
  final String? diffUrl;
  final String? patchUrl;

  Map<String, dynamic> toJson() => _$PullRequestToJson(this);
}
