import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_sphere_v116/providers/todo_providers/todo_provider.dart';
import 'package:provider/provider.dart';

class HomepageTodoCard extends StatefulWidget {
  const HomepageTodoCard({super.key});

  @override
  State<HomepageTodoCard> createState() => _HomepageTodoCardState();
}

class _HomepageTodoCardState extends State<HomepageTodoCard> {
  @override
  Widget build(BuildContext context) {
    final upcomingtodolist = Provider.of<TodoProvider>(context).upcomingTasks;
    final taskProvider = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: upcomingtodolist.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(
              upcomingtodolist[index].title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              DateFormat("dd-MM-yyyy 'at' HH:mm")
                  .format(upcomingtodolist[index].dateTime)
                  .toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.check_box_outline_blank,
                color: Colors.green,
              ),
              onPressed: () {
                taskProvider.toggleTaskStatus(upcomingtodolist[index]);
                debugPrint("changed");
              },
            ),
            onLongPress: () {
              taskProvider.deleteTask(upcomingtodolist[index]);
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
  }
}
