import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_two.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  static const String name = '/help';

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        elevation: 6,
        backgroundColor: AppColors.themeColor,
        title:  Text(
          'Help & Support',
          style: AppTextStyles.appbar(),
        ),
      ),
      body:  Padding(
            padding: EdgeInsets.all(8.0.w),
            child:  Column(
              children: [
                SizedBox(height: 20.h),
                const Divider(),
                ListTile(
                  title: const Text('Need support?',style: TextStyle(fontFamily: 'popins'),),
                  subtitle: const Text('Email',style: TextStyle(fontFamily: 'popins'),),
                  trailing: Text('shishird076@gmail.com',style: TextStyle(fontFamily: 'popins',fontSize: 13.sp),),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Contact & WhatsApp",style: TextStyle(fontFamily: 'popins'),),
                  trailing: Text('01867660754',style: TextStyle(fontFamily: 'popins',fontSize: 13.sp),),
                ),
                const Divider()
              ],
            ),
          )
    );
  }
}
