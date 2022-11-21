import 'package:json_annotation/json_annotation.dart';
import 'package:bookstore/core/models/issue.dart';

part 'issues.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Issues {
  const Issues({
    this.totalCount,
    this.incompleteResults,
    this.items,
    this.message,
    this.documentationUrl,
  });

  factory Issues.fromJson(Map<String, dynamic> json) => _$IssuesFromJson(json);

  final int? totalCount;
  final bool? incompleteResults;
  final List<Issue>? items;
  final String? message;
  final String? documentationUrl;

  Map<String, dynamic> toJson() => _$IssuesToJson(this);
}
