import 'package:cash_books/app/app_colors.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const String name = '/sign-in';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
            'Welcome Back',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Enter Your email and password',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          const SizedBox(height: 8),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign in'),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                    text: 'Sign up',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.themeColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _onTapSignUpButton),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.pop(context);
  }
}
