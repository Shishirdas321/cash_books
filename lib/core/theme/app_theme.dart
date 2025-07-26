import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData themeData = ThemeData(
    colorSchemeSeed: AppColors.themeColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.w600,color: Colors.white),
    ),
    inputDecorationTheme: const InputDecorationTheme(fillColor: Colors.white,filled: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white)
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red),
      ),
      hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey
      ),
      labelStyle: TextStyle(
        color: Colors.blueGrey,
        fontWeight: FontWeight.w400,
      ),
      iconColor: Colors.blueGrey
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 6,
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
            return const TextStyle(color: Colors.white); // selected text
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