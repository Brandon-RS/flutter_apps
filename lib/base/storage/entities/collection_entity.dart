import 'dart:developer';

import 'package:flit_notes/base/storage/entities/base/entity.dart';
import 'package:flit_notes/features/library/data/dtos/create_collection_dto.dart';
import 'package:flit_notes/features/library/data/dtos/update_collection_dto.dart';
import 'package:flit_notes/features/library/data/models/collection_model.dart';
import 'package:sdk_helpers/sdk_helpers.dart';
import 'package:sqflite/sqflite.dart';

class CollectionEntity extends Entity<CollectionModel> {
  const CollectionEntity._() : super('collections');

  static const CollectionEntity to = CollectionEntity._();

  @override
  Future<void> init(Database root) async {
    try {
      await root.transaction(
        (txn) => txn.execute(
          'CREATE TABLE $table ('
          'id TEXT PRIMARY KEY NOT NULL,'
          'name TEXT NOT NULL,'
          'created_at DATETIME DEFAULT CURRENT_TIMESTAMP,'
          'updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,'
          'description TEXT,'
          'icon TEXT,'
          'color TEXT'
          ')',
        ),
      );
    } catch (error) {
      log('Error creating `$table` table', error: error);
    }
  }

  @override
  Future<List<CollectionModel>> getAll() async {
    try {
      final result = await db.query(table);

      return result.map((e) => CollectionModel.fromMap(e)).toList();
    } catch (error) {
      log('Error reading $table', error: error);
      return [];
    }
  }

  @override
  Future<CollectionModel?> getById(String id) async {
    try {
      if (uuid.validateV4(id)) throw Exception('Invalid id');

      final result = await db.query(table, where: 'id = ?', whereArgs: [id]);

      if (result.isEmpty) throw Exception('Collection `$id` not found');

      return CollectionModel.fromMap(result.first);
    } catch (error) {
      log('Error reading collection `$id`', error: error);
      return null;
    }
  }

  @override
  Future<void> create(CreateCollectionDto createDto) async {
    try {
      if (!createDto.validate()) throw Exception('Invalid collection data');

      await db.transaction(
        (txn) => txn.insert(table, {
          'id': uuid.safeV4(),
          'name': createDto.name,
          'description': createDto.description,
          'icon': createDto.icon,
          'color': createDto.color,
        }, conflictAlgorithm: ConflictAlgorithm.replace),
      );
    } catch (error) {
      log('Error creating collection', error: error);
    }
  }

  @override
  Future<void> update(UpdateCollectionDto updateDto) async {
    try {
      if (!updateDto.validate()) throw Exception('Invalid collection data');

      await db.transaction(
        (txn) => txn.update(
          table,
          {
            'name': updateDto.name,
            'description': updateDto.description,
            'icon': updateDto.icon,
            'color': updateDto.color,
            'updated_at': DateTime.now().toIso8601String(),
          },
          where: 'id = ?',
          whereArgs: [updateDto.id],
        ),
      );
    } catch (error) {
      log('Updating collection `${updateDto.id}` failed', error: error);
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await db.transaction(
        (txn) => txn.delete(table, where: 'id = ?', whereArgs: [id]),
      );
    } catch (error) {
      log('Error deleting `$id`', error: error);
    }
  }
}
