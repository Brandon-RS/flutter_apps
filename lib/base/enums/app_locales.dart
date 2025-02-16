import 'package:flutter/material.dart';

enum AppLocale {
  enUS('en', 'US'),
  esES('es', 'ES');

  const AppLocale(this.langCode, this.countryCode);

  final String langCode;
  final String countryCode;

  Locale get asLocale => switch (this) {
    AppLocale.enUS => Locale(langCode, countryCode),
    AppLocale.esES => Locale(langCode, countryCode),
  };
}
