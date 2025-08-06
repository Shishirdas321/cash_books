import 'dart:async';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';


import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/utils/app_constants.dart';
import '../../../datasource/remote/dio/utils/api_error_handler.dart';
import '../../../datasource/remote/models/api_response.dart';

class AuthRepo {
  final DioClient  dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  /// for registration code
  Future<ApiResponse> registration ({
  // "first_name": "John",
  // "last_name": "Doe",
  // "email": "sisu.doe@example.com",
  // "phone": "1234507831",
  // "password": "password123",
  // "password_confirmation": "password123"

    required String phone_no,
    required String email,
    required String password,
    required String c_password,
    required String first_name,
    required String last_name,

  }) async {

    try{
    Response  response = await dioClient.post(AppConstants.REGISTRATION_URI,data:
        {

          "phone": phone_no,
          "email": email,
          "password": password,
          "password_confirmation": c_password,
          "first_name": first_name,
          "last_name": last_name,
          // "area_id": area_id,
          // "device_id": device_id,
        });
    return ApiResponse.withSuccess(response);


  }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "registration", mustShowErrorInReleaseMode: true),
      );
    }
  }


  /// for login code
  Future<ApiResponse> login({
    required String email,

    required String password,}) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
    Response response= await dioClient.post(AppConstants.LOGIN_URI,data: {
      "email":email,
      "password":password,

    });
    return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "login", mustShowErrorInReleaseMode: true),
      );
    }

  }

  Future<ApiResponse> getTokenByRefreashToken({
    required String token,

     }) async {
     try{
    Response response= await dioClient.post(AppConstants.REFRESH_TOKEN,data: {

      "token":token,

    });
    return ApiResponse.withSuccess(response);

  }catch(e){
       return ApiResponse.withError(
         ApiErrorHandler.handle(e, "getTokenByRefreashToken", mustShowErrorInReleaseMode: true),
       );
  }
  }


  //logout all device

  Future<ApiResponse> logOutAll(
      ) async {
    try {
    Response response=await dioClient.post(AppConstants.LOGOUT_ALL_DEVICE,data: {


    });

    return ApiResponse.withSuccess(response);
  }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "logOutAll", mustShowErrorInReleaseMode: true),
      );
    }
    }








}
