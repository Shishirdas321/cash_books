import 'package:cash_books/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:cash_books/features/auth/ui/screens/sign_in_screen.dart';
import 'package:cash_books/features/auth/ui/screens/sign_up_screen.dart';
import 'package:cash_books/features/auth/ui/screens/splash_screen.dart';
import 'package:cash_books/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:cash_books/features/businessteam/business_team_handel_veiw_screen.dart';
import 'package:cash_books/features/businessteam/choose_role_screen.dart';
import 'package:cash_books/features/businessteam/member_add_to_book_view.dart';
import 'package:cash_books/features/businessteam/member_add_to_select_book.dart';
import 'package:cash_books/features/businessteam/staff_info_screen.dart';

import 'package:cash_books/features/book/ui/screens/add_cash_in_entry_screen.dart';
import 'package:cash_books/features/book/ui/screens/add_cash_out_entry_screen.dart';
import 'package:cash_books/features/help/help_screen.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';
import 'package:cash_books/features/businessteam/add_team_member_screen.dart';
import 'package:cash_books/features/book/ui/screens/business_book_screen.dart';
import 'package:cash_books/features/businessteam/business_team_screen.dart';
import 'package:cash_books/features/home/ui/screens/move_book_screen.dart';
import 'package:cash_books/features/home/ui/screens/update_business_screen.dart';

import 'package:flutter/material.dart';

import '../features/navbar/ui/screens/main_bottom_nav_bar_screen.dart';
import '../features/settings/profile_screen.dart';

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
    }else if(settings.name == BusinessBookScreen.name){
      route = const BusinessBookScreen();
    }else if(settings.name == AddCashInEntryScreen.name){
      route = const AddCashInEntryScreen();
    }else if(settings.name == AddCashOutEntryScreen.name){
      route = const AddCashOutEntryScreen();
    }else if(settings.name == MoveBookScreen.name){
      route = const MoveBookScreen();
    }else if(settings.name == ChooseRoleScreen.name){
      route = const ChooseRoleScreen();
    }else if(settings.name == BusinessTeamHandelViewScreen.name){
      route = const BusinessTeamHandelViewScreen();
    }else if(settings.name == StaffInfoScreen.name){
      route = const StaffInfoScreen();
    }else if(settings.name == MemberAddToBookView.name){
      route = const MemberAddToBookView();
    }else if(settings.name == MemberAddToSelectBook.name){
      route = const MemberAddToSelectBook();
    }else if(settings.name == HelpScreen.name){
      route = const HelpScreen();
    }else if(settings.name == ProfileScreen.name){
      route = const ProfileScreen();
    }else if(settings.name == UpdateBusinessScreen.name);
    return MaterialPageRoute(
      builder: (context) {
        return route;
      },
    );
  }
}
