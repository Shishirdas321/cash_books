import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/core/theme/app_colors.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  // final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final PhoneController _phoneController = PhoneController(
    const PhoneNumber(isoCode: IsoCode.BD, nsn: ''),
  );


  PhoneNumber? _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children:[
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
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 60),
          const AppLogo(),
          const SizedBox(height: 24),
          Text(
            'Register Your Account',
            style: AppTextStyles.bodyMedium(color: Colors.white,fontSize: 28),
          ),
          const SizedBox(height: 8),
           Text(
            'Get Started with your details',
            style:AppTextStyles.subtitleSmall(color: Colors.white60,fontSize: 18,),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Email',prefixIcon: Icon(Icons.email)),
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
            controller: _firstNameTEController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Firstname',prefixIcon: Icon(Icons.drive_file_rename_outline)),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your first name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _lastNameTEController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Lastname',prefixIcon: Icon(Icons.drive_file_rename_outline_outlined)),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your last name';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          PhoneFormField(
            textInputAction: TextInputAction.next,
            controller: _phoneController,
            defaultCountry: IsoCode.BD, // 🇧🇩 Bangladesh default
            validator: (PhoneNumber? number) {
    if (number == null || !number.isValid()) {
    return 'Enter a valid phone number';
    }
    return null;
    },

      onChanged: (phone) {
              _phoneNumber = phone;
              //print('Phone: ${phone?.international}');
            },
            decoration: const InputDecoration(
              hintText: 'Phone',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(hintText: 'Password',prefixIcon: Icon(Icons.password_outlined)),
            validator: (String? value){
              if((value?.isEmpty ?? true) || value!.length < 6){
                return 'Enter a password more then 6 letters';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _onTapSignUpButton,
            child:  Text('Sign up',style: AppTextStyles.bodyMediumPopins(),),
          ),
          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style:AppTextStyles.titleSmall(color: Colors.black54),
              children: [
                TextSpan(
                    text: 'Sign in',
                    style: AppTextStyles.bodyMedium(
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 2,
                        decorationStyle: TextDecorationStyle.solid),
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
    if(_formKey.currentState!.validate()){
      //Navigator.pushNamed(context, SignInScreen.name);

    }
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _phoneController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
