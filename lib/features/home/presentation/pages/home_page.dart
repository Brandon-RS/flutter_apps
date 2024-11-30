import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/notes/presentation/blocs/edit_note_cubit/edit_note_cubit.dart';
import 'package:flit_notes/features/notes/presentation/widgets/edit_note_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal).add(
          EdgeInsets.only(top: context.screenSize.height * 0.2, bottom: 30),
        ),
        child: Center(
          child: Column(
            children: [
              Text(context.localizations.app_name, style: context.textTheme.headlineSmall),
              const SizedBox(height: 20),
              BlocProvider(
                create: (_) => EditNoteCubit(),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 550),
                  child: const EditNoteWidget(),
                ),
              ),
              // TODO(BRANDOM): Remove this button
              FilledButton(
                onPressed: () {
                  context.router.pushNamed('notes');
                  // context.router.push(NoteDetailsRoute(id: 'ff0213d4-7845-4ad1-a8bf-29d5804e6567'));
                },
                child: const Text('Go to Notes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
