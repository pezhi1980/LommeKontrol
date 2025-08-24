import 'package:hive/hive.dart';
import '../../domain/entities/note.dart';
part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends Note {
  @HiveField(0)
  final String noteId;
  @HiveField(1)
  final String noteTitle;
  @HiveField(2)
  final String noteContent;

  NoteModel({required this.noteId, required this.noteTitle, required this.noteContent})
      : super(id: noteId, title: noteTitle, content: noteContent);

  factory NoteModel.fromEntity(Note note) => NoteModel(noteId: note.id, noteTitle: note.title, noteContent: note.content);
}
