
import 'package:cash_books/app/app_routes.dart';
import 'package:cash_books/app/controller_binder.dart';
import 'package:cash_books/core/theme/app_theme.dart';
import 'package:cash_books/core/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CashBook extends StatefulWidget {
  const CashBook({super.key});

  @override
  State<CashBook> createState() => _CashBookState();
}

class _CashBookState extends State<CashBook> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetMaterialApp(
      initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: lightTheme(context),
      initialBinding: ControllerBinder(),
    );
  }
}
