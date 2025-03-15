import 'package:flutter/material.dart';

class AppColors {
  static Color kBgColor = Color(0xff202326);
  static const Color kFabColor = Color.fromARGB(255, 204, 17, 237);
  static Color kCardColor = const Color(0xff2F3235);
  static Color kWhiteColor = const Color.fromARGB(255, 255, 255, 255);

  //gradient colors
  static const gradientStart = Color(0XFF01F0FF);
  static const gradientEnd = Color(0XFF4441ED);
  LinearGradient kPrimaryGradiet = LinearGradient(
    colors: [
      gradientStart,
      gradientEnd,
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
