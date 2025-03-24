import 'package:flit_notes/base/utils/base_dto.dart';
import 'package:sqflite/sqflite.dart';

abstract class Entity<T> {
  const Entity(this.tableName);

  final String tableName;

  Future<void> init(Database db) async {}

  Future<List<T>> getAll() async => [];

  Future<T?> getById(String id) async => null;

  Future<void> create(covariant BaseDto createDto) async {}

  Future<void> update(covariant BaseDto updateDto) async {}

  Future<void> delete(String id) async {}
}
