
import 'package:cash_books/app/app_routes.dart';
import 'package:cash_books/app/controller_binder.dart';
import 'package:cash_books/core/theme/app_theme.dart';
import 'package:cash_books/core/theme/themes.dart';
import 'package:cash_books/features/auth/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/utils/app_constants.dart';

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
     /* initialRoute: '/',
      onGenerateRoute: AppRoutes.onGenerateRoute,*/
      home: SplashScreen() ,
        theme: lightTheme(context),
      title: AppConstants.APP_NAME,
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,


      defaultTransition: Transition.topLevel,
      transitionDuration: Duration(milliseconds: 500),
    );
  }
}
