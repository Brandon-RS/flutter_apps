import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/gen/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routePath = '';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appName)),
      body: Center(child: Text(AppLocalizations.of(context)!.notes)),
    );
  }
}
