import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/base/pages/app_page.dart';
import 'package:flit_notes/base/utils/app_storage.dart';
import 'package:flit_notes/base/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  await Env.init();
  await AppStorage.init();
  await initDependencyInjection();

  runApp(const AppPageProvider());
}
