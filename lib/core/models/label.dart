import 'package:json_annotation/json_annotation.dart';

part 'label.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Label {
  const Label({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
  });

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);

  final int? id;
  final String? nodeId;
  final String? url;
  final String? name;
  final String? color;

  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
