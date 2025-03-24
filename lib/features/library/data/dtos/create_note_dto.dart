import 'package:flit_notes/base/utils/base_dto.dart';

class CreateNoteDto extends BaseDto {
  const CreateNoteDto({
    required this.name,
    required this.icon,
    required this.content,
  });

  final String name;
  final String icon;
  final String content;

  @override
  Map<String, dynamic> toMap() => {
    'name': name,
    'icon': icon,
    'content': content,
  };

  @override
  bool validate() => name.isNotEmpty && icon.isNotEmpty && content.isNotEmpty;
}
