import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/configs/env.dart';
import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/base/enums/bloc_status_enum.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:flit_notes/features/notes/domain/repos/notes_repo.dart';
import 'package:meta/meta.dart';
import 'package:share_plus/share_plus.dart';

part 'note_details_state.dart';

class NoteDetailsCubit extends Cubit<NoteDetailsState> {
  NoteDetailsCubit() : super(const NoteDetailsState.initial());

  final NotesRepo _notesRepo = getIt<NotesRepo>();

  Future<void> getNoteDetails(String id) async {
    emit(const NoteDetailsState.loading());

    final result = await _notesRepo.getNote(noteId: id);

    result.fold(
      onData: (note) => emit(NoteDetailsState.success(note.decrypted)),
      onError: (_) => emit(const NoteDetailsState.error()),
    );
  }

  Future<void> shareNote(Uint8List? bytes) async {
    if (bytes == null || state.note?.id == null) {
      return;
    }

    await Share.shareXFiles(
      [XFile.fromData(bytes, name: 'note.png', mimeType: 'image/png')],
      text: state.noteUrl,
      fileNameOverrides: ['flit-note.png'],
    );
  }
}
