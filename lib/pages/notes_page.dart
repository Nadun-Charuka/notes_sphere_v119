import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/pages/categorized_note_page.dart';
import 'package:notes_sphere_v116/providers/note_provider.dart';
import 'package:notes_sphere_v116/utils/router.dart';
import 'package:notes_sphere_v116/widgets/add_note_dialog.dart';
import 'package:notes_sphere_v116/widgets/notes_card.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NoteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Icon(
          Icons.add,
          size: 40,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          // Show dialog to add a new note
          showDialog(
            context: context,
            builder: (context) => AddNoteDialog(),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            noteProvider.allNotes.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Text("No notes available, click + to add new note"),
                  )
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: kDefaultPadding,
                      mainAxisSpacing: kDefaultPadding,
                      childAspectRatio: 6 / 4,
                    ),
                    itemCount: noteProvider.notesByCategory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: NotesCard(
                          noteCategory: noteProvider.notesByCategory.keys
                              .elementAt(index),
                          noOfNotes: noteProvider.notesByCategory.values
                              .elementAt(index)
                              .length,
                        ),
                        onTap: () {
                          AppRouter.router.push(
                              "/categorizedNotePage/${noteProvider.notesByCategory.keys.elementAt(index)}");
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
