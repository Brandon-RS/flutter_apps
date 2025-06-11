import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:savings/base/di/di_entry_point.config.dart';

final getIt = GetIt.I;

@InjectableInit(initializerName: 'initDependencyInjection', preferRelativeImports: true, asExtension: true)
Future<void> initDependencyInjection() async => getIt.initDependencyInjection();
