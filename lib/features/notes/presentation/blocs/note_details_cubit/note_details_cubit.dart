import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flit_notes/base/di/di_entry_point.dart';
import 'package:flit_notes/base/enums/bloc_status_enum.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:flit_notes/features/notes/domain/repos/notes_repo.dart';
import 'package:meta/meta.dart';

part 'note_details_state.dart';

class NoteDetailsCubit extends Cubit<NoteDetailsState> {
  NoteDetailsCubit() : super(NoteDetailsState.initial());

  final NotesRepo _notesRepo = getIt<NotesRepo>();

  Future<void> getNoteDetails(String id) async {
    emit(NoteDetailsState.loading());
    try {
      final note = await _notesRepo.getNote(noteId: id);
      emit(NoteDetailsState.success(note.data));
    } catch (e) {
      emit(NoteDetailsState.error());
    }
  }
}
