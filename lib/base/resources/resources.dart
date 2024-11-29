import 'package:flit_notes/base/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Resources {
  static Resources get I => GetIt.I();

  final appRouter = AppRouter();

  BuildContext? get appContext => appRouter.navigatorKey.currentContext;
}
