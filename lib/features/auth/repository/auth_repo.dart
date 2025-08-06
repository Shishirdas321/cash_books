import 'dart:async';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';


import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/utils/app_constants.dart';

class AuthRepo {
  final DioClient  dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  /// for registration code
  Future<Response> registration ({
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
    Response _response = await dioClient.post(AppConstants.REGISTRATION_URI,data:
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
    return _response;
  }


  /// for login code
  Future<Response> login({
    required String email,

    required String password,}) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    return await dioClient.post(AppConstants.LOGIN_URI,data: {
      "email":email,
      "password":password,

    });
  }

  Future<Response> getTokenByRefreashToken({
    required String token,

     }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    return await dioClient.post(AppConstants.REFRESH_TOKEN,data: {

      "token":token,

    });
  }


  //logout all device

  Future<Response> logoutall(
      ) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    return await dioClient.post(AppConstants.LOGOUT_ALL_DEVICE,data: {


    });
  }








}
