import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/auth/ui/screens/forgot_password_screen.dart';
import 'package:cash_books/features/auth/ui/screens/sign_up_screen.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:cash_books/features/common/ui/screens/main_bottom_nav_bar_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadRememberedData();
  }

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
            controller: _emailTEController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: 'Email'),
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
              labelText: 'Password',
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
          ElevatedButton(
            onPressed:  _onTapSignInButton,
            child: const Text('Sign in'),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                activeColor: AppColors.themeColor,
                  value: rememberMe,
                  onChanged: (bool? value) {
                    rememberMe = value ?? false;
                    setState(() {});
                  }),
              const Text('Remember me'),
            ],
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: _onTapForgotPasswordButton,
              child: const Text(
                'Forgot password',
                style: TextStyle(color: AppColors.themeColor),
              ),
            ),
          ),
          _buildSignUpSection(),
        ],
      ),
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        text: "Don't have an account? ",
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        children: [
          TextSpan(
              text: 'Sign up',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.themeColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton),
        ],
      ),
    );
  }

  Future<void> _saveRememberedData() async{
    final SharedPreferences localData = await SharedPreferences.getInstance();
    if(rememberMe){
      await localData.setString('email', _emailTEController.text.trim());
      await localData.setString('password', _passwordTEController.text);
      await localData.setBool('rememberMe', true);
    }else{
      await localData.remove('email');
      await localData.remove('password');
      await localData.setBool('rememberMe', false);
    }
  }

  Future<void> _loadRememberedData()async {
    final SharedPreferences localData = await SharedPreferences.getInstance();
    final savedEmail = localData.getString('email');
    final savedPassword = localData.getString('password');
    final remember = localData.getBool('rememberMe') ?? false;

    if(remember){
      _emailTEController.text = savedEmail ?? '';
      _passwordTEController.text = savedPassword ?? '';
      rememberMe = true;
      setState(() {});
    }
  }


  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  void _onTapForgotPasswordButton() {
    Navigator.pushNamed(context, ForgotPasswordScreen.name);
  }

  void _onTapSignInButton() {
    if(_formKey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, MainBottomNavBarScreen.name);
      _saveRememberedData();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
