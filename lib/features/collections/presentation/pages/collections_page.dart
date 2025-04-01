import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flit_notes/base/utils/app_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:sdk_helpers/sdk_helpers.dart';

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
              showAdaptiveBottomSheet<bool>(
                context: context,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      ColoredBox(
                        color: context.colors.secondary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => context.maybePop(false),
                            ),
                            Text(
                              context.tr.createCollection,
                              style: context.textTheme.titleLarge,
                            ),
                            TextButton(
                              child: Text(
                                context.tr.done,
                                style: context.textTheme.labelLarge,
                              ),
                              onPressed: () => context.maybePop(true),
                            ),
                          ],
                        ).addVertical(10),
                      ),

                      TextField(
                        decoration: BorderlessInputDecoration(
                          hintText: context.tr.collectionName,
                        ),
                      ),

                      TextField(
                        maxLines: 5,
                        decoration: BorderlessInputDecoration(
                          hintText: context.tr.collectionDescription,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text('CollectionsPage')),
    );
  }
}
