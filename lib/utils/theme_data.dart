import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/utils/colors.dart';

class AppThemes {
  // Dark Theme
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColorsDark.kBgColor,
    scaffoldBackgroundColor: AppColorsDark.kBgColor,
    colorScheme: ColorScheme.dark().copyWith(
      primary: AppColorsDark.kTextColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsDark.kBgColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColorsDark.kTextColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorsDark.kFabColor,
    ),
    cardColor: AppColorsDark.kCardColor,
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: AppColorsDark.kTextColor),
      titleLarge: TextStyle(color: AppColorsDark.kTextColor),
      titleMedium: TextStyle(color: AppColorsDark.kTextColor),
      bodyLarge: TextStyle(color: AppColorsDark.kTextColor),
      bodyMedium: TextStyle(color: AppColorsDark.kTextColor),
    ),
  );

  // Light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColorsLight.kBgColor,
    scaffoldBackgroundColor: AppColorsLight.kBgColor,
    colorScheme: ColorScheme.light().copyWith(
      primary: AppColorsLight.kTextColor,
      secondary: AppColorsLight.kFabColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColorsLight.kBgColor,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColorsLight.kTextColor),
      titleTextStyle: TextStyle(
        color: AppColorsLight.kTextColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColorsLight.kFabColor,
      foregroundColor: Colors.white,
    ),
    cardColor: AppColorsLight.kCardColor,
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: AppColorsLight.kTextColor),
      titleLarge: TextStyle(color: AppColorsLight.kTextColor),
      titleMedium: TextStyle(color: AppColorsLight.kTextColor),
      bodyLarge: TextStyle(color: AppColorsLight.kTextColor),
      bodyMedium: TextStyle(color: AppColorsLight.kTextColor),
    ),
  );
}
