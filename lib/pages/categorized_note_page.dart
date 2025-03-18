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
      appBar: AppBar(
          title: Text(
        category,
        style: Theme.of(context).textTheme.headlineLarge,
      )), // Display the category name
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) {
            // Get notes for the selected category
            final notesList = noteProvider.notesByCategory[category] ?? [];

            return notesList.isEmpty
                ? Center(child: Text("No notes available in this category"))
                : GridView.builder(
                    shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 5 / 8,
                    ),
                    itemCount: notesList.length, // Set correct item count
                    itemBuilder: (context, index) {
                      final note = notesList[index]; // Get the note
                      return CategoriedNoteCard(
                        title: note.title, // Use note's title
                        content: note.content,
                        id: note.id,
                        dateTime: note.date, // Use note's description
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
