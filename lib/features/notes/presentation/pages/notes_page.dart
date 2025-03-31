import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  static const String routePath = 'notes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: context.tr.notes,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 25),
            onPressed: () {
              log('Create collection', name: '❌');
            },
          ),
        ],
      ),
      body: const Center(child: Text('NotesPage')),
    );
  }
}
