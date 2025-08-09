import 'dart:convert';
import 'dart:io';

import 'package:cash_books/datasource/local/session.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';
import 'package:cash_books/features/home/model/CreateNewBusinessResponse.dart';
import 'package:cash_books/features/home/repository/create_business_repo.dart';
import 'package:cash_books/features/home/ui/screens/home_screen.dart';
import 'package:cash_books/settings/LogoutallResponse.dart';
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






class CreateNewBusinessController extends GetxController implements GetxService {
  final BusinessRepo createBusinessRepo;

  CreateNewBusinessController({
    required this.createBusinessRepo,
  });



  List<String>? area=[];
  String errorMsg="";

  bool _isLoading = false;



  bool get isLoading => _isLoading;
  bool  isLoadingbtn = false;
  set isLoading(bool value) {
    _isLoading = value;
  }



  Future<void> createNewBusiness({
    required String name
})async{
    isLoading = true;
    update();

    ApiResponse apiResponse = await createBusinessRepo.createNewBusiness(name: name);
    if ((apiResponse.response?.statusCode??-1) == 200||(apiResponse.response?.statusCode??-1)==201) {

      BusinessResponse createNewBusinessResponse = BusinessResponse.fromJson(apiResponse.response?.data);
      String msg = createNewBusinessResponse.message?? "";
      showCustomSnackBar('$msg',isError: false,isPosition: true);
      Get.find<DioClient>().resetClientWithNewToken();
      g.Get.off(HomeScreen());
    }else{
     // showCustomSnackBar(.error.toString(),);
      _isLoading = false;
      update();
    }
    isLoading = false;
    update();
  }






}
