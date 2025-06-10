import 'package:flit_notes/features/collections/data/dtos/create_collection_dto.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

class UpdateCollectionDto extends CreateCollectionDto {
  const UpdateCollectionDto({
    required this.id,
    required super.name,
    super.description,
    super.icon,
    super.color,
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
