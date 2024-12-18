import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/configs/env.dart';
import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/base/router/app_router.dart';
import 'package:flit_notes/base/utils/encrypter_utils.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:flit_notes/features/notes/domain/repos/notes_repo.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(const EditNoteState());

  final NotesRepo _notesRepo = getIt<NotesRepo>();

  void setInitialContent(String? content) => emit(state.copyWith(note: state.note.copyWith(content: content)));

  void changeNote({String? note, int? expiresAfter}) {
    emit(
      state.copyWith(
        status: EditNoteStatus.editing,
        note: state.note.copyWith(content: note, expiresAfter: expiresAfter),
      ),
    );
  }

  Future<void> saveNote() async {
    emit(state.copyWith(status: EditNoteStatus.submitting));

    if (state.note.id == null) {
      final result = await _notesRepo.createNote(note: state.note.encrypted);

      result.fold(
        onData: (note) => emit(state.copyWith(note: note.decrypted, status: EditNoteStatus.success)),
        onError: (e) => emit(state.copyWith(status: EditNoteStatus.error, error: e.toString())),
      );
    }
  }

  void reset() => emit(const EditNoteState());
}
