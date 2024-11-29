import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:networking/networking.dart';

abstract class NotesRepo {
  Future<Result<NoteModel>> getNote({required String noteId});

  Future<Result<NoteModel>> createNote({required NoteModel note});
}
