import 'package:flutter/material.dart';

// Model Class for Task
class Task {
  String title;
  bool isCompleted;
  DateTime dateTime;

  Task({
    required this.title,
    this.isCompleted = false,
    required this.dateTime,
  });
}

// Provider for Task Management
class TodoProvider extends ChangeNotifier {
  List<Task> tasks = [
    Task(
      title: "Buy Groceries",
      isCompleted: false,
      dateTime: DateTime.now().add(Duration(hours: 5)),
    ),
    Task(
      title: "Do Homework",
      isCompleted: true,
      dateTime: DateTime.now().add(Duration(hours: 5)),
    ),
  ];

  void toggleTaskStatus(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    notifyListeners();
  }

  void addTask({
    required String title,
    required DateTime date,
  }) {
    Task task = Task(
      title: title,
      dateTime: date,
    );
    tasks.add(task);
  }

  List<Task> get pendingTasks => tasks.where((t) => !t.isCompleted).toList();
  List<Task> get completedTasks => tasks.where((t) => t.isCompleted).toList();
}
