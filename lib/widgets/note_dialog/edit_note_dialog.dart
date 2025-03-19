import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_Providers/note_provider.dart';
import 'package:notes_sphere_v116/models/note_model.dart';
import 'package:provider/provider.dart';

class EditNoteDialog extends StatelessWidget {
  final String id;

  const EditNoteDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context, listen: false);

    // Find the existing note
    final NoteModel note = noteProvider.allNotes.firstWhere(
      (note) => note.id == id,
      orElse: () => NoteModel(
          id: id, title: "", category: "", content: "", date: DateTime.now()),
    );

    // Controllers with default values
    final titleController = TextEditingController(text: note.title);
    final categoryController = TextEditingController(text: note.category);
    final contentController = TextEditingController(text: note.content);

    return AlertDialog(
      title: const Text("Save Note"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            style: Theme.of(context).textTheme.headlineSmall,
            controller: titleController,
            decoration: const InputDecoration(labelText: "Title"),
          ),
          TextField(
            style: Theme.of(context).textTheme.headlineLarge,
            controller: categoryController,
            decoration: const InputDecoration(labelText: "Category"),
          ),
          TextField(
            style: Theme.of(context).textTheme.titleLarge,
            controller: contentController,
            decoration: const InputDecoration(labelText: "Content"),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            noteProvider.addNote(
              id, // Ensure the same ID is used
              titleController.text.isEmpty
                  ? "Untitled Note"
                  : titleController.text,
              categoryController.text.isEmpty
                  ? "General"
                  : categoryController.text,
              contentController.text.isEmpty
                  ? "No content provided."
                  : contentController.text,
            );
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
