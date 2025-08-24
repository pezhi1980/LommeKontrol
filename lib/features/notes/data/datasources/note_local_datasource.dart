import 'package:hive/hive.dart';
import '../models/note_model.dart';

abstract class NoteLocalDataSource {
  Future<List<NoteModel>> getNotes();
  Future<void> addNote(NoteModel note);
  Future<void> deleteNote(String id);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource {
  final Box<NoteModel> noteBox;
  NoteLocalDataSourceImpl(this.noteBox);

  @override
  Future<List<NoteModel>> getNotes() async => noteBox.values.toList();

  @override
  Future<void> addNote(NoteModel note) async => noteBox.put(note.noteId, note);

  @override
  Future<void> deleteNote(String id) async => noteBox.delete(id);
}
