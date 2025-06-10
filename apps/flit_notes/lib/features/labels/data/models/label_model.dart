import 'package:json_annotation/json_annotation.dart';

part 'label_model.g.dart';

@JsonSerializable()
class LabelModel {
  const LabelModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.color,
  });

  factory LabelModel.fromMap(Map<String, dynamic> json) =>
      _$LabelModelFromJson(json);

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? color;

  Map<String, dynamic> toMap() => _$LabelModelToJson(this);

  @override
  String toString() {
    return 'Label{id: $id, name: $name, color: $color, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
