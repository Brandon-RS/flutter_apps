import 'package:flit_notes/features/labels/data/dtos/create_label_dto.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

class UpdateLabelDto extends CreateLabelDto {
  const UpdateLabelDto({required this.id, required super.name, super.color});

  final String id;

  @override
  Map<String, dynamic> toMap() => {'id': id, ...super.toMap()};

  @override
  bool validate() {
    if (!uuid.validateV4(id)) return false;

    return super.validate();
  }
}
