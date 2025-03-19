import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  final bool isCompleted;

  const TaskList({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, taskProvider, child) {
        List<Task> tasks = isCompleted
            ? taskProvider.completedTasks
            : taskProvider.pendingTasks;

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(tasks[index].title),
                subtitle: Text(tasks[index].dateTime.toString()),
                trailing: IconButton(
                  icon: Icon(
                    isCompleted ? Icons.replay : Icons.check_box_outline_blank,
                    color: isCompleted ? Colors.red : Colors.green,
                  ),
                  onPressed: () {
                    taskProvider.toggleTaskStatus(tasks[index]);

                    debugPrint("");
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
