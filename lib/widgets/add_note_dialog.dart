import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteDialog extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  AddNoteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Note"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title")),
          TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: "Category")),
          TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: "Content")),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            final noteProvider =
                Provider.of<NoteProvider>(context, listen: false);
            noteProvider.addNote(
              titleController.text,
              categoryController.text,
              contentController.text,
            );
            Navigator.pop(context);
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
