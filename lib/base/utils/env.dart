import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static final String baseUrl = _tryGet<String>('BASE_URL');
  static final String webUrl = _tryGet<String>('WEB_URL');

  /// Initialize environment variables and the app flavor
  static Future<void> init({required String filePath}) async {
    await dotenv.load(fileName: filePath);
  }

  static T _tryGet<T>(String key, {T? fallback}) {
    if (!dotenv.isInitialized) {
      throw Exception('dotenv is not initialized, call init() first');
    }

    return switch (T) {
          const (String) => dotenv.get(key, fallback: fallback as String?),
          const (int) => dotenv.getInt(key, fallback: fallback as int?),
          const (double) => dotenv.getDouble(
            key,
            fallback: fallback as double?,
          ),
          const (bool) => dotenv.getBool(key, fallback: fallback as bool?),
          _ => throw Exception('Unsupported environment variable type: $T'),
        }
        as T;
  }
}
