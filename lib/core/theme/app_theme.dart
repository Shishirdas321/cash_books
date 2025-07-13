import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData themeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.themeColor),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.themeColor)
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey
      ),
      labelStyle: TextStyle(
        color: AppColors.themeColor,
        fontWeight: FontWeight.w400,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          fixedSize: const Size.fromWidth(double.maxFinite),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
          ),
          foregroundColor: Colors.white,
          backgroundColor: AppColors.themeColor
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.themeColor,
      indicatorColor: Colors.transparent, // Optional
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(color: Colors.black87); // selected text
          }
          return const TextStyle(color: Colors.grey); // unselected text
        },
      ),
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return const IconThemeData(color: Colors.black); // selected icon
          }
          return const IconThemeData(color: Colors.white); // unselected icon
        },
      ),
    )
  );
}