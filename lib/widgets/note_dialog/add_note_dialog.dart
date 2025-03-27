import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_Providers/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteDialog extends StatelessWidget {
  final String id;
  AddNoteDialog({
    super.key,
    required this.id,
  });

  final TextEditingController titleController = TextEditingController();

  final TextEditingController categoryController = TextEditingController();

  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text("Add"),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                style: Theme.of(context).textTheme.headlineSmall,
                controller: titleController,
                decoration: InputDecoration(labelText: "Title")),
            TextField(
                style: Theme.of(context).textTheme.headlineLarge,
                controller: categoryController,
                decoration: InputDecoration(labelText: "Category")),
            TextField(
                minLines: 10,
                maxLines: 50,
                style: Theme.of(context).textTheme.titleLarge,
                controller: contentController,
                decoration: InputDecoration(
                  labelText: "Content",
                  alignLabelWithHint: true,
                )),
          ],
        ),
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
              id,
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
