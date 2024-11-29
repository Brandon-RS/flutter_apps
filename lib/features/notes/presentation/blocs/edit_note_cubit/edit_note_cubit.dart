import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:flit_notes/features/notes/domain/repos/notes_repo.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteState());

  final NotesRepo _notesRepo = getIt<NotesRepo>();

  void changeNote({String? note, int? expiresAfter}) {
    emit(
      state.copyWith(
        status: EditNoteStatus.editing,
        note: state.note.copyWith(note: note),
      ),
    );
  }

  Future<void> saveNote() async {
    emit(state.copyWith(status: EditNoteStatus.submitting));

    try {
      if (state.note.id == null) {
        final result = await _notesRepo.createNote(note: state.note);
        emit(
          state.copyWith(
            note: result.data,
            status: EditNoteStatus.success,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: EditNoteStatus.error,
          error: e.toString(),
        ),
      );
    }
  }

  void reset() => emit(EditNoteState());
}
