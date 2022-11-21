import 'package:json_annotation/json_annotation.dart';
import 'package:bookstore/core/models/label.dart';
import 'package:bookstore/core/models/milestone.dart';
import 'package:bookstore/core/models/pull_request.dart';
import 'package:bookstore/core/models/user.dart';

part 'issue.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Issue {
  const Issue({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.assignee,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.pullRequest,
    this.body,
    this.score,
    this.locked,
    this.authorAssociation,
    this.stateReason,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  final String? url;
  final String? repositoryUrl;
  final String? labelsUrl;
  final String? commentsUrl;
  final String? eventsUrl;
  final String? htmlUrl;
  final int? id;
  final String? nodeId;
  final int? number;
  final String? title;
  final User? user;
  final List<Label>? labels;
  final IssueState? state;
  final User? assignee;
  final Milestone? milestone;
  final int? comments;
  final String? createdAt;
  final String? updatedAt;
  final String? closedAt;
  final PullRequest? pullRequest;
  final String? body;
  final double? score;
  final bool? locked;
  final String? authorAssociation;
  final String? stateReason;

  Map<String, dynamic> toJson() => _$IssueToJson(this);
}

@JsonEnum()
enum IssueState {
  @JsonValue('open')
  open,
  @JsonValue('closed')
  closed,
}

extension IssueStateExtension on IssueState {
  static final Map<IssueState, String> _text = <IssueState, String>{
    IssueState.open: 'Open',
    IssueState.closed: 'Closed',
  };

  String get text => _text[this]!;

  bool get isOpen => this == IssueState.open;
  bool get isClosed => this == IssueState.closed;
}
