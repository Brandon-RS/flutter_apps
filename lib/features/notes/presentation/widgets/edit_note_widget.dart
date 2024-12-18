import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/base/constants/constants.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/base/utils/encrypter_utils.dart';
import 'package:flit_notes/features/notes/presentation/blocs/edit_note_cubit/edit_note_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final String? value = context.routeData.queryParams.get('content');
    if (value != null && value.trim().isNotEmpty) {
      context.read<EditNoteCubit>().setInitialContent(value.replaceAll(' ', '+').decrypt());
    }

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
        listener: (context, state) {
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
            const SizedBox(height: 10),
            BlocBuilder<EditNoteCubit, EditNoteState>(
              builder: (context, state) => Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '${state.note.content.length}/${EditNoteState.maxLength}',
                  style: context.textTheme.bodySmall,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const ExpirationTimeSelector(),
            const SizedBox(height: 20),
            const GenerateNoteButton(),
            const SizedBox(height: 20),
            const _SaveForLaterWidget(key: Key('save_for_later_widget')),
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
      buildWhen: (previous, current) => previous.isNoteValid != current.isNoteValid,
      builder: (context, state) => TextFormField(
        key: formKey,
        initialValue: state.status.isInitial ? state.note.content : null,
        readOnly: state.status.isSubmitting,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (note) => !state.isNoteValid ? context.localizations.invalid_note_length(EditNoteState.maxLength) : null,
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
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) => FilledButton(
        onPressed: state.canSave ? () => context.read<EditNoteCubit>().saveNote() : null,
        child: Text(context.localizations.create_note),
      ),
    );
  }
}

class _SaveForLaterWidget extends StatelessWidget {
  const _SaveForLaterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
      builder: (context, state) => state.isNoteValid
          ? RichText(
              text: TextSpan(
                text: context.localizations.or_you_can,
                style: context.textTheme.bodySmall,
                children: [
                  TextSpan(
                    text: context.localizations.continue_editing_later,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onPrimaryFixed,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showDialog(
                          context: context,
                          builder: (context) => Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: kSmallScreenMaxWidth),
                              child: AlertDialog(
                                title: Text(
                                  context.localizations.save_your_draft,
                                  style: context.textTheme.titleLarge,
                                ),
                                content: SelectableText(state.draftLink),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Clipboard.setData(ClipboardData(text: state.draftLink));
                                      context.router.maybePop();
                                    },
                                    child: Text(context.localizations.copy_link),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                  ),
                ],
              ),
            )
          : const SizedBox(),
    );
  }
}
