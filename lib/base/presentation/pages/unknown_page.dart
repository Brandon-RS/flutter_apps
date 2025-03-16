import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  static const String routePath = '/*';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Unknown page')],
        ),
      ),
    );
  }
}
