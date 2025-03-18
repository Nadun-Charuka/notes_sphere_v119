import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_sphere_v116/models/note_model.dart';
import 'package:uuid/uuid.dart';

class NoteProvider extends ChangeNotifier {
  final Box _noteBox = Hive.box("notes");
  List<NoteModel> _allNotes = [];

  List<NoteModel> get allNotes => _allNotes;
  Map<String, List<NoteModel>> get notesByCategory =>
      _categorizeNotes(_allNotes);

  NoteProvider() {
    _loadNotes();
    createInitialNotes();
  }

  // Load notes from Hive
  Future<void> _loadNotes() async {
    final dynamic notesData = _noteBox.get("notes");
    if (notesData != null && notesData is List<dynamic>) {
      _allNotes = notesData.cast<NoteModel>().toList();
    } else {
      _allNotes = [];
    }
    notifyListeners();
  }

  // Check if the user is new
  Future<bool> isNewUser() async {
    return _noteBox.isEmpty;
  }

  // Create initial notes
  Future<void> createInitialNotes() async {
    if (_noteBox.isEmpty) {
      _allNotes = [
        NoteModel(
          id: Uuid().v4(),
          title: "Meeting Notes",
          category: "work",
          content: "Discussed project deadlines and deliverables.",
          date: DateTime.now(),
        ),
        NoteModel(
          id: Uuid().v4(),
          title: "Grocery List",
          category: "Personal",
          content: "Bought milk, eggs, bread, fruits, and vegetables.",
          date: DateTime.now(),
        ),
        NoteModel(
          id: Uuid().v4(),
          title: "Book Recommendations",
          category: "Hobby",
          content: "Recently read 'Sapiens' and 'Atomic Habits'.",
          date: DateTime.now(),
        ),
      ];
      await _noteBox.put("notes", _allNotes);
      notifyListeners();
    }
  }

  // Categorize notes
  Map<String, List<NoteModel>> _categorizeNotes(List<NoteModel> notes) {
    final Map<String, List<NoteModel>> notesByCategory = {};
    for (final note in notes) {
      notesByCategory.putIfAbsent(note.category, () => []).add(note);
    }
    return notesByCategory;
  }

  // Add a new note
  Future<void> addNote(String title, String category, String content) async {
    final newNote = NoteModel(
      id: Uuid().v4(),
      title: title,
      category: category,
      content: content,
      date: DateTime.now(),
    );
    _allNotes.add(newNote);
    await _noteBox.put("notes", _allNotes);
    notifyListeners();
  }

  // Delete a note
  Future<void> deleteNote(String noteId) async {
    _allNotes.removeWhere((note) => note.id == noteId);
    await _noteBox.put("notes", _allNotes);
    notifyListeners();
  }
}
