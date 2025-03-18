import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_sphere_v116/providers/note_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/widgets/edit_note_dialog.dart';
import 'package:provider/provider.dart';

class CategoriedNoteCard extends StatefulWidget {
  final String title;
  final String id;
  final String content;
  final DateTime dateTime;

  const CategoriedNoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.id,
    required this.dateTime,
  });

  @override
  State<CategoriedNoteCard> createState() => _CategoriedNoteCardState();
}

class _CategoriedNoteCardState extends State<CategoriedNoteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true, // Allows full height
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: Theme.of(context).textTheme.headlineLarge),
                    SizedBox(height: 10),
                    Text(widget.content,
                        style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 10),
                    Text(
                        "Date: ${DateFormat("dd-MM-yyyy").format(widget.dateTime)}",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Close"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.42,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(kDefaultPadding),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => EditNoteDialog(id: widget.id),
                      );
                    },
                    icon: Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<NoteProvider>(context, listen: false)
                          .deleteNote(widget.id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                ],
              ),
              kVerticalSpace10,
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              kVerticalSpace10,

              // Make content take available space
              Expanded(
                child: Text(
                  widget.content,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              kVerticalSpace10,

              // Date at the bottom
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  DateFormat("dd-MM-yyyy").format(widget.dateTime),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
