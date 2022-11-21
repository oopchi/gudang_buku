import 'package:json_annotation/json_annotation.dart';
import 'package:bookstore/core/models/user.dart';

part 'milestone.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Milestone {
  const Milestone({
    this.url,
    this.htmlUrl,
    this.labelsUrl,
    this.id,
    this.nodeId,
    this.number,
    this.state,
    this.title,
    this.description,
    this.creator,
    this.openIssues,
    this.closedIssues,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.dueOn,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) =>
      _$MilestoneFromJson(json);

  final String? url;
  final String? htmlUrl;
  final String? labelsUrl;
  final int? id;
  final String? nodeId;
  final int? number;
  final String? state;
  final String? title;
  final String? description;
  final User? creator;
  final int? openIssues;
  final int? closedIssues;
  final String? createdAt;
  final String? updatedAt;
  final String? closedAt;
  final String? dueOn;

  Map<String, dynamic> toJson() => _$MilestoneToJson(this);
}
