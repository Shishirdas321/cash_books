import 'dart:convert';
import 'dart:io';

import 'package:cash_books/datasource/local/session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';




import '../../../core/widgets/custom_snackbar.dart';

import '../repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({
    required this.authRepo,
  });

  LoginResponse? loginResponse = null;

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






  //
  // /// Registration
  // Future<void> getRegistration({
  //   required String name,
  //   required String mobile_no,
  //   required String email,
  //   required String password,
  //   required String c_password,
  //   required String address,
  //   required String shop_name,
  //   required String area_id,
  //
  // }) async {
  //   isLoadingbtn = true;
  //   update();
  //
  //   Response response = await authRepo.registration(
  //     name: name,
  //     mobile_no: mobile_no,
  //     email: email,
  //     password: password,
  //     c_password: c_password,
  //     address: address,
  //     shop_name: shop_name,
  //     area_id: area_id,
  //     device_id: deviceId,
  //   );
  //   if (response.statusCode == 200) {
  //     Get.back();
  //     showCustomSnackBar('Registration Successful', isError: false, isPosition: true);
  //   //  Get.off(SignIn(exitFromApp: false)) ;
  //     // showCustomSnackBar(jsonDecode(response.body)["message"], isError: false);
  //   } else {
  //     isLoadingbtn = false;
  //     update();
  //     showCustomSnackBar(response.body["message"].toString(),);
  //    // ApiChecker.checkApi(response);
  //   }
  //   isLoadingbtn = false;
  //   update();
  // }


  /// for login Code
  Future<void> login({required String mobile_no,required String password,
    required String deviceToken,}) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(mobile_no: mobile_no,password: password,   );
    if (response.statusCode == 200) {
      //loginResponse=LoginResponse.fromJson(response.body);
      if(_isActiveRememberMe){
      //  await se(mobile_no, password);
      }else{
       // await authRepo.clearUserNumberAndPassword();
      }
      //Session.saveToken(loginResponse?.data?.token??"");





    //  Session.save(loginResponse!.userInfo!.customerName!,loginResponse!.userInfo!.cellNo!);
     // showCustomSnackBar(response.body["message"],isError: false, isPosition: true);
    //  errorMsg=response.body["message"];
    //  Get.off(DashboardScreen());

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
