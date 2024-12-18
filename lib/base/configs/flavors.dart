import 'package:flutter/services.dart';

class Flavor {
  static final String _appFlavor = appFlavor ?? 'dev';

  String get name => appFlavor ?? 'dev';

  static bool get isDev => _appFlavor == 'dev';

  static String get title {
    switch (_appFlavor) {
      case 'dev':
        return 'Flit Notes Dev';
      case 'prod':
        return 'Flit Notes';
      default:
        throw UnimplementedError('Unknown flavor: $_appFlavor');
    }
  }
}
