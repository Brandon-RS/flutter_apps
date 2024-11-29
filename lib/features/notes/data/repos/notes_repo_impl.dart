import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:flit_notes/features/notes/data/sources/notes_remote_source.dart';
import 'package:flit_notes/features/notes/domain/repos/notes_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:networking/networking.dart';

@LazySingleton(as: NotesRepo)
class NotesRepoImpl implements NotesRepo {
  const NotesRepoImpl(this._remoteSource);

  final NotesRemoteSource _remoteSource;

  @override
  Future<Result<NoteModel>> getNote({required String noteId}) => _remoteSource.getNote(noteId: noteId);

  @override
  Future<Result<NoteModel>> createNote({required NoteModel note}) => _remoteSource.createNote(note: note);
}
