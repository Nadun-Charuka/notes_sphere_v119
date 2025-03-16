import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/theme_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/widgets/notes_todo_card.dart';
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "NoteSphere",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        actions: [
          Switch(
            value: themeProvider.themeMode ==
                ThemeMode.dark, // Check if dark mode is enabled
            onChanged: (value) {
              themeProvider
                  .toggleTheme(); // Toggle theme when switch is changed
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            ProgressCard(
              completedTask: 3,
              totalTask: 10,
            ),
            kVerticalSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NotesTodoCard(
                  title: "Notes",
                  description: "3 Notes",
                  icon: Icons.note,
                ),
                NotesTodoCard(
                  title: "To-Do List",
                  description: "5 Tasks",
                  icon: Icons.calendar_today,
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
