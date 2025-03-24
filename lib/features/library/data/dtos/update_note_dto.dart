import 'package:flit_notes/base/utils/base_dto.dart';

class UpdateNoteDto extends BaseDto {
  const UpdateNoteDto({
    required this.id,
    required this.name,
    required this.icon,
    required this.content,
  });

  final String id;
  final String name;
  final String icon;
  final String content;

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'icon': icon,
    'content': content,
  };

  @override
  bool validate() {
    return id.isNotEmpty &&
        name.isNotEmpty &&
        icon.isNotEmpty &&
        content.isNotEmpty;
  }
}
