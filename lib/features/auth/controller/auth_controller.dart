import 'dart:convert';
import 'dart:io';

import 'package:cash_books/datasource/local/session.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';
import 'package:cash_books/features/home/controllers/home_controller.dart';
import 'package:cash_books/features/home/ui/screens/add_new_business_screen.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart' as g;
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';




import '../../../core/widgets/custom_snackbar.dart';

import '../../../datasource/remote/dio/dio_client.dart';

import '../../navbar/ui/screens/main_bottom_nav_bar_screen.dart';
import '../../settings/LogoutallResponse.dart';
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




init(){
    _isActiveRememberMe=Session.getIsRememberMe();
    if(_isActiveRememberMe){
      emailController.text=Session.getUserEmail();
      passwordController.text=Session.getUserPassword();
           }
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

    ApiResponse apiResponse  = await authRepo.registration(
      phone_no: phone_no,
      email: email,
      password: password,
      c_password: c_password,
      last_name: last_name,
      first_name: first_name,
    );
    if ((apiResponse.response?.statusCode??-1) == 200||(apiResponse.response?.statusCode??-1)==201) {

      LoginResponse loginResponse=LoginResponse.fromJson(apiResponse.response?.data );
      String msg=loginResponse.message??"";

      Session.saveToken(loginResponse.data?.token??"");
      Session.saveSession(jsonEncode(loginResponse.data?.user));
      showCustomSnackBar('$msg', isError: false, isPosition: true);
      Get.find<DioClient>().resetClientWithNewToken();
     // g.Get.offAllNamed(MainBottomNavBarScreen.name);
      if(Get.find<HomeController>().businessList.isEmpty){
        g.Get.offAll(AddNewBusinessScreen());
      }else{
        g.Get.offAllNamed(MainBottomNavBarScreen.name);
      }


    } else {
      showCustomSnackBar(apiResponse.error.toString(),);


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
    ApiResponse apiResponse = await authRepo.login(email: email,password: password,   );


    if ((apiResponse.response?.statusCode??-1) == 200) {


       LoginResponse loginResponse=LoginResponse.fromJson(apiResponse.response?.data);
       if((loginResponse?.success??false)){
         Session.saveToken(loginResponse?.data?.token??"");
         Session.saveSession(jsonEncode(loginResponse.data?.user?.toJson()));
         await Session.saveIsRememberMe(_isActiveRememberMe);
         showCustomSnackBar(loginResponse.message??"", isError: false, isPosition: true);
         if(_isActiveRememberMe){
              await Session.saveUserEmail(email);
              await Session.saveUserPass(password);
         }

         Get.find<DioClient>().resetClientWithNewToken();
        // Get.offAllNamed(MainBottomNavBarScreen.name);
         //new added
         final businessList = Get.find<HomeController>().businessList;
         if (businessList.isEmpty) {
           Get.offAll(() => AddNewBusinessScreen());
         } else {
           Get.offAllNamed(MainBottomNavBarScreen.name);
         }
       }else{
         _isLoading = false;
         update();
       }











    }else{
      _isLoading = false;
      update();
      //showCustomSnackBar(response.body["message"]);
    }
    _isLoading = false;
    update();
  }





  Future<void> logOutAll(
  ) async {
    _isLoading = true;
    update();
    ApiResponse apiResponse = await authRepo.logOutAll( );
    String msg=apiResponse.response?.data["message"]??"";
    showCustomSnackBar('$msg', isError: false, isPosition: true);
    if ((apiResponse.response?.statusCode??-1) == 200) {


      LogoutallResponse logoutallResponse=LogoutallResponse.fromJson(apiResponse.response?.data);
       if((logoutallResponse?.success??false)){
         Session.signOut();


     }else{
       _isLoading = false;
       update();
      showCustomSnackBar( logoutallResponse?.message??"");
    }
    _isLoading = false;
    update();
  }
  }












}
