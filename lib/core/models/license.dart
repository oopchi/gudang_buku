import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class License {
  const License({
    this.key,
    this.name,
    this.url,
    this.spdxId,
    this.nodeId,
    this.htmlUrl,
  });

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  final String? key;
  final String? name;
  final String? url;
  final String? spdxId;
  final String? nodeId;
  final String? htmlUrl;

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}
