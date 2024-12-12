import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/notes/presentation/blocs/note_details_cubit/note_details_cubit.dart';
import 'package:flit_notes/features/timer/presentation/widgets/timer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({
    super.key,
    required this.id,
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
    return BlocBuilder<NoteDetailsCubit, NoteDetailsState>(
      builder: (context, state) => state.status.build(
        onSuccess: () => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(state.note!.content),
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
              CounterWidget(duration: state.note!.expiresDuration!.inSeconds),
              const SizedBox(height: 20),
              FilledButton.icon(
                icon: const Icon(Icons.share),
                label: Text(context.localizations.share),
                onPressed: () async => context.read<NoteDetailsCubit>().shareNote(await controller.capture()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
