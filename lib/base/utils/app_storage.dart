import 'package:flit_notes/base/enums/app_storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage._(this._prefs);

  static late final AppStorage instance;

  final SharedPreferencesWithCache _prefs;

  static Future<void> init() async {
    final prefs = await SharedPreferencesWithCache.create(
      cacheOptions: SharedPreferencesWithCacheOptions(
        allowList: AppKey.values.map((e) => e.name).toSet(),
      ),
    );

    instance = AppStorage._(prefs);
  }

  Future<void> write(AppKey key, String value) async {
    await _prefs.setString(key.name, value);
  }

  String? read(AppKey key) => _prefs.getString(key.name);

  Future<void> remove(AppKey key) async {
    await _prefs.remove(key.name);
  }

  Future<void> clear() async {
    await _prefs.clear();
  }
}
