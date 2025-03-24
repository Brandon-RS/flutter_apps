import 'dart:developer';

import 'package:flit_notes/base/storage/entities/notes_entity.dart';
import 'package:flit_notes/base/utils/env.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  const Db._(this._db);

  static late final Db instance;

  final Database _db;
  Database get db => _db;

  static Future<void> init() async {
    final path = join(await getDatabasesPath(), Env.dbName);

    final talkingDb = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await NotesEntity.to.init(db);
      },
    );

    instance = Db._(talkingDb);

    log('Database initialized');
  }
}
