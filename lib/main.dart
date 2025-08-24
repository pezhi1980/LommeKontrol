import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/notes/data/models/note_model.dart';
import 'features/notes/presentation/pages/notes_page.dart';
import 'features/notes/presentation/providers/note_providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  final box = await Hive.openBox<NoteModel>('notes');

  runApp(ProviderScope(overrides: [noteBoxProvider.overrideWithValue(box)], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: NotesPage());
}
