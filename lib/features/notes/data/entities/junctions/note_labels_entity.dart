import 'dart:developer';

import 'package:flit_notes/base/storage/entities/base/entity.dart';
import 'package:flit_notes/features/labels/data/entities/label_entity.dart';
import 'package:flit_notes/features/notes/data/entities/notes_entity.dart';
import 'package:sqflite/sqflite.dart';

class NoteLabelsEntity extends Entity {
  const NoteLabelsEntity._() : super('note_labels');

  static const NoteLabelsEntity to = NoteLabelsEntity._();

  @override
  Future<void> init(Database root) async {
    try {
      // Create junction table for many-to-many relationship with notes
      await root.transaction(
        (txn) => txn.execute(
          'CREATE TABLE note_$table ('
          'note_id TEXT NOT NULL,'
          'label_id TEXT NOT NULL,'
          'PRIMARY KEY (note_id, label_id),'
          'FOREIGN KEY (note_id) REFERENCES ${NotesEntity.to.table}(id) ON DELETE CASCADE,'
          'FOREIGN KEY (label_id) REFERENCES ${LabelEntity.to.table}(id) ON DELETE CASCADE'
          ')',
        ),
      );
    } catch (error) {
      log('Error creating `$table` table', error: error);
    }
  }
}
