import 'dart:developer';

import 'package:flit_notes/base/storage/entities/base/entity.dart';
import 'package:flit_notes/features/labels/data/dtos/create_label_dto.dart';
import 'package:flit_notes/features/labels/data/dtos/update_label_dto.dart';
import 'package:flit_notes/features/labels/data/models/label_model.dart';
import 'package:sdk_helpers/sdk_helpers.dart';
import 'package:sqflite/sqflite.dart';

class LabelEntity extends Entity<LabelModel> {
  const LabelEntity._() : super('labels');

  static const LabelEntity to = LabelEntity._();

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
          'color TEXT'
          ')',
        ),
      );
    } catch (error) {
      log('Error creating `labels` table', error: error);
    }
  }

  @override
  Future<List<LabelModel>> getAll() async {
    try {
      final result = await db.query(table);

      return result.map((e) => LabelModel.fromMap(e)).toList();
    } catch (error) {
      log('Error reading labels', error: error);
      return [];
    }
  }

  @override
  Future<LabelModel?> getById(String id) async {
    try {
      if (!uuid.validateV4(id)) throw Exception('Invalid id');

      final result = await db.query(table, where: 'id = ?', whereArgs: [id]);

      if (result.isEmpty) throw Exception('Label `$id` not found');

      return LabelModel.fromMap(result.first);
    } catch (error) {
      log('Error reading label `$id`', error: error);
      return null;
    }
  }

  @override
  Future<void> create(CreateLabelDto createDto) async {
    try {
      if (!createDto.validate()) throw Exception('Invalid label data');

      await db.transaction(
        (txn) => txn.insert(table, {
          'id': uuid.safeV4(),
          'name': createDto.name,
          'color': createDto.color,
        }, conflictAlgorithm: ConflictAlgorithm.replace),
      );
    } catch (error) {
      log('Error creating label', error: error);
    }
  }

  @override
  Future<void> update(UpdateLabelDto updateDto) async {
    try {
      if (!updateDto.validate()) throw Exception('Invalid label data');

      await db.transaction(
        (txn) => txn.update(
          table,
          {
            'name': updateDto.name,
            'color': updateDto.color,
            'updated_at': DateTime.now().toIso8601String(),
          },
          where: 'id = ?',
          whereArgs: [updateDto.id],
        ),
      );
    } catch (error) {
      log('Updating label `${updateDto.id}` failed', error: error);
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
