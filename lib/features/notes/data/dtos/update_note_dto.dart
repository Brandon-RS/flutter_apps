import 'package:flit_notes/features/notes/data/dtos/create_note_dto.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

class UpdateNoteDto extends CreateNoteDto {
  const UpdateNoteDto({
    required this.id,
    required super.name,
    required super.content,
    super.icon,
    super.color,
    super.collectionId,
  });

  final String id;

  @override
  Map<String, dynamic> toMap() => {'id': id, ...super.toMap()};

  @override
  bool validate() {
    if (!uuid.validateV4(id)) return false;

    return super.validate();
  }
}
