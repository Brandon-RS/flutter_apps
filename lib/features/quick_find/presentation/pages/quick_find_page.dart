import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuickFindPage extends StatelessWidget {
  const QuickFindPage({super.key});

  static const String routePath = 'find';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(title: context.tr.quickFind),
      body: const Center(child: Text('QuickFindPage')),
    );
  }
}
