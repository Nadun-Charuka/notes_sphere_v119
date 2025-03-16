import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // Default theme mode is light
  ThemeMode _themeMode = ThemeMode.light;

  // Getter for theme mode
  ThemeMode get themeMode => _themeMode;

  // Toggle between light and dark theme
  void toggleTheme() {
    _themeMode =
        (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // Notify listeners that theme has changed
  }
}
