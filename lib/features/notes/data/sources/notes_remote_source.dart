import 'package:flit_notes/base/networking/endpoints.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:injectable/injectable.dart';
import 'package:networking/networking.dart';

abstract class NotesRemoteSource {
  Future<Result<NoteModel>> getNote({required String noteId});

  Future<Result<NoteModel>> createNote({required NoteModel note});
}

@LazySingleton(as: NotesRemoteSource)
class NotesRemoteSourceImpl extends RemoteSource implements NotesRemoteSource {
  const NotesRemoteSourceImpl(super._client);

  @override
  Future<Result<NoteModel>> getNote({required String noteId}) async => request(
        endpoint: Endpoints.noteById(noteId),
        method: HttpMethod.GET,
        serializer: (json) => NoteModel.fromJson(json),
      );

  @override
  Future<Result<NoteModel>> createNote({required NoteModel note}) async => request(
        endpoint: Endpoints.notes,
        method: HttpMethod.POST,
        data: note.toJson(),
        serializer: (json) => NoteModel.fromJson(json),
      );
}
