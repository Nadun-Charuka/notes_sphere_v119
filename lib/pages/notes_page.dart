import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/models/note_model.dart';
import 'package:notes_sphere_v116/services/note_services.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final NoteService noteService = NoteService();
  List<NoteModel> allNotes = [];
  Map<String, List<NoteModel>> notesWithCategory = {};

  @override
  void initState() {
    super.initState();
    _checkAndCreateData();
  }

  //check weather the user is new
  void _checkAndCreateData() async {
    final bool isNewUser = await noteService.isNewUser();
    debugPrint("$isNewUser");
    // if the user is new create the inital notes
    if (isNewUser) {
      await noteService.createInitialNotes();
    }
    _loadNotes();
  }

  //load the notes
  Future<void> _loadNotes() async {
    final List<NoteModel> loadedNotes = await noteService.loadNotes();
    final Map<String, List<NoteModel>> notesByCategory =
        noteService.getNotesByCategoryMap(loadedNotes);
    setState(() {
      allNotes = loadedNotes;
      notesWithCategory = notesByCategory;
      debugPrint("$notesWithCategory");
      debugPrint("${allNotes.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Icon(
          Icons.add,
          size: 40,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {},
      ),
    );
  }
}
