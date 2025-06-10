import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  static const String routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Savings App')),
      body: Center(child: Text('App Layout Page')),
    );
  }
}
