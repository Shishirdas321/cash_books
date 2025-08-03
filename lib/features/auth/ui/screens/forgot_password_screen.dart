import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const String name = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      //extendBodyBehindAppBar: true,
      body: Stack(
        children:[
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
      key: _formKey,
      child: Column(
        children: [
           SizedBox(height: 60.h),
          const AppLogo(),
           SizedBox(height: 24.h),
          Text(
            'Your Email Address',
            style: AppTextStyles.bodyMedium(color: Colors.white,fontSize: 28.sp),
          ),
           SizedBox(height: 8.h),
           Text(
            'A 6 digits of OTP will be sand to your email address',
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitleSmall(color: Colors.white60,fontSize: 18.sp,),
          ),
           SizedBox(height: 16.h),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
                labelText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
          ),
           SizedBox(height: 16.h),
          ElevatedButton(
            onPressed:_onTapForgotPassButton,
            child:  Text('Forgot Password',style: AppTextStyles.bodyMediumPopins(),),
          ),
           SizedBox(height: 20.h),
          _buildSignInSection(),
        ],
      ),
    );
  }

  Widget _buildSignInSection() {
    return RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: AppTextStyles.titleSmall(color: Colors.white54),
            children: [
              TextSpan(
                  text: 'Sign in',
                  style:  AppTextStyles.bodyMedium(
                    color: Colors.white,
                      fontSize: 17.sp,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationThickness: 2.w,
                      decorationStyle: TextDecorationStyle.solid),
                  recognizer: TapGestureRecognizer()
                    ..onTap = _onTapSignInButton),
            ],
          ),
        );
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  void _onTapForgotPassButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }
}
