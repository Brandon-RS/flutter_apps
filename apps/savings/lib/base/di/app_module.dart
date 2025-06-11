import 'package:injectable/injectable.dart';
import 'package:savings/base/router/app_router.dart';
import 'package:savings/base/storage/app_storage.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter get appRouter => AppRouter.instance;

  @singleton
  AppStorage get appStorage => AppStorage.instance;
}
