import 'package:flit_notes/base/data/exceptions/response_exception.dart';
import 'package:flit_notes/base/data/models/response_model.dart';
import 'package:flit_notes/features/collections/data/dtos/create_collection_dto.dart';
import 'package:flit_notes/features/collections/data/dtos/update_collection_dto.dart';
import 'package:flit_notes/features/collections/data/entities/collection_entity.dart';
import 'package:flit_notes/features/collections/data/models/collection_model.dart';
import 'package:injectable/injectable.dart';

abstract class CollectionsLocalSource {
  Future<ResponseModel<List<CollectionModel>>> getCollections();

  Future<ResponseModel<CollectionModel>> getCollectionById(String id);

  Future<ResponseModel<CollectionModel>> createCollection(
    CreateCollectionDto collectionDto,
  );

  Future<ResponseModel<CollectionModel>> updateCollection(
    UpdateCollectionDto collectionDto,
  );

  Future<ResponseModel<bool>> deleteCollection(String id);
}

@Injectable(as: CollectionsLocalSource)
class CollectionsLocalSourceImpl implements CollectionsLocalSource {
  const CollectionsLocalSourceImpl(this._entity);

  final CollectionEntity _entity;

  @override
  getCollections() async {
    try {
      final collections = await _entity.getAll();

      return ResponseModel.success(collections);
    } catch (error) {
      return ResponseModel.failure(error as ResponseException);
    }
  }

  @override
  getCollectionById(String id) {
    throw UnimplementedError();
  }

  @override
  createCollection(CreateCollectionDto collectionDto) async {
    try {
      final collection = await _entity.create(collectionDto);

      return ResponseModel.success(collection);
    } catch (error) {
      return ResponseModel.failure(error as ResponseException);
    }
  }

  @override
  updateCollection(UpdateCollectionDto collectionDto) {
    throw UnimplementedError();
  }

  @override
  deleteCollection(String id) {
    throw UnimplementedError();
  }
}
