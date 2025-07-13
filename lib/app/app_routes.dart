import 'package:cash_books/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:cash_books/features/auth/ui/screens/sign_in_screen.dart';
import 'package:cash_books/features/auth/ui/screens/sign_up_screen.dart';
import 'package:cash_books/features/auth/ui/screens/splash_screen.dart';
import 'package:cash_books/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:cash_books/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:cash_books/features/home/ui/screens/add_team_member_screen.dart';
import 'package:cash_books/features/home/ui/screens/business_team_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    } else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    }else if(settings.name == ForgotPasswordScreen.name){
      route = const ForgotPasswordScreen();
    }else if(settings.name == VerifyOtpScreen.name){
      route = const VerifyOtpScreen();
    }else if(settings.name == MainBottomNavBarScreen.name){
      route = const MainBottomNavBarScreen();
    }else if(settings.name == AddNewBusinessScreen.name){
      route = const AddNewBusinessScreen();
    }else if(settings.name == BusinessTeamScreen.name){
      route = const BusinessTeamScreen();
    }else if(settings.name == AddTeamMemberScreen.name){
      route = const AddTeamMemberScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
