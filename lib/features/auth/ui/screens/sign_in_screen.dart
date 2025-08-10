import 'package:cash_books/core/enums/enums.dart';
import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
// import 'package:cash_books/core/screenbackground/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/datasource/local/session.dart';
import 'package:cash_books/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:cash_books/features/auth/ui/screens/sign_up_screen.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../controller/auth_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  bool _obscureText = true;

  final AuthController authController = Get.find();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<AuthController>().init();
    });

  }

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
                padding: const EdgeInsets.all(16),
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
      child: GetBuilder<AuthController>(
        builder: (controller) {
          return Column(
            children: [
              const SizedBox(height: 60),
              const AppLogo(),
              const SizedBox(height: 24),
              Text(
                'Welcome Back',
                style: AppTextStyles.bodyMedium(color: Colors.white,fontSize: 28),
              ),
              const SizedBox(height: 8),
               Text(
                'Enter Your email and password',
                style: AppTextStyles.subtitleSmall(color: Colors.white60,fontSize: 18,),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailTEController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: 'Email',
                   prefixIcon: Icon(Icons.email_outlined)
                   // labelText: 'Email'
                ),
                validator: (String? value){
                  String email = value ?? '';

                  if(!EmailValidator.validate(email)){
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordTEController,
                obscureText: _obscureText,
                decoration: InputDecoration(
                 // labelText: 'Password',
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.themeColor),
                    onPressed: () {
                      _obscureText = !_obscureText;
                      setState(() {});
                    },
                  ),
                ),
                validator: (String? value){
                  if((value?.isEmpty ?? true) || value!.length < 6){
                    return 'Enter a password more then 6 letters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),



              CustomButton(
                loading:controller.isLoading ,
                onTap:   _onTapSignInButton,

                textSize: 20.sp,

                buttonText: 'Sign in',

              ),


              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.themeColor,
                      value: controller.isActiveRememberMe,
                      onChanged: (bool? value) {
                        controller.isActiveRememberMe=value??false;
                      }),
                   Text('Remember me',style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: TextButton(
                  onPressed: _onTapForgotPasswordButton,
                  child:  Text(
                    'Forgot password',
                    style: AppTextStyles.bodyMedium(color: Colors.white,fontSize: 15,decoration: TextDecoration.underline,
                        decorationColor: AppColors.themeColor,
                        decorationThickness: 2.h,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              _buildSignUpSection(),
            ],
          );
        }
      ),
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style:  AppTextStyles.titleSmall(color: Colors.black54),
        children: [
          TextSpan(
              text: 'Sign up',
              style: AppTextStyles.bodyMedium(
                  fontSize: 17.sp,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black,
                  decorationThickness: 2.h,
                  decorationStyle: TextDecorationStyle.solid),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton),
        ],
      ),
    );
  }






  void _onTapSignUpButton() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUpScreen()),);
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushNamed(context, ForgotPasswordScreen.name);
  }

  void _onTapSignInButton() {
    if(_formKey.currentState!.validate()){
      authController.login(email: _emailTEController.text, password: _passwordTEController.text  );

    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
