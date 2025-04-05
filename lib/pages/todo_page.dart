import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/widgets/todo_dialog/add_todo_dialog.dart';
import 'package:notes_sphere_v116/widgets/todo_cards/todo_task_list.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {
            showDialog(context: context, builder: (context) => AddToDoDialog());
          },
          child: Icon(
            Icons.add,
            size: 40,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Text(
                "Todos",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                "Completed",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          title: Text(
            "To-do",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: 5),
          child: TabBarView(
            children: [
              TaskList(isCompleted: false),
              TaskList(isCompleted: true),
            ],
          ),
        ),
      ),
    );
  }
}
