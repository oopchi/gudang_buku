import 'package:json_annotation/json_annotation.dart';
import 'package:bookstore/core/models/user.dart';

part 'users.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Users {
  const Users({
    this.totalCount,
    this.incompleteResults,
    this.items,
    this.message,
    this.documentationUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  final int? totalCount;
  final bool? incompleteResults;
  final List<User>? items;
  final String? message;
  final String? documentationUrl;

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
