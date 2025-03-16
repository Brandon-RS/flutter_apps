import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/features/notes/presentation/widgets/notes_collection.widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  static const String routePath = '';

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: kPaddingVertical,
            horizontal: kPaddingHorizontal,
          ),
          itemCount: 2,
          itemBuilder: (context, index) => const NotesCollection(),
        ),
        Positioned(
          bottom: kPaddingHorizontal,
          right: kPaddingHorizontal,
          child: FloatingActionButton(
            onPressed: () => context.navigateToPath('/note'),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
