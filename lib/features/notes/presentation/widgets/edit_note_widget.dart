import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/features/notes/presentation/blocs/edit_note_cubit/edit_note_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditNoteWidget extends StatefulWidget {
  const EditNoteWidget({super.key});

  @override
  State<EditNoteWidget> createState() => _EditNoteWidgetState();
}

class _EditNoteWidgetState extends State<EditNoteWidget> {
  late final GlobalKey<FormFieldState> _fieldState;

  @override
  void initState() {
    _fieldState = GlobalKey<FormFieldState>();
    super.initState();
  }

  @override
  void dispose() {
    _fieldState.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocListener<EditNoteCubit, EditNoteState>(
        listener: (context, state) async {
          if (state.status.isSuccess) {
            _fieldState.currentState?.reset();
            context
              ..navigateTo(NoteDetailsRoute(id: state.note.id!))
              ..read<EditNoteCubit>().reset();
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NoteField(formKey: _fieldState),
            const SizedBox(height: 20),
            const ExpirationTimeSelector(),
            const SizedBox(height: 20),
            GenerateNoteButton(),
          ],
        ),
      ),
    );
  }
}

class NoteField extends StatelessWidget {
  const NoteField({
    required this.formKey,
    super.key,
  });

  final GlobalKey<FormFieldState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) => TextFormField(
        key: formKey,
        readOnly: state.status.isSubmitting,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (note) =>
            !state.isNoteValid ? context.localizations.invalid_note_length(EditNoteState.maxLength) : null,
        minLines: 10,
        maxLines: 10,
        decoration: InputDecoration(
          hintText: context.localizations.let_it_go,
        ),
        onChanged: (note) => context.read<EditNoteCubit>().changeNote(note: note),
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
      ),
    );
  }
}

class ExpirationTimeSelector extends StatelessWidget {
  const ExpirationTimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) => DropdownButton<int>(
        borderRadius: BorderRadius.circular(kBorderRadius),
        underline: const SizedBox(),
        value: state.note.expiresAfter,
        onChanged: !state.status.isSubmitting
            ? (hours) => context.read<EditNoteCubit>().changeNote(expiresAfter: hours ?? 1)
            : null,
        items: [
          ...[1, 2, 6, 12, 24].map(
            (h) => DropdownMenuItem(
              value: h,
              child: Text(context.localizations.note_will_expire_in(h)),
            ),
          ),
        ],
      ),
    );
  }
}

class GenerateNoteButton extends StatelessWidget {
  const GenerateNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(BRANDOM): Adjust button size for bigger screens
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) => FilledButton(
        onPressed: state.canSave ? () => context.read<EditNoteCubit>().saveNote() : null,
        child: Text(context.localizations.create_note),
      ),
    );
  }
}
