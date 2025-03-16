import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/presentation/widgets/app_bottom_bar.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => context.navigateToPath('/app-theme-test'),
        ),
      ),
      body: const Column(
        children: [Expanded(child: AutoRouter()), AppBottomBar()],
      ),
    );
  }
}
