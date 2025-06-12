import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:savings/base/presentation/controllers/base_controller.dart';

enum InjectorType { factory, singleton }

typedef Generator<C extends BaseController> = C Function();

mixin InjectorMixin<C extends BaseController> {
  String? get tag => null;

  C get controller => GetIt.I<C>(instanceName: tag);
}

mixin InjectorInitializerMixin<C extends BaseController, P extends StatefulWidget> on State<P> {
  String? tag;
  InjectorType injectorType = InjectorType.factory;
  bool destroyOnDispose = true;

  bool get isRegistered => GetIt.I.isRegistered<C>(instanceName: tag);

  C get controller => GetIt.I<C>(instanceName: tag);

  // C? factoryController() => null;

  //! Current approach, works good and also will prevent problems with factoryController in case it's an expensive operation
  Generator<C>? factoryController() => null;

  void _initDependencyIfNeeded() {
    if (isRegistered) return;

    final instance = factoryController();
    if (instance == null) return;

    switch (injectorType) {
      case InjectorType.factory:
        GetIt.I.registerFactory<C>(instance, instanceName: tag);
        break;
      case InjectorType.singleton:
        GetIt.I.registerSingleton<C>(instance(), instanceName: tag);
        break;
    }
  }

  //! Fix for original idea, works good but the syntax is a bit verbose
  // void _initDependencyIfNeeded() {
  //   if (isRegistered) return;

  //   switch (injectorType) {
  //     case InjectorType.factory:
  //       GetIt.I.registerFactory<C>(() {
  //         final instance = factoryController();
  //         if (instance == null) {
  //           throw Exception('factoryController() returned null for type $C');
  //         }
  //         return instance;
  //       }, instanceName: tag);
  //       break;
  //     case InjectorType.singleton:
  //       final instance = factoryController();
  //       if (instance == null) return;
  //       GetIt.I.registerSingleton<C>(instance, instanceName: tag);
  //       break;
  //   }
  // }

  //! Original idea, works but it only create singleton instances
  // void _initDependencyIfNeeded() {
  //   if (isRegistered) return;

  //   final instance = factoryController();
  //   if (instance == null) return;

  //   switch (injectorType) {
  //     case InjectorType.factory:
  //       GetIt.I.registerFactory<C>(() => instance, instanceName: tag);
  //       break;
  //     case InjectorType.singleton:
  //       GetIt.I.registerSingleton<C>(instance, instanceName: tag);
  //       break;
  //   }
  // }

  void _resetDependencyIfNeeded() {
    if (!isRegistered || !destroyOnDispose) return;

    controller.onDestroy();
  }

  @override
  void initState() {
    super.initState();
    _initDependencyIfNeeded();
    controller.onInit();
  }

  @override
  void dispose() {
    controller.onClose();
    _resetDependencyIfNeeded();

    super.dispose();
  }
}
