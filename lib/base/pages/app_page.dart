import 'package:flit_notes/base/blocs/app_bloc/app_bloc.dart';
import 'package:flit_notes/base/configs/flavors.dart';
import 'package:flit_notes/base/resources/resources.dart';
import 'package:flit_notes/base/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

class AppPageProvider extends StatelessWidget {
  const AppPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // TODO(BRANDOM): Extract blocs to a separate class provider
        BlocProvider(create: (_) => GetIt.I<AppBloc>()),
      ],
      child: const AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AppBloc>().add(const AppIdChanged());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Flavor.title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: Resources.I.appRouter.delegate(),
      routeInformationParser: Resources.I.appRouter.defaultRouteParser(),
    );
  }
}
