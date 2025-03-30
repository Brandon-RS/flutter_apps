import 'dart:developer';

import 'package:flit_notes/base/storage/entities/base/entity.dart';
import 'package:flit_notes/features/collections/data/entities/collection_entity.dart';
import 'package:flit_notes/features/notes/data/dtos/create_note_dto.dart';
import 'package:flit_notes/features/notes/data/dtos/update_note_dto.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:sdk_helpers/sdk_helpers.dart';
import 'package:sqflite/sqflite.dart';

class NotesEntity extends Entity<NoteModel> {
  const NotesEntity._() : super('notes');

  static const NotesEntity to = NotesEntity._();

  @override
  Future<void> init(Database root) async {
    try {
      await root.transaction(
        (txn) => txn.execute(
          'CREATE TABLE $table ('
          'id TEXT PRIMARY KEY NOT NULL,'
          'name TEXT NOT NULL,'
          'content TEXT NOT NULL,'
          'created_at DATETIME DEFAULT CURRENT_TIMESTAMP,'
          'updated_at DATETIME DEFAULT CURRENT_TIMESTAMP,'
          'color TEXT,'
          'icon TEXT,'
          'collection_id TEXT,'
          'FOREIGN KEY (collection_id) REFERENCES ${CollectionEntity.to.table}(id) ON DELETE SET NULL'
          ')',
        ),
      );
    } catch (error) {
      log('Error creating `notes` table', error: error);
    }
  }

  @override
  Future<List<NoteModel>> getAll() async {
    try {
      final result = await db.query(table);

      return result.map((e) => NoteModel.fromMap(e)).toList();
    } catch (error) {
      log('Error reading notes', error: error);
      return [];
    }
  }

  @override
  Future<NoteModel?> getById(String id) async {
    try {
      if (!uuid.validateV4(id)) throw Exception('Invalid id');

      final result = await db.query(table, where: 'id = ?', whereArgs: [id]);

      if (result.isEmpty) throw Exception('Note `$id` not found');

      return NoteModel.fromMap(result.first);
    } catch (error) {
      log('Error reading note `$id`', error: error);
      return null;
    }
  }

  @override
  Future<void> create(CreateNoteDto createDto) async {
    try {
      if (!createDto.validate()) throw Exception('Invalid note data');

      await db.transaction(
        (txn) => txn.insert(table, {
          'id': uuid.safeV4(),
          'name': createDto.name,
          'content': createDto.content,
          'color': createDto.color,
          'icon': createDto.icon,
          'collection_id': createDto.collectionId,
        }, conflictAlgorithm: ConflictAlgorithm.replace),
      );
    } catch (error) {
      log('Error creating note', error: error);
    }
  }

  @override
  Future<void> update(UpdateNoteDto updateDto) async {
    try {
      if (!updateDto.validate()) throw Exception('Invalid note data');

      await db.transaction(
        (txn) => txn.update(
          table,
          {
            'name': updateDto.name,
            'content': updateDto.content,
            'color': updateDto.color,
            'icon': updateDto.icon,
            'collection_id': updateDto.collectionId,
            'updated_at': DateTime.now().toIso8601String(),
          },
          where: 'id = ?',
          whereArgs: [updateDto.id],
        ),
      );
    } catch (error) {
      log('Updating note `${updateDto.id}` failed', error: error);
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
