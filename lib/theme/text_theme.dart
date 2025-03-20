import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere_v116/theme/colors.dart';

class AppTextTheme {
  static TextTheme _getTextTheme(Color color) {
    final TextStyle font = GoogleFonts.caveat();
    return TextTheme(
      displayLarge: font.copyWith(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: color,
      ),
      displayMedium: font.copyWith(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: color,
      ),
      displaySmall: font.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineLarge: font.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: font.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: font.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleLarge: font.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleMedium: font.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleSmall: font.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: font.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        height: 1.5,
        color: color,
      ),
      bodyMedium: font.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        height: 1.4,
        color: color,
      ),
      bodySmall: font.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.4,
        height: 1.4,
        color: color.withValues(alpha: 0.7),
      ),
      labelLarge: font.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25,
        color: color,
      ),
      labelMedium: font.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: color,
      ),
      labelSmall: font.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1,
        color: color.withValues(alpha: 0.7),
      ),
    );
  }

  // Dark Theme
  static TextTheme darkTextTheme = _getTextTheme(AppColorsDark.kTextColor);

  // Light Theme
  static TextTheme lightTextTheme = _getTextTheme(AppColorsLight.kTextColor);
}
