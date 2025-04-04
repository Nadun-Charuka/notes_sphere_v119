import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_sphere_v116/models/task_model.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  final bool isCompleted;

  const TaskList({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, taskProvider, child) {
        List<TaskModel> tasks = isCompleted
            ? taskProvider.completedTasks
            : taskProvider.pendingTasks;

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  tasks[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  DateFormat("dd-MM-yyyy 'at' HH:mm")
                      .format(tasks[index].dateTime)
                      .toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: IconButton(
                  icon: Icon(
                    isCompleted ? Icons.replay : Icons.check_box_outline_blank,
                    color: isCompleted ? Colors.red : Colors.green,
                  ),
                  onPressed: () {
                    taskProvider.toggleTaskStatus(tasks[index]);
                    debugPrint("changed");
                  },
                ),
                onLongPress: () {
                  taskProvider.deleteTask(tasks[index]);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Todo deleted"),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
