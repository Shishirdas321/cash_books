import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  static const String name = '/your-profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: AppColors.themeColor,
        title: Text(
          'Your Profile',
          style: AppTextStyles.appbar(),
        ),
      ),
      body: Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Your name',
                    prefixIcon: Icon(Icons.person_outline,color: Colors.grey,)),
              ),
               SizedBox(height: 16.h),
              TextFormField(
                enabled: false,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,)),
              ),
            ],
          ),
        ),
    );
  }
}
