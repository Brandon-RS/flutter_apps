import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:networking/networking.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Env {
  static final String baseUrl = _tryGet<String>('BASE_URL');
  static final String webUrl = _tryGet<String>('WEB_URL');
  static final String secretKey = _tryGet<String>('SECRET_KEY');

  /// Initialize environment variables and the app flavor
  static Future<void> init({String fileName = '.env.dev'}) async {
    await dotenv.load(fileName: fileName);
    NetworkModuleSettings.init(
      baseUrl: baseUrl,
      interceptors: [if (kDebugMode) PrettyDioLogger()],
    );
  }

  static T _tryGet<T>(String name, {T? fallback}) {
    if (!dotenv.isInitialized) {
      throw Exception('dotenv is not initialized, call init() first');
    }

    return switch (T) {
      const (String) => dotenv.get(name, fallback: fallback as String?),
      const (int) => dotenv.getInt(name, fallback: fallback as int?),
      const (double) => dotenv.getDouble(name, fallback: fallback as double?),
      const (bool) => dotenv.getBool(name, fallback: fallback as bool?),
      _ => throw Exception('Unsupported environment variable type: $T'),
    } as T;
  }
}
