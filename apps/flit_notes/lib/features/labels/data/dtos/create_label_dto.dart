import 'package:flit_notes/base/utils/base_dto.dart';

class CreateLabelDto extends BaseDto {
  const CreateLabelDto({required this.name, this.color});

  final String name;
  final String? color;

  @override
  Map<String, dynamic> toMap() => {'name': name, 'color': color};

  @override
  bool validate() {
    if (name.isEmpty) return false;
    if (color != null && color!.isEmpty) return false;

    return true;
  }
}
