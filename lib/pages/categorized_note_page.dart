import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/widgets/categorized_note_card.dart';
import 'package:provider/provider.dart';

class CategorizedNotePage extends StatelessWidget {
  final String category;
  const CategorizedNotePage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)), // Display the category name
      body: Consumer<NoteProvider>(
        builder: (context, noteProvider, child) {
          // Get notes for the selected category
          final notes = noteProvider.notesByCategory[category] ?? [];

          return notes.isEmpty
              ? Center(child: Text("No notes available in this category"))
              : GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: kDefaultPadding,
                    mainAxisSpacing: kDefaultPadding,
                    childAspectRatio: 3 / 5,
                  ),
                  itemCount: notes.length, // Set correct item count
                  itemBuilder: (context, index) {
                    final note = notes[index]; // Get the note
                    return CategoriedNoteCard(
                      title: note.title, // Use note's title
                      content: note.content,
                      id: note.id, // Use note's description
                    );
                  },
                );
        },
      ),
    );
  }
}
