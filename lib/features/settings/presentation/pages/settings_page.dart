import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const String routePath = 'settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: context.tr.settings),
      body: const Center(child: Text('SettingsPages')),
    );
  }
}
