import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontProvider with ChangeNotifier {
  String _selectedFont = 'Caveat'; // Default font

  String get selectedFont => _selectedFont;

  void setFont(String font) {
    _selectedFont = font;
    notifyListeners();
  }

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

/**
 *         case "Caveat":
          return GoogleFonts.caveat();
        case "PatrickHand":
          return GoogleFonts.patrickHand();
        case "Lato":
          return GoogleFonts.lato();
        case "Inter":
          return GoogleFonts.inter();
        default:
          return GoogleFonts.roboto();
*/
