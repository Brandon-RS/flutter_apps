import 'package:flutter/services.dart';

abstract class Flavor {
  static const String _appFlavor = appFlavor ?? 'dev';

  static const String name = appFlavor ?? 'dev';

  static const bool isDev = _appFlavor == 'dev';

  static const bool isProd = _appFlavor == 'prod';

  static final String title = switch (_appFlavor) {
    'dev' => 'Savings (Dev)',
    'prod' => 'Savings',
    _ => throw Exception('Unknown flavor: $_appFlavor'),
  };

  static final String envFilePath = switch (_appFlavor) {
    'dev' => 'env/.env.dev',
    'prod' => 'env/.env.prod',
    _ => throw Exception('Unknown flavor: $_appFlavor'),
  };
}
