import 'dart:typed_data';

import 'package:flit_notes/base/configs/env.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/features/notes/presentation/blocs/note_details_cubit/note_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
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
  // TODO(BRANDOM): Extract all logic related to the QR code the cubit
  late final WidgetsToImageController controller;
  Uint8List? bytes;

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
              Text(state.note!.note),
              const SizedBox(height: 20),
              WidgetsToImage(
                controller: controller,
                child: QrImageView(
                  backgroundColor: context.colors.surface,
                  data: noteUrl(state.note!.id),
                  size: 200.0,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: context.colors.primary,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: context.colors.primary,
                  ),
                ),
              ),
              // share button
              const SizedBox(height: 20),
              FilledButton.icon(
                icon: const Icon(Icons.share),
                label: Text(context.localizations.share),
                onPressed: () async {
                  final bytes = await controller.capture();

                  if (bytes == null) {
                    return;
                  }

                  await Share.shareXFiles(
                    [XFile.fromData(bytes, name: 'note.png', mimeType: 'image/png')],
                    text: noteUrl(state.note!.id),
                    fileNameOverrides: ['flit-note.png'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String noteUrl(String? id) => '${Env.webUrl}/${AppRouter.notesPath}/$id'.trim();
}
