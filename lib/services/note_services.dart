import 'package:hive/hive.dart';
import 'package:notes_sphere_v116/models/note_model.dart';
import 'package:uuid/uuid.dart';

class NoteService {
  List<NoteModel> allNotes = [
    NoteModel(
      id: Uuid().v4(),
      title: "Meeting Notes",
      category: "work",
      content:
          "Discussed project deadlines and deliverables. Assigned tasks to team members and set up follow-up meetings to track progress.",
      date: DateTime.now(),
    ),
    NoteModel(
      id: const Uuid().v4(),
      title: "Grocery List",
      category: "Personal",
      content:
          "Bought milk, eggs, bread, fruits, and vegetables from the local grocery store. Also added some snacks for the week.",
      date: DateTime.now(),
    ),
    NoteModel(
      id: const Uuid().v4(),
      title: "Book Recommendations",
      category: "Hobby",
      content:
          "Recently read 'Sapiens' by Yuval Noah Harari, which offered fascinating insights into the history of humankind. Also enjoyed 'Atomic Habits' by James Clear, a practical guide to building good habits and breaking bad ones.",
      date: DateTime.now(),
    ),
  ];

//reference to the notes box
  final _myBox = Hive.box("notes");

//chech wether the user is new
  Future<bool> isNewUser() async {
    return _myBox.isEmpty;
  }

  //method to create a initial notes if the box is empty
  Future<void> createInitialNotes() async {
    if (_myBox.isEmpty) {
      await _myBox.put("notes", allNotes);
    }
  }

  Future<List<NoteModel>> loadNotes() async {
    final dynamic notesModel = _myBox.get("notes");
    if (notesModel != null && notesModel is List<dynamic>) {
      return notesModel.cast<NoteModel>().toList();
    }
    return [];
  }

  //categorize notes and make a map
  Map<String, List<NoteModel>> getNotesByCategoryMap(List<NoteModel> allNotes) {
    final Map<String, List<NoteModel>> notesByCategory = {};
    for (final noteModel in allNotes) {
      if (notesByCategory.containsKey(noteModel.category)) {
        notesByCategory[noteModel.category]!.add(noteModel);
      } else {
        notesByCategory[noteModel.category] = [noteModel];
      }
    }
    return notesByCategory;
  }
}
