import 'package:json_annotation/json_annotation.dart';
import 'package:bookstore/core/models/repository.dart';

part 'repositories.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Repositories {
  const Repositories({
    this.totalCount,
    this.incompleteResults,
    this.items,
    this.message,
    this.documentationUrl,
  });

  factory Repositories.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesFromJson(json);

  final int? totalCount;
  final bool? incompleteResults;
  final List<Repository>? items;
  final String? message;
  final String? documentationUrl;

  Map<String, dynamic> toJson() => _$RepositoriesToJson(this);
}
