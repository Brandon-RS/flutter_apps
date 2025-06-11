import 'dart:developer';

import 'package:path/path.dart';
import 'package:savings/base/utils/env.dart';
import 'package:sqflite/sqflite.dart';

class Db {
  const Db._(this._db);

  static late final Db instance;

  final Database _db;
  Database get db => _db;

  static Future<void> init() async {
    final path = join(await getDatabasesPath(), Env.dbName);

    final talkingDb = await openDatabase(path, version: 1, onCreate: (db, version) {});

    instance = Db._(talkingDb);

    log('Database initialized');
  }
}
