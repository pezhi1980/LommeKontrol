import '../entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote(Note note);
  Future<void> deleteNote(String id);
}
