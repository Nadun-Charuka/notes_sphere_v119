import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere_v116/providers/font_provider.dart';
import 'package:notes_sphere_v116/utils/constants.dart';
import 'package:notes_sphere_v116/widgets/font_change_card.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Setting",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            kVerticalSpace20,
            Text(
              "Theme Setting",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ThemeIconRowWidget(),
            kVerticalSpace40,
            Text(
              "Font Setting",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "Sample Text: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elit ante, euismod et porta sed, imperdiet quis magna.  ",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: PageScrollPhysics(),
                children: [
                  FontChangeCard(fontName: "Caveat"),
                  FontChangeCard(fontName: "PatrickHand"),
                  FontChangeCard(fontName: "Lato"),
                  FontChangeCard(fontName: "Poppins"),
                  FontChangeCard(fontName: "Inter"),
                  FontChangeCard(fontName: "Roboto"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/**
 * TextButton(
              onPressed: () => fontProvider.setFont('Caveat'),
              child: Text("Caveat", style: GoogleFonts.caveat()),
            ),
 */
