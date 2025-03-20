import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/providers/font_provider.dart';
import 'package:notes_sphere_v116/theme/colors.dart';
import 'package:provider/provider.dart';

class AppTextTheme {
  static TextTheme _getTextTheme(Color color, BuildContext context) {
    final fontProvider = Provider.of<FontProvider>(context, listen: false);
    final TextStyle baseStyle = TextStyle(color: color);

    return TextTheme(
      displayLarge: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 57,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.5,
          )),
      displayMedium: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          )),
      displaySmall: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 36,
            fontWeight: FontWeight.w600,
          )),
      headlineLarge: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          )),
      headlineMedium: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          )),
      headlineSmall: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          )),
      titleLarge: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          )),
      titleMedium: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          )),
      titleSmall: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          )),
      bodyLarge: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
            height: 1.5,
          )),
      bodyMedium: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            height: 1.4,
          )),
      bodySmall: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4,
            height: 1.4,
          )),
      labelLarge: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.25,
          )),
      labelMedium: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          )),
      labelSmall: fontProvider.getTextStyle(
          color,
          baseStyle.copyWith(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          )),
    );
  }

  // Dark Theme
  static TextTheme darkTextTheme(BuildContext context) =>
      _getTextTheme(AppColorsDark.kTextColor, context);

  // Light Theme
  static TextTheme lightTextTheme(BuildContext context) =>
      _getTextTheme(AppColorsLight.kTextColor, context);
}
