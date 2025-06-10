import 'package:flit_notes/base/utils/base_dto.dart';

class CreateCollectionDto extends BaseDto {
  const CreateCollectionDto({
    required this.name,
    this.description,
    this.icon,
    this.color,
  });

  final String name;
  final String? description;
  final String? icon;
  final String? color;

  @override
  Map<String, dynamic> toMap() => {
    'name': name,
    'description': description,
    'icon': icon,
    'color': color,
  };

  @override
  bool validate() {
    if (name.isEmpty) return false;
    if (description != null && description!.length > 255) return false;
    if (icon != null && icon!.length > 255) return false;
    if (color != null && color!.length > 255) return false;

    return true;
  }
}
