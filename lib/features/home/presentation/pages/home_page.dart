import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flit_notes/features/notes/presentation/widgets/notes_collection.widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routePath = '';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => context.navigateToPath('/app-theme-test'),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: kPaddingVertical,
          horizontal: kPaddingHorizontal,
        ),
        itemCount: 2,
        itemBuilder: (context, index) => NotesCollection(),
      ),
    );
  }
}
