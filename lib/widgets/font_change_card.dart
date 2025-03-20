import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere_v116/providers/font_provider.dart';
import 'package:provider/provider.dart';

class FontChangeCard extends StatefulWidget {
  final String fontName;
  const FontChangeCard({
    super.key,
    required this.fontName,
  });

  @override
  State<FontChangeCard> createState() => _FontChangeCardState();
}

class _FontChangeCardState extends State<FontChangeCard> {
  final Map<String, TextStyle Function({TextStyle? textStyle})> fontMap = {
    'Caveat': GoogleFonts.caveat,
    'PatrickHand': GoogleFonts.patrickHand,
    'Lato': GoogleFonts.lato,
    'Poppins': GoogleFonts.poppins,
    'Inter': GoogleFonts.inter,
    'Roboto': GoogleFonts.roboto,
    // Add more fonts as needed
  };
  @override
  Widget build(BuildContext context) {
    final fontProvider = Provider.of<FontProvider>(context);
    final textStyleFunction = fontMap[widget.fontName] ?? GoogleFonts.roboto;

    return InkWell(
      onTap: () => fontProvider.setFont(widget.fontName),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: fontProvider.selectedFont == widget.fontName
              ? Theme.of(context)
                  .floatingActionButtonTheme
                  .backgroundColor!
                  .withValues(alpha: 0.5) // Highlight selected font
              : Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(widget.fontName,
                style: textStyleFunction().copyWith(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
