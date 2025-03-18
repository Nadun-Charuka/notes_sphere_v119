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

  Future<void> addNote(
      String? id, String title, String category, String content) async {
    // Check if the note already exists by its ID
    final index = _allNotes.indexWhere((note) => note.id == id);

    if (index != -1) {
      // If note exists, update it
      _allNotes[index] = NoteModel(
        id: id, // Keep the existing id
        title: title,
        category: category,
        content: content,
        date: DateTime.now(), // Update the date or keep it as is
      );
      debugPrint("Updated existing note");
    } else {
      // If note does not exist, add a new one
      final newNote = NoteModel(
        id: Uuid().v4(),
        title: title,
        category: category,
        content: content,
        date: DateTime.now(),
      );
      _allNotes.add(newNote);
      debugPrint("Added new note");
    }

    // Save to Hive and notify listeners
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
