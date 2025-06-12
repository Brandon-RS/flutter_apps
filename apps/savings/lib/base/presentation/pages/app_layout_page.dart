import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:savings/base/presentation/controllers/app_controller.dart';
import 'package:savings/base/presentation/pages/base_page.dart';

@RoutePage()
class AppLayoutPage extends StatelessPage<AppController> {
  const AppLayoutPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Savings App')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('App Layout Page'),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => context.router.pushPath('/unknown'), child: const Text('Go to Unknown Page')),
          ],
        ),
      ),
    );
  }
}
