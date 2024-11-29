import 'package:flit_notes/base/configs/env.dart';
import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/base/pages/app_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Env.init(fileName: 'env/env.dev');
  await initDependencyInjection();
  runApp(const AppPageProvider());
}
