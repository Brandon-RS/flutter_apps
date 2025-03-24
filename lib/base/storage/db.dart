import 'dart:developer';

import 'package:flit_notes/base/constants/sdk_helpers.dart';
import 'package:flit_notes/base/utils/env.dart';
import 'package:flit_notes/features/library/data/dtos/create_note_dto.dart';
import 'package:flit_notes/features/library/data/dtos/update_note_dto.dart';
import 'package:flit_notes/features/library/data/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const _notesTable = 'notes';

class Db {
  const Db._(this._db);

  static late final Db instance;

  final Database _db;

  static Future<void> init() async {
    final path = join(await getDatabasesPath(), Env.dbName);

    final talkingDb = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await _createNotesBd(db);
      },
    );

    instance = Db._(talkingDb);

    log('Database initialized');
  }

  static Future<void> _createNotesBd(Database db) async {
    try {
      await db.execute(
        'CREATE TABLE $_notesTable ('
        'id TEXT PRIMARY KEY NOT NULL,'
        'name TEXT NOT NULL,'
        'content TEXT NOT NULL,'
        'created_at DATETIME DEFAULT CURRENT_TIMESTAMP,'
        'updated_at DATETIME DEFAULT CURRENT_TIMESTAMP'
        ')',
      );
    } catch (error) {
      log('Error creating `notes` table', error: error);
    }
  }

  Future<List<NoteModel>> getAll() async {
    try {
      final result = await _db.query(_notesTable);

      return result.map((e) => NoteModel.fromMap(e)).toList();
    } catch (error) {
      log('Error reading notes', error: error);
      return [];
    }
  }

  Future<NoteModel?> getById(String id) async {
    try {
      if (id.isEmpty) throw Exception('Invalid id');

      final result = await _db.query(
        _notesTable,
        where: 'id = ?',
        whereArgs: [id],
      );

      if (result.isEmpty) throw Exception('Note `$id` not found');

      return NoteModel.fromMap(result.first);
    } catch (error) {
      log('Error reading note `$id`', error: error);
      return null;
    }
  }

  Future<void> create(CreateNoteDto note) async {
    try {
      if (!note.validate()) throw Exception('Invalid note data');

      _db.insert(_notesTable, {
        'id': uuid.v4(),
        'name': note.name,
        'content': note.content,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (error) {
      log('Error creating note', error: error);
    }
  }

  Future<void> update(UpdateNoteDto note) async {
    try {
      if (!note.validate()) throw Exception('Invalid note data');

      _db.update(
        _notesTable,
        {
          'name': note.name,
          'content': note.content,
          'updated_at': DateTime.now().toIso8601String(),
        },
        where: 'id = ?',
        whereArgs: [note.id],
      );
    } catch (error) {
      log('Updating note `${note.id}` failed', error: error);
    }
  }

  Future<void> delete(String id) async {
    try {
      _db.delete(_notesTable, where: 'id = ?', whereArgs: [id]);
    } catch (error) {
      log('Error deleting `$id`', error: error);
    }
  }
}
