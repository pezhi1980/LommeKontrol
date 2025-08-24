import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_local_datasource.dart';
import '../models/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;
  NoteRepositoryImpl(this.localDataSource);

  @override
  Future<List<Note>> getNotes() => localDataSource.getNotes();

  @override
  Future<void> addNote(Note note) => localDataSource.addNote(NoteModel.fromEntity(note));

  @override
  Future<void> deleteNote(String id) => localDataSource.deleteNote(id);
}
