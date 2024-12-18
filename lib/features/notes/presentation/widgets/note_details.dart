import 'package:auto_route/auto_route.dart';
import 'package:flit_notes/base/constants/constants.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/features/notes/presentation/blocs/note_details_cubit/note_details_cubit.dart';
import 'package:flit_notes/features/timer/presentation/widgets/timer_text.dart';
import 'package:flit_notes/gen/assets/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({
    required this.id,
    super.key,
  });

  final String id;

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {
  late final WidgetsToImageController controller;

  @override
  void initState() {
    super.initState();
    controller = WidgetsToImageController();
    context.read<NoteDetailsCubit>().getNoteDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<NoteDetailsCubit, NoteDetailsState>(
        builder: (context, state) => state.status.build(
          onError: () => const Center(
            child: _ExpiredNote(key: Key('expired_note')),
          ),
          onSuccess: () => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: kSmallScreenMaxWidth),
                  child: SelectableText(
                    state.note!.content,
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(height: 20),
                WidgetsToImage(
                  controller: controller,
                  child: QrImageView(
                    backgroundColor: context.colors.surface,
                    data: state.noteUrl,
                    size: 200.0,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.localizations.expires_in,
                      style: context.textTheme.bodyLarge,
                    ),
                    const SizedBox(width: 6),
                    TimerWidget(
                      seconds: state.note!.expiresDuration!.inSeconds,
                      onTimerEnd: () => context.router.replaceAll(const [HomeRoute()]),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _CreateNoteButton(key: Key('create_note_button')),
                    const SizedBox(width: 20),
                    FilledButton.icon(
                      icon: const Icon(Icons.share),
                      label: Text(context.localizations.share),
                      onPressed: () async => context.read<NoteDetailsCubit>().shareNote(await controller.capture()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpiredNote extends StatelessWidget {
  const _ExpiredNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.width * 0.5),
          child: Image.asset(Assets.images.oppsIcon.path),
        ),
        const SizedBox(height: 20),
        Text(
          context.localizations.seems_like_you_are_late,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          context.localizations.note_has_expired,
          style: context.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        const _CreateNoteButton(key: Key('create_note_button')),
      ],
    );
  }
}

class _CreateNoteButton extends StatelessWidget {
  const _CreateNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.add),
      label: Text(context.localizations.new_note),
      onPressed: () async => context.router.replaceAll(const [HomeRoute()]),
    );
  }
}
