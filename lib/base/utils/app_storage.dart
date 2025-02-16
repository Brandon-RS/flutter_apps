import 'package:flit_notes/base/enums/app_locales.dart';
import 'package:flit_notes/base/enums/app_storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppStorage {
  AppStorage._()
    : _secureStorage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  static final AppStorage instance = AppStorage._();

  final FlutterSecureStorage _secureStorage;

  Future<void> write(AppKey key, String value) async {
    await _secureStorage.write(key: key.name, value: value);
  }

  Future<String?> read(AppKey key) async {
    return await _secureStorage.read(key: key.name);
  }

  Future<void> delete(AppKey key) async {
    await _secureStorage.delete(key: key.name);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  // Helpers

  Future<AppLocale> saveLang(AppLocale lang) async {
    await write(AppKey.lang, lang.name);
    return lang;
  }

  Future<AppLocale> get lang async {
    final lang = await read(AppKey.lang);
    return AppLocale.values.firstWhere(
      (e) => e.name == lang,
      orElse: () => AppLocale.enUS,
    );
  }
}
