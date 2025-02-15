import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/gen/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class AppPageProvider extends StatelessWidget {
  const AppPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(BRANDOM): Setup bloc here
    return const AppPage();
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.to.config(),
    );
  }
}
