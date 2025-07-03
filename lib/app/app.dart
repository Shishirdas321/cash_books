import 'package:cash_books/app/app_colors.dart';
import 'package:cash_books/app/app_routes.dart';
import 'package:flutter/material.dart';

class CashBook extends StatefulWidget {
  const CashBook({super.key});

  @override
  State<CashBook> createState() => _CashBookState();
}

class _CashBookState extends State<CashBook> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(
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
      ),
    );
  }
}
