import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FontProvider with ChangeNotifier {
  final Box _box = Hive.box('fonts');
  static const String _fontKey = 'selectedFont';

  // Load the font from Hive
  String get _selectedFont {
    return _box.get(_fontKey, defaultValue: 'Caveat'); // Default font
  }

  String get selectedFont => _selectedFont;

  // Set the font and save it in Hive
  void setFont(String font) {
    _box.put(_fontKey, font);
    notifyListeners();
  }

  // Get the text style for the selected font
  TextStyle getTextStyle(Color color, TextStyle style) {
    switch (_selectedFont) {
      case 'Poppins':
        return GoogleFonts.poppins(textStyle: style, color: color);
      case 'Inter':
        return GoogleFonts.inter(textStyle: style, color: color);
      case 'Roboto':
        return GoogleFonts.roboto(textStyle: style, color: color);
      case 'PatrickHand':
        return GoogleFonts.patrickHand(textStyle: style, color: color);
      case 'Lato':
        return GoogleFonts.lato(textStyle: style, color: color);

      // Add more fonts as needed
      default:
        return GoogleFonts.caveat(textStyle: style, color: color);
    }
  }
}
