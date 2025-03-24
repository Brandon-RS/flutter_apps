import 'package:flit_notes/base/utils/base_dto.dart';

class UpdateNoteDto extends BaseDto {
  const UpdateNoteDto({
    required this.id,
    required this.name,
    required this.content,
  });

  final String id;
  final String name;
  final String content;

  @override
  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'content': content};

  @override
  bool validate() => id.isNotEmpty && name.isNotEmpty && content.isNotEmpty;
}
