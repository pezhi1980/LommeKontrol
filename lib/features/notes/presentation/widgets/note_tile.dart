import 'package:flutter/material.dart';
import '../../domain/entities/note.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) => ListTile(title: Text(note.title), subtitle: Text(note.content));
}
