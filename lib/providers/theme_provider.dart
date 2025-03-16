import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  late final Box _box;
  ThemeProvider() {
    _initHive();
  }

  Future<void> _initHive() async {
    _box = Hive.box('themeBox');
    await _loadThemeMode();
  }

  /// Loads theme mode from Hive storage
  Future<void> _loadThemeMode() async {
    int? storedTheme = _box.get('themeMode'); // Get stored value
    if (storedTheme != null) {
      _themeMode =
          ThemeMode.values[storedTheme]; // Convert integer to ThemeMode
    }
    notifyListeners();
  }

  /// Toggles theme and saves the preference
  Future<void> toggleTheme(ThemeMode mode) async {
    _themeMode = mode;
    await _box.put(
        'themeMode', mode.index); // Store theme as an integer (0, 1, 2)
    notifyListeners();
  }
}
