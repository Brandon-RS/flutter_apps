import 'package:json_annotation/json_annotation.dart';

part 'collection_model.g.dart';

@JsonSerializable()
class CollectionModel {
  CollectionModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.description,
    this.icon,
    this.color,
  });

  factory CollectionModel.fromMap(Map<String, dynamic> json) =>
      _$CollectionModelFromJson(json);

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? description;
  final String? icon;
  final String? color;

  Map<String, dynamic> toMap() => _$CollectionModelToJson(this);

  @override
  String toString() {
    return 'Collection{id: $id, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, color: $color}';
  }
}
