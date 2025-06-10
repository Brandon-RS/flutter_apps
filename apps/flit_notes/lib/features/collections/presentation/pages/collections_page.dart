import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flit_notes/base/utils/app_bottom_sheet.dart';
import 'package:flit_notes/features/collections/presentation/widgets/create_collection_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CollectionsPage extends StatelessWidget {
  const CollectionsPage({super.key});

  static const String routePath = 'collections';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        title: context.tr.collections,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 25),
            onPressed: () {
              showAdaptiveBottomSheet<void>(
                context: context,
                builder: (context) => const CreateCollection(),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('CollectionsPage')),
    );
  }
}
