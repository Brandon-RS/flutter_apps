import 'package:flit_notes/base/utils/base_dto.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

class CreateNoteDto extends BaseDto {
  const CreateNoteDto({
    required this.name,
    required this.content,
    this.color,
    this.icon,
    this.collectionId,
  });

  final String name;
  final String content;
  final String? color;
  final String? icon;
  final String? collectionId;

  @override
  Map<String, dynamic> toMap() => {
    'name': name,
    'content': content,
    'color': color,
    'icon': icon,
    'collection_id': collectionId,
  };

  @override
  bool validate() {
    if (name.isEmpty) return false;
    if (content.isEmpty) return false;
    if (collectionId != null && !uuid.validateV4(collectionId!)) return false;
    if (color != null && color!.isEmpty) return false;
    if (icon != null && icon!.isEmpty) return false;

    return true;
  }
}
