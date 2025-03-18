import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  late final String title;
  @HiveField(2)
  late final String category;
  @HiveField(3)
  late final String content;
  @HiveField(4)
  late final DateTime date;

  NoteModel({
    String? id,
    required this.title,
    required this.category,
    required this.content,
    required this.date,
  }) : id = id ?? const Uuid().v4();
}
