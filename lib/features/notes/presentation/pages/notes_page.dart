import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/note.dart';
import '../providers/note_providers.dart';
import '../widgets/note_tile.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, i) => NoteTile(note: notes[i]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = Note(id: DateTime.now().toString(), title: 'New Note', content: 'Hello Riverpod + Hive!');
          await ref.read(notesProvider.notifier).addNote(note);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
