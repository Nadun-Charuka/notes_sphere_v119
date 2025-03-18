import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/utils/constants.dart';

class NotesTodoCard extends StatefulWidget {
  final String title;
  final String totalItems;
  final IconData icon;
  const NotesTodoCard({
    super.key,
    required this.title,
    required this.totalItems,
    required this.icon,
  });

  @override
  State<NotesTodoCard> createState() => _NotesTodoCardState();
}

class _NotesTodoCardState extends State<NotesTodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          children: [
            Icon(
              widget.icon,
              size: 40,
            ),
            kVerticalSpace10,
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            kVerticalSpace10,
            Text(
              widget.totalItems,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
