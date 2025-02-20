import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/presentation/widgets/app_top_bar.dart';
import 'package:flit_notes/features/home/presentation/widgets/notes_list.widget.dart';
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
      appBar: AppTopBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        itemCount: 2,
        itemBuilder: (context, index) => NotesList(),
      ),
    );
  }
}
