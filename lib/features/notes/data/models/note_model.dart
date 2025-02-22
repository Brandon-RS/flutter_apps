import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel {
  const NoteModel({
    required this.id,
    required this.title,
    required this.iconEmoji,
    required this.content,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  final String id;
  final String title;
  final String iconEmoji;
  final String content;

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  @override
  String toString() {
    return 'NoteModel{id: $id, title: $title, iconEmoji: $iconEmoji, content: $content}';
  }
}
