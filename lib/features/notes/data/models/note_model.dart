import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable()
class NoteModel extends Equatable {
  const NoteModel({
    required this.note,
    required this.expiresAfter,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => _$NoteModelFromJson(json);

  final String? id;
  final String note;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int expiresAfter;

  const NoteModel.empty()
      : id = null,
        note = '',
        createdAt = null,
        updatedAt = null,
        expiresAfter = 1;

  NoteModel copyWith({
    String? id,
    String? note,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? expiresAfter,
  }) {
    return NoteModel(
      id: id ?? this.id,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiresAfter: expiresAfter ?? this.expiresAfter,
    );
  }

  Map<String, dynamic> toJson() => _$NoteModelToJson(this);

  @override
  List<Object> get props => [id ?? '', note, expiresAfter];
}
