import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/note_local_datasource.dart';
import '../../data/repositories/note_repository_impl.dart';
import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import 'package:hive/hive.dart';
import '../../data/models/note_model.dart';

final noteBoxProvider = Provider<Box<NoteModel>>((ref) => throw UnimplementedError());

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  final box = ref.watch(noteBoxProvider);
  final dataSource = NoteLocalDataSourceImpl(box);
  return NoteRepositoryImpl(dataSource);
});

final notesProvider = StateNotifierProvider<NotesNotifier, List<Note>>((ref) {
  final repo = ref.watch(noteRepositoryProvider);
  return NotesNotifier(repo);
});

class NotesNotifier extends StateNotifier<List<Note>> {
  final NoteRepository repo;
  NotesNotifier(this.repo) : super([]) { loadNotes(); }

  Future<void> loadNotes() async => state = await repo.getNotes();
  Future<void> addNote(Note note) async { await repo.addNote(note); await loadNotes(); }
  Future<void> deleteNote(String id) async { await repo.deleteNote(id); await loadNotes(); }
}
