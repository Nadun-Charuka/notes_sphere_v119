import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeIconRowWidget extends StatelessWidget {
  const ThemeIconRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    ThemeMode selectedTheme = themeProvider.themeMode;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// **System Theme Button**
          _themeIconButton(
            icon: Icons.brightness_auto,
            isSelected: selectedTheme == ThemeMode.system,
            onTap: () => themeProvider.toggleTheme(ThemeMode.system),
            color: Colors.blueAccent,
          ),

          /// **Light Theme Button**
          _themeIconButton(
            icon: Icons.wb_sunny,
            isSelected: selectedTheme == ThemeMode.light,
            onTap: () => themeProvider.toggleTheme(ThemeMode.light),
            color: Colors.redAccent,
          ),

          /// **Dark Theme Button**
          _themeIconButton(
            icon: Icons.nights_stay,
            isSelected: selectedTheme == ThemeMode.dark,
            onTap: () => themeProvider.toggleTheme(ThemeMode.dark),
            color: Colors.yellowAccent,
          ),
        ],
      ),
    );
  }

  // **Reusable IconButton for Theme Selection**
  Widget _themeIconButton({
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: IconButton(
        icon: Icon(icon, size: 32, color: isSelected ? color : Colors.grey),
        onPressed: onTap,
        tooltip: "Change Theme",
      ),
    );
  }
}
