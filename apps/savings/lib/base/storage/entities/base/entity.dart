import 'package:savings/base/storage/db/db.dart';
import 'package:savings/base/storage/dto/base_dto.dart';
import 'package:sqflite/sqflite.dart';

abstract class Entity<T> {
  const Entity(this.table);

  /// Database table name.
  final String table;

  Database get db => Db.instance.db;

  Future<void> init(Database root) async {}

  Future<List<T>> getAll() async => [];

  Future<T?> getById(String id) async => null;

  Future<void> create(covariant BaseDto createDto) async {}

  Future<void> update(covariant BaseDto updateDto) async {}

  Future<void> delete(String id) async {}
}
