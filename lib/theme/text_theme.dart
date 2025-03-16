import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_sphere_v116/theme/colors.dart';

class AppTextTheme {
  // Common Font Style using Caveat font
  static TextTheme _getTextTheme(Color color) {
    return TextTheme(
      displayLarge: GoogleFonts.caveat(
        fontSize: 57,
        fontWeight: FontWeight.bold,
        letterSpacing: -1.5,
        color: color,
      ),
      displayMedium: GoogleFonts.caveat(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: color,
      ),
      displaySmall: GoogleFonts.caveat(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineLarge: GoogleFonts.caveat(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
      headlineMedium: GoogleFonts.caveat(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: color,
      ),
      headlineSmall: GoogleFonts.caveat(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleLarge: GoogleFonts.caveat(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleMedium: GoogleFonts.caveat(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      titleSmall: GoogleFonts.caveat(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      bodyLarge: GoogleFonts.caveat(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
        height: 1.5,
        color: color,
      ),
      bodyMedium: GoogleFonts.caveat(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.25,
        height: 1.4,
        color: color,
      ),
      bodySmall: GoogleFonts.caveat(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.4,
        height: 1.4,
        color: color.withValues(alpha: 0.7),
      ),
      labelLarge: GoogleFonts.caveat(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.25,
        color: color,
      ),
      labelMedium: GoogleFonts.caveat(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
        color: color,
      ),
      labelSmall: GoogleFonts.caveat(
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
