import 'package:flit_notes/base/resources/resources.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  FlutterSecureStorage getSecureStorage() => const FlutterSecureStorage();

  @lazySingleton
  Resources getResources() => Resources();
}
