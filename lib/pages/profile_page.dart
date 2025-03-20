import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere_v116/providers/font_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/widgets/theme_icon_row_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // Get the current selected font from the provider
    final selectedFont = Provider.of<FontProvider>(context).selectedFont;

    // Function to map the font name to a TextStyle
    TextStyle getFont(String fontName) {
      switch (fontName) {
        case "Caveat":
          return GoogleFonts.caveat();
        case "PatrickHand":
          return GoogleFonts.patrickHand();
        case "Lato":
          return GoogleFonts.lato();
        case "Inter":
          return GoogleFonts.inter();
        default:
          return GoogleFonts.roboto(); // Default font
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Setting",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          kVerticalSpace20,
          Text(
            "Theme Setting",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ThemeIconRowWidget(),
          kVerticalSpace40,

//font ***************************************************
          Text(
            "Font Setting",
            style: Theme.of(context).textTheme.titleLarge,
          ),

          /* Font selector*/
          Text(
            'This is the selected font!',
            style: getFont(selectedFont).copyWith(fontSize: 24),
          ),
          SizedBox(height: 20),

          // List of font options as Radio buttons
          Column(
            children: [
              ListTile(
                title: Text('Caveat', style: getFont("Caveat")),
                leading: Radio<String>(
                  value: "Caveat",
                  groupValue: selectedFont,
                  onChanged: (String? value) {
                    Provider.of<FontProvider>(context, listen: false)
                        .setFont(value!);
                  },
                ),
              ),
              ListTile(
                title: Text('Patrick Hand', style: getFont("PatrickHand")),
                leading: Radio<String>(
                  value: "PatrickHand",
                  groupValue: selectedFont,
                  onChanged: (String? value) {
                    Provider.of<FontProvider>(context, listen: false)
                        .setFont(value!);
                  },
                ),
              ),
              ListTile(
                title: Text('Lato', style: getFont("Lato")),
                leading: Radio<String>(
                  value: "Lato",
                  groupValue: selectedFont,
                  onChanged: (String? value) {
                    Provider.of<FontProvider>(context, listen: false)
                        .setFont(value!);
                  },
                ),
              ),
              ListTile(
                title: Text('Inter', style: getFont("Inter")),
                leading: Radio<String>(
                  value: "Inter",
                  groupValue: selectedFont,
                  onChanged: (String? value) {
                    Provider.of<FontProvider>(context, listen: false)
                        .setFont(value!);
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


    /**
     * Caveat - handwriting
     * patrickHand -natural handwriting 

     * lato -Professional
     * inter -modern and clean look
     */