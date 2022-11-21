import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:bookstore/core/models/issues.dart';
import 'package:bookstore/core/models/repositories.dart';
import 'package:bookstore/core/models/users.dart';

part 'search_api.g.dart';

@RestApi()
abstract class SearchApi {
  factory SearchApi(Dio dio, {String baseUrl}) = _SearchApi;

  @GET('/search/repositories')
  Future<HttpResponse<Repositories>> searchRepositories({
    @Query('q') required String q,
    @Query('sort') RepositoriesSortOption? sort,
    @Query('order') OrderOption? order,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  });

  @GET('/search/issues')
  Future<HttpResponse<Issues>> searchIssues({
    @Query('q') required String q,
    @Query('sort') IssuesSortOption? sort,
    @Query('order') OrderOption? order,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  });

  @GET('/search/users')
  Future<HttpResponse<Users>> searchUsers({
    @Query('q') required String q,
    @Query('sort') UsersSortOption? sort,
    @Query('order') OrderOption? order,
    @Query('per_page') int? perPage,
    @Query('page') int? page,
  });
}

enum RepositoriesSortOption {
  stars,
  forks,
  helpWantedIssues,
  updated,
}

extension RepositoriesSortOptionExtension on RepositoriesSortOption {
  static const Map<RepositoriesSortOption, String> statuses =
      <RepositoriesSortOption, String>{
    RepositoriesSortOption.stars: 'stars',
    RepositoriesSortOption.forks: 'forks',
    RepositoriesSortOption.helpWantedIssues: 'help-wanted-issues',
    RepositoriesSortOption.updated: 'updated',
  };

  String get status => statuses[this]!;

  String toJson() => status;
}

enum UsersSortOption {
  followers,
  repositories,
  joined,
}

extension UsersSortOptionExtension on UsersSortOption {
  static const Map<UsersSortOption, String> statuses =
      <UsersSortOption, String>{
    UsersSortOption.followers: 'followers',
    UsersSortOption.repositories: 'repositories',
    UsersSortOption.joined: 'joined',
  };

  String get status => statuses[this]!;

  String toJson() => status;
}

enum IssuesSortOption {
  comments,
  reactions,
  reactionsPlus1,
  reactionsMinus1,
  reactionsSmile,
  reactionsThinkingFace,
  reactionsHeart,
  reactionsTada,
  interactions,
  created,
  updated,
}

extension IssuesSortOptionExtension on IssuesSortOption {
  static const Map<IssuesSortOption, String> statuses =
      <IssuesSortOption, String>{
    IssuesSortOption.comments: 'comments',
    IssuesSortOption.reactions: 'reactions',
    IssuesSortOption.reactionsPlus1: 'reactions-+1',
    IssuesSortOption.reactionsMinus1: 'reactions--1',
    IssuesSortOption.reactionsSmile: 'reactions-smile',
    IssuesSortOption.reactionsThinkingFace: 'reactions-thinking_face',
    IssuesSortOption.reactionsHeart: 'reactions-heart',
    IssuesSortOption.reactionsTada: 'reactions-tada',
    IssuesSortOption.interactions: 'interactions',
    IssuesSortOption.created: 'created',
    IssuesSortOption.updated: 'updated',
  };

  String get status => statuses[this]!;

  String toJson() => status;
}

enum OrderOption {
  desc,
  asc,
}

extension OrderOptionExtension on OrderOption {
  static const Map<OrderOption, String> statuses = <OrderOption, String>{
    OrderOption.desc: 'desc',
    OrderOption.asc: 'asc',
  };

  String get status => statuses[this]!;

  String toJson() => status;
}
