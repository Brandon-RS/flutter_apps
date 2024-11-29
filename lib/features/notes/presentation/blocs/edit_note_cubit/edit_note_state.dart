part of 'edit_note_cubit.dart';

class EditNoteState extends Equatable {
  const EditNoteState({
    this.status = EditNoteStatus.initial,
    this.note = const NoteModel.empty(),
    this.error,
  });

  static const int maxLength = 300;

  final EditNoteStatus status;
  final NoteModel note;
  final String? error;

  EditNoteState copyWith({
    EditNoteStatus? status,
    NoteModel? note,
    String? error,
  }) {
    return EditNoteState(
      status: status ?? this.status,
      note: note ?? this.note,
      error: error,
    );
  }

  bool get isNoteValid => note.note.trim().isNotEmpty && note.note.length <= maxLength && note.expiresAfter > 0;

  bool get canSave => isNoteValid && !status.isSubmitting;

  @override
  List<Object> get props => [note, status];
}

enum EditNoteStatus {
  initial,
  editing,
  submitting,
  success,
  error;

  bool get isInitial => this == EditNoteStatus.initial;
  bool get isEditing => this == EditNoteStatus.editing;
  bool get isSubmitting => this == EditNoteStatus.submitting;
  bool get isSuccess => this == EditNoteStatus.success;
  bool get isError => this == EditNoteStatus.error;
}
