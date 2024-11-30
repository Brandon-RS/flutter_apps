import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(body: AutoRouter());
}
