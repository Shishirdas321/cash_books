import 'package:cash_books/core/fonts/app_text_style.dart';
import 'package:cash_books/core/screen_background/screen_background_one.dart';
import 'package:cash_books/features/auth/controller/auth_controller.dart';
import 'package:cash_books/features/auth/ui/widgets/app_logo.dart';
import 'package:cash_books/features/home/controllers/home_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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
  final TextEditingController _confirmPasswordTEController =TextEditingController();
  final PhoneController _phoneController = PhoneController(
    const PhoneNumber(isoCode: IsoCode.BD, nsn: ''),
  );


  PhoneNumber? _phoneNumber;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeController>().allBusiness(page: 1);
  }

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
      //autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
           SizedBox(height: 60.h),
          const AppLogo(),
           SizedBox(height: 24.h),
          Text(
            'Register Your Account',
            style: AppTextStyles.bodyMedium(color: Colors.white,fontSize: 28.sp),
          ),
           SizedBox(height: 8.h),
           Text(
            'Get Started with your details',
            style:AppTextStyles.subtitleSmall(color: Colors.white60,fontSize: 18.sp,),
          ),
           SizedBox(height: 16.h),
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
           SizedBox(height: 8.h),
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
           SizedBox(height: 8.h),
          TextFormField(
            controller: _lastNameTEController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Lastname',prefixIcon: Icon(Icons.drive_file_rename_outline_outlined),),
            validator: (String? value){
              if(value?.trim().isEmpty ?? true){
                return 'Enter your last name';
              }
              return null;
            },
          ),
           SizedBox(height: 8.h),
          PhoneFormField(
            textInputAction: TextInputAction.next,
            controller: _phoneController,
            defaultCountry: IsoCode.BD, // 🇧🇩 Bangladesh default
           // showFlagInInput: true,//n
            //countrySelectorNavigator:  CountrySelectorNavigator.bottomSheet(),//n
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
            decoration:   InputDecoration(

              hintText: 'Select your country & enter phone no', prefixIcon: Card.outlined(child: Padding(
               padding: EdgeInsets.all(8.w),
               child: const Wrap(children: [Icon(Icons.phone),Icon(Icons.arrow_drop_down_sharp)],),
             ),),
             // prefixIcon: Container(child:Wrap(children: [Icon(Icons.phone),Spacer(),Icon(Icons.arrow_drop_down_sharp)],) ,color: Colors.grey,),
              border: OutlineInputBorder(),
            ),
          ),
           SizedBox(height: 8.h),
          TextFormField(
            controller: _passwordTEController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(hintText: 'Password',prefixIcon: Icon(Icons.password_outlined)),
            validator: (String? value){
              if((value?.isEmpty ?? true) || value!.length < 8){
                return 'Enter a password more then 8 letters';
              }
              return null;
            },
          ),
           SizedBox(height: 8.h),
          TextFormField(
            controller: _confirmPasswordTEController,
            textInputAction: TextInputAction.done,
            decoration:
            const InputDecoration(hintText: 'Confirm Password',prefixIcon: Icon(Icons.email_outlined)),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your confirm password';
              }else if(value!.length<6){
                return 'Password must be more then 6 letters';
              }else if(value != _passwordTEController.text){
                return 'Password do not match';
              }
              return null;
            },
          ),
           SizedBox(height: 16.h),

          ElevatedButton(
            onPressed: _onTapSignUpButton,
            child:  Text('Sign up',style: AppTextStyles.bodyMediumPopins(),),
          ),
           SizedBox(height: 24.h),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style:AppTextStyles.titleSmall(color: Colors.black54),
              children: [
                TextSpan(
                    text: 'Sign in',
                    style: AppTextStyles.bodyMedium(
                        fontSize: 17.sp,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.black,
                        decorationThickness: 2.w,
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
      String countryCode=_phoneController.value?.countryCode??"";
      String phoneNumber=countryCode+(_phoneController.value?.nsn??"");
       Get.find<AuthController>().getRegistration(phone_no:phoneNumber, email: _emailTEController.text, password: _passwordTEController.text, c_password: _confirmPasswordTEController.text, first_name: _firstNameTEController.text, last_name: _lastNameTEController.text);

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
