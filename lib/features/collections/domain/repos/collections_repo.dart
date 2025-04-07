import 'package:flit_notes/base/data/models/response_model.dart';
import 'package:flit_notes/features/collections/data/dtos/create_collection_dto.dart';
import 'package:flit_notes/features/collections/data/dtos/update_collection_dto.dart';
import 'package:flit_notes/features/collections/data/models/collection_model.dart';

abstract class CollectionsRepo {
  /// Fetches a list of collections.
  ///
  /// Returns a [List<CollectionModel>] on success, or a [ResponseException] on error.
  Future<ResponseModel<List<CollectionModel>>> getCollections();

  /// Fetches a collection by its ID.
  ///
  /// Returns a [CollectionModel] on success, or a [ResponseException] on error.
  Future<ResponseModel<CollectionModel>> getCollectionById(String id);

  /// Creates a new collection.
  ///
  /// Returns the created [CollectionModel] on success, or a [ResponseException] on error.
  Future<ResponseModel<CollectionModel>> createCollection(
    CreateCollectionDto collectionDto,
  );

  /// Updates an existing collection.
  ///
  /// Returns the updated [CollectionModel] on success, or a [ResponseException] on error.
  Future<ResponseModel<CollectionModel>> updateCollection(
    UpdateCollectionDto collectionDto,
  );

  /// Deletes a collection by its ID.
  ///
  /// Returns true on success, or a [ResponseException] on error.
  Future<ResponseModel<bool>> deleteCollection(String id);
}
