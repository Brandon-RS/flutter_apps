import 'package:flit_notes/base/di/di_entry_point.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:networking/networking.dart';

final getIt = GetIt.I;

@InjectableInit(
  initializerName: 'initDependencyInjection',
  preferRelativeImports: true,
  asExtension: true,
  externalPackageModulesBefore: [
    ExternalModule(NetworkingPackageModule),
  ],
)
Future<void> initDependencyInjection() async => await getIt.initDependencyInjection();
