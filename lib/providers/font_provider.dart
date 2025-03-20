import 'package:flutter/material.dart';

class FontProvider extends ChangeNotifier {
  // Default font is "Caveat"
  String _selectedFont = "Caveat";

  // Getter for the selected font
  String get selectedFont => _selectedFont;

  // Method to set the selected font
  void setFont(String font) {
    _selectedFont = font;
    notifyListeners(); // Notify listeners (UI) to rebuild
  }
}
