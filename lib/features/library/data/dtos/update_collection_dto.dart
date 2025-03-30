import 'package:flit_notes/base/utils/base_dto.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

class UpdateCollectionDto extends BaseDto {
  const UpdateCollectionDto({
    required this.id,
    required this.name,
    this.description,
    this.icon,
    this.color,
  });

  final String id;
  final String name;
  final String? description;
  final String? icon;
  final String? color;

  @override
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'icon': icon,
    'description': description,
    'color': color,
  };

  @override
  bool validate() {
    if (!uuid.validateV4(id)) return false;
    if (name.isEmpty) return false;
    if (icon != null && icon!.isEmpty) return false;
    if (description != null && description!.isEmpty) return false;
    if (color != null && color!.isEmpty) return false;

    return true;
  }
}
