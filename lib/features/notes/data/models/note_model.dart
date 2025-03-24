import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
  const NoteModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteModel.fromMap(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  final String id;
  final String name;
  final String icon;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Map<String, dynamic> toMap() => _$NoteModelToJson(this);

  @override
  String toString() {
    return 'Note{id: $id, name: $name, icon: $icon, content: $content, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
