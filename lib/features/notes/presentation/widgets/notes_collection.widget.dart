import 'package:collection/collection.dart';
import 'package:flit_notes/base/constants/app_sizes.dart';
import 'package:flit_notes/base/constants/sdk_helpers.dart';
import 'package:flit_notes/base/extensions/context_ext.dart';
import 'package:flit_notes/features/notes/data/dummy/dummy_notes.dart';
import 'package:flit_notes/features/notes/data/models/note_model.dart';
import 'package:flutter/material.dart';

class NotesCollection extends StatelessWidget {
  const NotesCollection({this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title.isNotNull)
          Row(
            children: [
              Text(title!, style: context.textTheme.titleLarge),
              const Spacer(),
              IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
            ],
          ),

        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kBorderRadius),
            color: context.colors.primary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...recentDummyNotes.mapIndexed(
                (index, note) => NoteListItem(
                  note: note,
                  onNoteTap: (note) {
                    print('❌ ${note.name}');
                  },
                  showBottomBorder: index != recentDummyNotes.length - 1,
                ),
              ),
            ],
          ),
        ),

        if (title.isNull) const SizedBox(height: 20),
      ],
    );
  }
}

class NoteListItem extends StatelessWidget {
  const NoteListItem({
    required this.note,
    this.onNoteTap,
    this.showBottomBorder = true,
    super.key,
  });

  final NoteModel note;
  final ValueChanged<NoteModel>? onNoteTap;
  final bool showBottomBorder;

  @override
  Widget build(BuildContext context) {
    final border = Border(
      bottom: BorderSide(color: context.colors.outline, width: 1),
    );

    final listItem = Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(note.icon, style: context.textTheme.titleLarge),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(border: showBottomBorder ? border : null),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                note.name,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
      ],
    );

    return onNoteTap.isNotNull
        ? Material(
          color: context.colors.primary,
          child: InkWell(onTap: () => onNoteTap!(note), child: listItem),
        )
        : listItem;
  }
}
