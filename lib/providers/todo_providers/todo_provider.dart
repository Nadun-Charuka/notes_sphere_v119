import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_sphere_v116/models/task_model.dart';

// Model Class for Task

// Provider for Task Management
class TodoProvider extends ChangeNotifier {
  late Box<TaskModel> taskBox;

  List<TaskModel> get tasks => taskBox.values.toList();

  TodoProvider() {
    _initializeHive();
  }

  Future<void> _initializeHive() async {
    taskBox = Hive.box<TaskModel>('tasksBox'); // Open Hive Box
    notifyListeners(); // Update UI
  }

  void toggleTaskStatus(TaskModel task) {
    int index = taskBox.values.toList().indexOf(task);
    if (index != -1) {
      task.isCompleted = !task.isCompleted;
      task.save(); // Save changes to Hive
      notifyListeners();
    }
  }

  void addTask({
    required String title,
    required DateTime date,
  }) {
    final task = TaskModel(title: title, dateTime: date, isCompleted: false);
    taskBox.add(task); // Add to Hive box
    notifyListeners();
  }

  List<TaskModel> get pendingTasks =>
      tasks.where((t) => !t.isCompleted).toList();
  List<TaskModel> get completedTasks =>
      tasks.where((t) => t.isCompleted).toList();
}
