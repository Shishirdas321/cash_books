import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: _buildForm(textTheme),
        ),
      ),
    );
  }

  Form _buildForm(TextTheme textTheme) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const AppLogo(),
          const SizedBox(height: 24),
          Text(
            'Your Email Address',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'A 6 digits of OTP will be sand to your email address',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed:_onTapForgotPassButton,
            child: const Text('Forgot Password'),
          ),
          const SizedBox(height: 20),
          _buildSignInSection(),
        ],
      ),
    );
  }

  Widget _buildSignInSection() {
    return RichText(
          text: TextSpan(
            text: "Already have an account? ",
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                  text: 'Sign in',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.themeColor,
                  ),
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
