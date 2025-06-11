import 'package:savings/base/enums/app_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage._(this._storage);

  static late final AppStorage instance;

  final SharedPreferencesWithCache _storage;

  static Future<void> init() async {
    final storage = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(allowList: AppKey.values.map((e) => e.name).toSet()),
    );

    instance = AppStorage._(storage);
  }

  Future<void> write(AppKey key, String value) async {
    await _storage.setString(key.name, value);
  }

  String? read(AppKey key) => _storage.getString(key.name);

  Future<void> remove(AppKey key) async {
    await _storage.remove(key.name);
  }

  Future<void> clear() async {
    await _storage.clear();
  }
}
