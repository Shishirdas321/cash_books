import 'dart:convert';
import 'dart:io';

import 'package:cash_books/datasource/local/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';




import '../../../core/widgets/custom_snackbar.dart';

import '../../../datasource/remote/dio/dio_client.dart';
import '../../common/ui/screens/main_bottom_nav_bar_screen.dart';
import '../model/LoginResponse.dart';
import '../repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });



  List<String>? area=[];
  String errorMsg="";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;

  set isActiveRememberMe(bool value) {
    _isActiveRememberMe = value;
    update();
  }

  bool get isLoading => _isLoading;
  bool  isLoadingbtn = false;
  set isLoading(bool value) {
    _isLoading = value;
  }







  /// Registration
  Future<void> getRegistration({
    required String phone_no,
    required String email,
    required String password,
    required String c_password,
    required String first_name,
    required String last_name,


  }) async {
    isLoadingbtn = true;
    update();

    Response response = await authRepo.registration(
      phone_no: phone_no,
      email: email,
      password: password,
      c_password: c_password,
      last_name: last_name,
      first_name: first_name,
    );
    if (response.statusCode == 200||response.statusCode==201) {

      LoginResponse loginResponse=LoginResponse.fromJson(response.data);
      String msg=response.data["message"];

      Session.saveToken(loginResponse.data?.token??"");
      Session.saveSession(jsonEncode(loginResponse.data?.user));
      showCustomSnackBar('$msg', isError: false, isPosition: true);
      g.Get.off(MainBottomNavBarScreen());
      Get.find<DioClient>().resetClientWithNewToken();
    //  Get.off(SignIn(exitFromApp: false)) ;
      // showCustomSnackBar(jsonDecode(response.body)["message"], isError: false);
    } else {
      isLoadingbtn = false;
      update();
     // showCustomSnackBar(response.body["message"].toString(),);
     // ApiChecker.checkApi(response);
    }
    isLoadingbtn = false;
    update();
  }


  /// for login Code
  Future<void> login({required String email,required String password,
     }) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(email: email,password: password,   );
    if (response.statusCode == 200) {


       LoginResponse loginResponse=LoginResponse.fromJson(response.data);
       if((loginResponse?.success??false)){
         Session.saveToken(loginResponse?.data?.token??"");
         Session.saveSession(jsonEncode(loginResponse.data?.user?.toJson()));
         if(_isActiveRememberMe){
           //  await se(mobile_no, password);
         }else{
           // await authRepo.clearUserNumberAndPassword();
         }

         g.Get.off(MainBottomNavBarScreen());
       }else{

       }











    }else{
      _isLoading = false;
      update();
      //showCustomSnackBar(response.body["message"]);
    }
    _isLoading = false;
    update();
  }
  //
  // void loginVerification() async {
  //
  //   String mobile_no = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //
  //   if (mobile_no.isEmpty) {
  //     showCustomSnackBar('Enter User ID', isPosition: true);
  //   } else if (password.isEmpty) {
  //     showCustomSnackBar('Enter Password', isPosition: true);
  //   } else if (password.length < 4) {
  //     showCustomSnackBar('The Password must be at least 5 Characters', isPosition: true);
  //   } else {
  //     String deviceId=await getDeviceId();
  //     //String deviceId="a8d8697be9488988";
  //     login(password: password, mobile_no: mobile_no, deviceToken: deviceId, );
  //   }
  // }
















}
