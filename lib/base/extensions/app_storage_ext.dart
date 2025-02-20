import 'package:flit_notes/base/enums/app_locales.dart';
import 'package:flit_notes/base/enums/app_storage_keys.dart';
import 'package:flit_notes/base/utils/app_storage.dart';
import 'package:flutter/material.dart';

extension AppStorageExt on AppStorage {
  Future<AppLocale> saveLang(AppLocale lang) async {
    await write(AppKey.lang, lang.name);
    return lang;
  }

  AppLocale get lang => AppLocale.values.firstWhere(
    (e) => e.name == read(AppKey.lang),
    orElse: () => AppLocale.enUS,
  );

  Future<ThemeMode> saveTheme(ThemeMode mode) async {
    write(AppKey.theme, mode.name);
    return mode;
  }

  ThemeMode get theme => ThemeMode.values.firstWhere(
    (e) => e.name == read(AppKey.theme),
    orElse: () => ThemeMode.system,
  );
}

extension ThemeModeExt on ThemeMode {
  bool get isLight => this == ThemeMode.light;

  bool get isDark => this == ThemeMode.dark;
}
