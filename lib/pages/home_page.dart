import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/utils/router.dart';
import 'package:notes_sphere_v116/widgets/notes_todo_card.dart';
import 'package:notes_sphere_v116/widgets/progress_card.dart';
import 'package:notes_sphere_v116/widgets/theme_icon_row_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "NoteSphere",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            ThemeIconRowWidget(),
            ProgressCard(
              completedTask: 9,
              totalTask: 10,
            ),
            kVerticalSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/notes");
                  },
                  child: Selector<NoteProvider, int>(
                    selector: (index, noteProvider) =>
                        noteProvider.allNotes.length,
                    builder: (context, allNotesLength, child) => NotesTodoCard(
                      title: "Notes",
                      totalItems: "$allNotesLength Notes",
                      icon: Icons.note,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/todos");
                  },
                  child: NotesTodoCard(
                    title: "To-Do List",
                    totalItems: "5 Tasks",
                    icon: Icons.calendar_today,
                  ),
                )
              ],
            ),
            kVerticalSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's progress",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "See All",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
