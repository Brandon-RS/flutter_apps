import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/presentation/widgets/app_bottom_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AutoRouter(),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
