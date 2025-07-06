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
  );
}