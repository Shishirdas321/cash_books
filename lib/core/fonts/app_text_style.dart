/*
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class AppTextStyles {
  static const appbar = TextStyle(fontFamily: 'appBarText',color: Colors.white);
  static const bodymedium = TextStyle(fontFamily: 'popins',fontSize: 20,color: AppColors.themeColor);
  static const bodyMediumWhite = TextStyle(fontFamily: 'popins',fontSize: 15,color: Colors.white);
  static const titleSmall = TextStyle(fontFamily: 'popins',fontSize: 14,color: AppColors.themeColor);
  static const subtitleSmall = TextStyle(fontFamily: 'appBarText',fontSize: 13,);
  static const bodyMediumPopins = TextStyle(fontSize: 16,fontFamily: 'popins',color: Colors.white, );

}
*/
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {

  // Base method
  static TextStyle _base({
    required String fontFamily,
    required double defaultSize,
    required Color defaultColor,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? decoration,
    Color? decorationColor,
    double? decorationThickness,
    TextDecorationStyle? decorationStyle,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize ?? defaultSize,
      color: color ?? defaultColor,
      fontWeight: fontWeight,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle,
    );
  }

  // Variants
  static TextStyle appbar({Color? color, double? fontSize,FontWeight? fontWeight,}) =>
      _base(fontFamily: 'appBarText', defaultSize: 26, defaultColor: Colors.white, color: color, fontSize: fontSize,fontWeight: fontWeight,);

  static TextStyle bodyMedium({Color? color, double? fontSize,FontWeight? fontWeight,TextDecoration? decoration,Color? decorationColor,double? decorationThickness,TextDecorationStyle? decorationStyle}) =>
      _base(fontFamily: 'popins', defaultSize: 20, defaultColor: AppColors.themeColor, color: color, fontSize: fontSize,fontWeight: fontWeight,decoration: decoration,decorationColor: decorationColor,decorationThickness: decorationThickness,decorationStyle: decorationStyle);

  static TextStyle bodyMediumWhite({Color? color, double? fontSize,FontWeight? fontWeight,}) =>
      _base(fontFamily: 'popins', defaultSize: 15, defaultColor: Colors.white, color: color, fontSize: fontSize,fontWeight: fontWeight,);

  static TextStyle titleSmall({Color? color, double? fontSize,FontWeight? fontWeight,}) =>
      _base(fontFamily: 'popins', defaultSize: 14, defaultColor: AppColors.themeColor, color: color, fontSize: fontSize,fontWeight: fontWeight,);

  static TextStyle subtitleSmall({Color? color, double? fontSize,FontWeight? fontWeight,}) =>
      _base(fontFamily: 'appBarText', defaultSize: 13, defaultColor: Colors.black, color: color, fontSize: fontSize,fontWeight: fontWeight,);

  static TextStyle bodyMediumPopins({Color? color, double? fontSize,FontWeight? fontWeight,}) =>
      _base(fontFamily: 'popins', defaultSize: 16, defaultColor: Colors.white, color: color, fontSize: fontSize,fontWeight: fontWeight,);
}
