import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/utils/encrypter_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel extends Equatable {
  const NoteModel({
    required this.content,
    required this.expiresAfter,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  const NoteModel.empty()
      : id = null,
        content = '',
        createdAt = null,
        updatedAt = null,
        expiresAfter = 1;

  factory NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

  final String? id;
  final String content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int expiresAfter;

  NoteModel copyWith({
    String? id,
    String? content,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? expiresAfter,
  }) {
    return NoteModel(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAfter: expiresAfter ?? this.expiresAfter,
    );
  }

  NoteModel get encrypted => copyWith(content: content.encrypt());

  NoteModel get decrypted => copyWith(content: content.decrypt());

  Duration? get expiresDuration {
    if (createdAt == null) {
      return null;
    }

    return createdAt!.add(Duration(hours: expiresAfter)).difference(DateTime.now());
  }

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  @override
  List<Object> get props => [id ?? '', content, expiresAfter];
}
