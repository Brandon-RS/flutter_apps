import 'package:flutter/material.dart';
import 'package:savings/base/di/di_entry_point.dart';
import 'package:savings/base/presentation/pages/app_page.dart';
import 'package:savings/base/storage/app_storage.dart';
import 'package:savings/base/storage/db/db.dart';
import 'package:savings/base/utils/env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env.init();
  await Db.init();
  await AppStorage.init();
  await initDependencyInjection();

  runApp(const AppPage());
}
