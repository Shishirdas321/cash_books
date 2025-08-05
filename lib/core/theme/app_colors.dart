import 'package:flutter/material.dart';

class AppColors {
  // Shared colors
  static const Color blue = Color(0xFF016F94);
  static const Color themeColor = Color(0xFF8c4cf8);
  static const Color yellow = Color(0xFFFFBD39);
  static const Color pink = Color(0xFFFD456B);
  static const Color black = Color(0xFF212121);
  static const Color blackAlpha = Color(0xFF262626);
  static const Color blackAlpha1 = Color(0xFF2F2D27);
  static const Color gray = Color(0xFF8C8E99);
  static const Color red = Color(0xFFEA4C2D);
  static const Color green = Color(0xFF4CAF50);

  static const Color grayLight = Color(0xFFAAACB6);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  // Light theme
  static const Color lightBackground = Color(0xFFFFFFFF); // Matches your light mood JSON
  static const Color inputFillLight = white;
  static const Color cartBorder = Color(0xffEEEEEE);

  // Dark theme
  static const Color darkBackground = Color(0xFF1E1E1E);
  static const Color inputFillDark = Color(0xFF2D2D2D);
    static const Color borderDark = Color(0xFF3E3E3E);
  static const Color border2 = Color(0xFF626262);
  static const Color bottomSheetBgLight = Color(0xFFFFF9EC);
  static const Color bottomSheetBgDark = Color(0xFF373737);

  // Borders and neutral colors
  static const Color btnLightBorder = Color(0xFFE8E8E8);

  static const Color btnDarkBorder = Color(0xFF626262);
  static const Color textGray = Color(0xFF999999);
  static const Color textBlack = Color(0xFF212121);
  static const Color btnBorder = Color(0xFF626262);


  static const Color hintText = Color(0xFFAAACB6);
  static const Color containerBgLight = Color(0xFFFAFAFA);
  static const Color containerBgDark = Color(0xFF171717);





  ///status colors
  static const Color pending = Color(0xFF626262);
  static const Color shipped = Color(0xFF6F42C1);
  static const Color outOfDelivery = Color(0xFFFD7E14);
  static const Color delivery = Color(0xFF28A745);





  // Gradients
  static const LinearGradient mainGradient = LinearGradient(
    colors: [Color(0xFFB28F47), Color(0xFF2C2E30)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFA7648D), Color(0xFF6A6A4A)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
