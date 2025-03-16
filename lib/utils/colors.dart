import 'package:flutter/material.dart';

class AppColorsDark {
  static const Color kBgColor = Color(0xff202326); // Dark background color
  static const Color kFabColor = Color.fromARGB(255, 204, 17, 237); // FAB color
  static const Color kCardColor = Color(0xff2F3235); // Dark card color
  static const Color kTextColor =
      Color.fromARGB(255, 255, 255, 255); // Light text color for readability

  // Gradient colors for dark theme
  static const Color gradientStart =
      Color(0XFF01F0FF); // Start color of gradient
  static const Color gradientEnd = Color(0XFF4441ED); // End color of gradient
  static const LinearGradient kPrimaryGradient = LinearGradient(
    colors: [
      gradientStart,
      gradientEnd,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class AppColorsLight {
  static const Color kBgColor =
      Color(0xffF8F9FA); // Light background color (soft warm white)
  static const Color kFabColor = Color(0xFFFF9800); // Warm orange FAB
  static const Color kCardColor = Color(0xffFFFFFF); // Clean white cards
  static const Color kTextColor =
      Color(0xff2D2D2D); // Dark gray text for readability

  // Gradient colors for light theme
  static const Color gradientStart = Color(0XFF7BC6CC); // Soft cyan-blue
  static const Color gradientEnd = Color(0XFFBE93C5); // Muted purple-lavender
  static const LinearGradient kPrimaryGradient = LinearGradient(
    colors: [
      gradientStart,
      gradientEnd,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
