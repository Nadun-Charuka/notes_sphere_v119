import 'package:flutter/material.dart';
import 'package:notes_sphere_v116/utils/colors.dart';

class ThemClass {
  static ThemeData darkThem = ThemeData(
    primaryColor: ThemeData.dark().primaryColor,
    scaffoldBackgroundColor: AppColors.kBgColor,
    colorScheme: ColorScheme.dark().copyWith(
      primary: AppColors.kWhiteColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBgColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.kWhiteColor,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.kFabColor,
    ),
  );
}
