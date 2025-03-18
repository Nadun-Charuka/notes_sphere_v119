import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/utils/constants.dart';

class NotesCard extends StatelessWidget {
  final String noteCategory;
  final int noOfNotes;
  const NotesCard({
    super.key,
    required this.noteCategory,
    required this.noOfNotes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Theme.of(context).shadowColor,
              blurRadius: 1,
              offset: Offset(0, 3))
        ],
        color: Theme.of(context).cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noteCategory,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "$noOfNotes",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
