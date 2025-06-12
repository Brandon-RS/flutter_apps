import 'package:flutter/material.dart';
import 'package:savings/base/enums/app_locales.dart';
import 'package:savings/base/presentation/controllers/app_controller.dart';
import 'package:savings/base/presentation/pages/base_page.dart';
import 'package:savings/base/router/app_router.dart';
import 'package:savings/base/theme/app_theme.dart';
import 'package:savings/base/utils/flavors.dart';
import 'package:savings/gen/l10n/generated/app_localizations.dart';

class AppPage extends StatelessPage<AppController> {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: Flavor.title,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      locale: AppLocale.enUS.asLocale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.config(),
    );
  }
}
