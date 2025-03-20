import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/theme/colors.dart';
import 'package:notes_sphere_v116/theme/text_theme.dart';

class AppThemes {
  // Dark Theme
  static ThemeData darkTheme(BuildContext context) => ThemeData(
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
        textTheme: AppTextTheme.darkTextTheme(context),
      );

  // Light Theme
  static ThemeData lightTheme(BuildContext context) => ThemeData(
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
        textTheme: AppTextTheme.lightTextTheme(context),
      );
}
