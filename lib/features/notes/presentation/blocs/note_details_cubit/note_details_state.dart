part of 'note_details_cubit.dart';

@immutable
class NoteDetailsState extends Equatable {
  const NoteDetailsState({
    this.note,
    this.status = BlocStatus.initial,
  });

  const NoteDetailsState.initial() : this();

  const NoteDetailsState.loading() : this(status: BlocStatus.loading);

  const NoteDetailsState.success(NoteModel note) : this(note: note, status: BlocStatus.success);

  const NoteDetailsState.error() : this(status: BlocStatus.error);

  final NoteModel? note;
  final BlocStatus status;

  String get noteUrl => '${Env.webUrl}/${AppRouter.basePath}/${note?.id}'.trim();

  @override
  List<Object?> get props => [note, status];
}
