import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      //resizeToAvoidBottomInset: false,
     // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          const Positioned.fill(child: ScreenBackgroundOne()),
          Positioned.fill(
            child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(16.w),
              child: _buildForm(textTheme),
            ),
                    ),
          ),
    ],
      ),
    );
  }

  Form _buildForm(TextTheme textTheme) {
    return Form(
      child: Column(
        children: [
           SizedBox(height: 60.h),
          const AppLogo(),
           SizedBox(height: 24.h),
          Text(
            'PIN Verification',
            style: textTheme.titleLarge,
          ),
           SizedBox(height: 8.h),
           Text(
            'A 6 digits of OTP has been sand to your email address',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white54,
            ),
          ),
           SizedBox(height: 16.h),
        PinCodeTextField(
          length: 6,
          obscureText: false,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5.r),
            fieldHeight: 50.h,
            fieldWidth: 50.w,
            activeFillColor: Colors.white,
            selectedFillColor: Colors.white,
            inactiveFillColor: Colors.white,
            selectedColor: AppColors.themeColor,
            inactiveColor: AppColors.themeColor,
            errorBorderColor: Colors.red,
            activeColor: AppColors.themeColor,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,

          appContext: context,
        ),
           SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: (){},
            child: const Text('Forgot Password'),
          ),

        ],
      ),
    );
  }
}
