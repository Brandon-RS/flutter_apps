import 'package:flit_notes/features/collections/data/dtos/create_collection_dto.dart';
import 'package:flit_notes/features/collections/data/dtos/update_collection_dto.dart';
import 'package:flit_notes/features/collections/data/sources/collections_local_source.dart';
import 'package:flit_notes/features/collections/domain/repos/collections_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CollectionsRepo)
class CollectionsRepoImpl implements CollectionsRepo {
  const CollectionsRepoImpl(this._localSource);

  final CollectionsLocalSource _localSource;

  @override
  getCollections() {
    return _localSource.getCollections();
  }

  @override
  getCollectionById(String id) {
    return _localSource.getCollectionById(id);
  }

  @override
  createCollection(CreateCollectionDto collectionDto) {
    return _localSource.createCollection(collectionDto);
  }

  @override
  updateCollection(UpdateCollectionDto collectionDto) {
    return _localSource.updateCollection(collectionDto);
  }

  @override
  deleteCollection(String id) {
    return _localSource.deleteCollection(id);
  }
}
