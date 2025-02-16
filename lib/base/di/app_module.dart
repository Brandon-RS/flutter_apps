import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/base/utils/app_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter get appRouter => AppRouter.instance;

  @singleton
  AppStorage get appStorage => AppStorage.instance;
}
