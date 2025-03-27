import 'package:hive_flutter/hive_flutter.dart';

part 'task_model.g.dart';

@HiveType(typeId: 3)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isCompleted;
  @HiveField(2)
  final DateTime dateTime;

  TaskModel({
    required this.title,
    required this.isCompleted,
    required this.dateTime,
  });
}
