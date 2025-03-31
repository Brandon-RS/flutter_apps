import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/library/presentation/blocs/add_button_cubit/add_button_cubit.dart';
import 'package:flit_notes/features/notes/presentation/widgets/notes_collection.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  static const String routePath = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddButtonCubit(),
      child: const _LibraryPageState(key: Key('LibraryPage')),
    );
  }
}

class _LibraryPageState extends StatelessWidget {
  const _LibraryPageState({super.key});

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

        BlocBuilder<AddButtonCubit, AddButtonState>(
          builder: (context, state) {
            return AnimatedPositionedDirectional(
              duration: state.duration,
              bottom: state.position,
              end: kPaddingHorizontal,
              child: FloatingActionButton(
                heroTag: 'add_note',
                backgroundColor: context.colors.secondaryFixed,
                onPressed: () {
                  context
                    ..read<AddButtonCubit>().instantClose()
                    ..navigateToPath('/notes');
                },
                child: const Icon(Icons.note_add_rounded),
              ),
            );
          },
        ),
        BlocBuilder<AddButtonCubit, AddButtonState>(
          builder: (context, state) {
            return AnimatedPositionedDirectional(
              duration: state.duration,
              bottom: kPaddingHorizontal,
              end: state.position,
              child: FloatingActionButton(
                heroTag: 'add_collection',
                backgroundColor: context.colors.secondaryFixed,
                onPressed: () {
                  context
                    ..read<AddButtonCubit>().instantClose()
                    ..navigateToPath('/collections');
                },
                child: const Icon(Icons.folder_rounded),
              ),
            );
          },
        ),
        PositionedDirectional(
          bottom: kPaddingHorizontal,
          end: kPaddingHorizontal,
          child: FloatingActionButton(
            key: const Key('add_button'),
            heroTag: 'add_button',
            onPressed: () => context.read<AddButtonCubit>().toggle(),
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
