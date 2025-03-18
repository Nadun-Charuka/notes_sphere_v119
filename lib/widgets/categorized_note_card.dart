import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/note_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:provider/provider.dart';

class CategoriedNoteCard extends StatefulWidget {
  final String title;
  final String id;
  final String content;

  const CategoriedNoteCard({
    super.key,
    required this.title,
    required this.content,
    required this.id,
  });

  @override
  State<CategoriedNoteCard> createState() => _CategoriedNoteCardState();
}

class _CategoriedNoteCardState extends State<CategoriedNoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      height: 550,
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
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
            ),
            kVerticalSpace10,
            Text(
              widget.content,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
