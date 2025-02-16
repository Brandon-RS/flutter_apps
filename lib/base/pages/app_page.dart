import 'package:flit_notes/base/blocs/app_bloc/app_bloc.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/gen/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AppPageProvider extends StatelessWidget {
  const AppPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => GetIt.I<AppBloc>()..add(LoadAppData()),
        ),
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
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flit Notes',
      locale: context.watch<AppBloc>().state.lang.asLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
