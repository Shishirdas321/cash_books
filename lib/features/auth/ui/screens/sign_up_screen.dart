import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/auth/ui/screens/sign_in_screen.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
            'Register Your Account',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Get Started with your details',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Firstname'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Lastname'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: 'phone'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(labelText: 'Password'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _onTapSignUpButton,
            child: const Text('Sign up'),
          ),
          const SizedBox(height: 24),
          RichText(
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
          ),
        ],
      ),
    );
  }

  void _onTapSignUpButton() {

  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }
}
