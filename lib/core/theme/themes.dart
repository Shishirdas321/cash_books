import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

TextTheme buildTextThemeLight(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final scale =
      screenWidth < 360
          ? 0.85
          : screenWidth < 480
          ? 1.0
          : screenWidth < 720
          ? 1.1
          : 1.2;

  return TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24 * scale,
      fontWeight: FontWeight.w700,
      color: AppColors.black,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12 * scale,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14 * scale,
      fontWeight: FontWeight.w400,
      color: AppColors.black,
    ),

    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16 * scale,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    ),

  );
}

TextTheme buildTextThemeDark(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final scale =
      screenWidth < 360
          ? 0.85
          : screenWidth < 480
          ? 1.0
          : screenWidth < 720
          ? 1.1
          : 1.2;

  return TextTheme(
    headlineMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 24 * scale,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),

    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12 * scale,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),

    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 14 * scale,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),

    labelLarge: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16 * scale,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  );
}

ThemeData lightTheme(BuildContext context) => ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.yellow,
  fontFamily: 'Poppins',
  hoverColor: AppColors.white,
  shadowColor: AppColors.grayLight,
    cardColor: AppColors.containerBgLight,
  disabledColor: AppColors.grayLight,
  canvasColor: AppColors.grayLight.withOpacity(0.2),
  scaffoldBackgroundColor: AppColors.lightBackground,

  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: AppColors.lightBackground,
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.lightBackground,
    iconColor: AppColors.black,

    textStyle: buildTextThemeDark(context).bodySmall,
  ),
  textTheme: buildTextThemeLight(context),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.themeColor,
      textStyle: buildTextThemeLight(
        context,

      ).labelLarge?.copyWith(fontWeight: FontWeight.w700,color: AppColors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),

  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.black),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputFillLight,
    focusedErrorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular( 10.r),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ) ,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(width: 1, color: AppColors.black),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(width: 1, color: AppColors.btnLightBorder),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(width: 1, color: AppColors.btnLightBorder),
    ),
  ),
);

ThemeData darkTheme(BuildContext context) => ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.yellow,
  fontFamily: 'Poppins',
  hoverColor: AppColors.white,
  shadowColor: AppColors.grayLight,
  cardColor: AppColors.containerBgDark,
  disabledColor: AppColors.grayLight,
  canvasColor: AppColors.transparent,
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColors.textBlack),
  popupMenuTheme: PopupMenuThemeData(
    color: AppColors.darkBackground,
    iconColor: AppColors.white,
    textStyle: buildTextThemeDark(context).bodySmall,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.white,
      textStyle: buildTextThemeLight(
        context,
      ).labelLarge?.copyWith(fontWeight: FontWeight.w700),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(cursorColor: AppColors.white),
  scaffoldBackgroundColor: AppColors.darkBackground,
  textTheme: buildTextThemeDark(context),

  dropdownMenuTheme: DropdownMenuThemeData(
    textStyle: buildTextThemeDark(context).bodyMedium,

  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.inputFillDark,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(width: 1, color: AppColors.yellow),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(width: 1, color: AppColors.btnDarkBorder),
    ),
    focusedErrorBorder:OutlineInputBorder(
      borderRadius: BorderRadius.circular( 10.r),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ) ,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: AppColors.btnDarkBorder,width: 1),
    ),
  ),
);
