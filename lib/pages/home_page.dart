import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_Providers/note_provider.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/utils/router.dart';
import 'package:notes_sphere_v116/widgets/note_cards/notes_todo_card.dart';
import 'package:notes_sphere_v116/widgets/progress_card.dart';
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
        toolbarHeight: 100,
        leading: Text(""),
        title: Center(
          child: Text.rich(
            TextSpan(
              text: "LecKeeper",
              style: Theme.of(context).textTheme.displayMedium,
              children: [
                TextSpan(
                  text: "\nStudy Smart, Stay Organized",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  AppRouter.router.push("/profile");
                },
                icon: Icon(
                  Icons.account_circle_sharp,
                  size: 40,
                )),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            ProgressCard(),
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
                      icon: Icons.note_outlined,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    AppRouter.router.push("/todos");
                  },
                  child: Selector<TodoProvider, int>(
                    selector: (index, todoProvider) =>
                        todoProvider.tasks.length,
                    builder: (context, alltoDoLength, child) => NotesTodoCard(
                      title: "To-Do",
                      totalItems: "$alltoDoLength Tasks",
                      icon: Icons.calendar_today,
                    ),
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
