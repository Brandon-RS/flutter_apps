import 'package:flit_notes/base/utils/base_dto.dart';

class CreateNoteDto extends BaseDto {
  const CreateNoteDto({required this.name, required this.content});

  final String name;
  final String content;

  @override
  Map<String, dynamic> toMap() => {'name': name, 'content': content};

  @override
  bool validate() => name.isNotEmpty && content.isNotEmpty;
}
