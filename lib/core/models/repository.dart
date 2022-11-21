import 'package:json_annotation/json_annotation.dart';
import 'package:bookstore/core/models/license.dart';
import 'package:bookstore/core/models/owner.dart';

part 'repository.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Repository {
  const Repository({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.owner,
    this.private,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.forksCount,
    this.openIssuesCount,
    this.masterBranch,
    this.defaultBranch,
    this.score,
    this.archiveUrl,
    this.assigneesUrl,
    this.blobsUrl,
    this.branchesUrl,
    this.collaboratorsUrl,
    this.commentsUrl,
    this.commitsUrl,
    this.compareUrl,
    this.contentsUrl,
    this.contributorsUrl,
    this.deploymentsUrl,
    this.downloadsUrl,
    this.eventsUrl,
    this.forksUrl,
    this.gitCommitsUrl,
    this.gitRefsUrl,
    this.gitTagsUrl,
    this.gitUrl,
    this.issueCommentUrl,
    this.issueEventsUrl,
    this.issuesUrl,
    this.keysUrl,
    this.labelsUrl,
    this.languagesUrl,
    this.mergesUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.pullsUrl,
    this.releasesUrl,
    this.sshUrl,
    this.stargazersUrl,
    this.statusesUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.tagsUrl,
    this.teamsUrl,
    this.treesUrl,
    this.cloneUrl,
    this.mirrorUrl,
    this.hooksUrl,
    this.svnUrl,
    this.forks,
    this.openIssues,
    this.watchers,
    this.hasIssues,
    this.hasProjects,
    this.hasPages,
    this.hasWiki,
    this.hasDownloads,
    this.archived,
    this.disabled,
    this.visibility,
    this.license,
  });

  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);

  final int? id;
  final String? nodeId;
  final String? name;
  final String? fullName;
  final Owner? owner;
  final bool? private;
  final String? htmlUrl;
  final String? description;
  final bool? fork;
  final String? url;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;
  final String? homepage;
  final int? size;
  final int? stargazersCount;
  final int? watchersCount;
  final String? language;
  final int? forksCount;
  final int? openIssuesCount;
  final String? masterBranch;
  final String? defaultBranch;
  final double? score;
  final String? archiveUrl;
  final String? assigneesUrl;
  final String? blobsUrl;
  final String? branchesUrl;
  final String? collaboratorsUrl;
  final String? commentsUrl;
  final String? commitsUrl;
  final String? compareUrl;
  final String? contentsUrl;
  final String? contributorsUrl;
  final String? deploymentsUrl;
  final String? downloadsUrl;
  final String? eventsUrl;
  final String? forksUrl;
  final String? gitCommitsUrl;
  final String? gitRefsUrl;
  final String? gitTagsUrl;
  final String? gitUrl;
  final String? issueCommentUrl;
  final String? issueEventsUrl;
  final String? issuesUrl;
  final String? keysUrl;
  final String? labelsUrl;
  final String? languagesUrl;
  final String? mergesUrl;
  final String? milestonesUrl;
  final String? notificationsUrl;
  final String? pullsUrl;
  final String? releasesUrl;
  final String? sshUrl;
  final String? stargazersUrl;
  final String? statusesUrl;
  final String? subscribersUrl;
  final String? subscriptionUrl;
  final String? tagsUrl;
  final String? teamsUrl;
  final String? treesUrl;
  final String? cloneUrl;
  final String? mirrorUrl;
  final String? hooksUrl;
  final String? svnUrl;
  final int? forks;
  final int? openIssues;
  final int? watchers;
  final bool? hasIssues;
  final bool? hasProjects;
  final bool? hasPages;
  final bool? hasWiki;
  final bool? hasDownloads;
  final bool? archived;
  final bool? disabled;
  final String? visibility;
  final License? license;

  Map<String, dynamic> toJson() => _$RepositoryToJson(this);
}
