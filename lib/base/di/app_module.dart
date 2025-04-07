import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/base/storage/app_storage.dart';
import 'package:flit_notes/features/collections/data/entities/collection_entity.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  AppRouter get appRouter => AppRouter.instance;

  @singleton
  AppStorage get appStorage => AppStorage.instance;

  @singleton
  CollectionEntity get collectionEntity => CollectionEntity.to;
}
