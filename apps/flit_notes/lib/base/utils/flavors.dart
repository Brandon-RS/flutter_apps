import 'package:flutter/services.dart';

abstract class Flavor {
  static const String _appFlavor = appFlavor ?? 'dev';

  static String get name => appFlavor ?? 'dev';

  static bool get isDev => _appFlavor == 'dev';

  static bool get isProd => _appFlavor == 'prod';

  static String get title => switch (_appFlavor) {
    'dev' => 'Flit Notes (Dev)',
    'prod' => 'Flit Notes',
    _ => throw Exception('Unknown flavor: $_appFlavor'),
  };

  static String get envFilePath => switch (_appFlavor) {
    'dev' => 'env/.env.dev',
    'prod' => 'env/.env.prod',
    _ => throw Exception('Unknown flavor: $_appFlavor'),
  };
}
