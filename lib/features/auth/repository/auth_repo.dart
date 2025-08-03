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
    required String name,
    required String mobile_no,
    required String email,
    required String password,
    required String c_password,
    required String address,
    required String shop_name,
    required String area_id,
    required String device_id,
  }) async {
    Response _response = await dioClient.post(AppConstants.REGISTRATION_URI,data:
        {
          "name": name,
          "mobile_no": mobile_no,
          "email": email,
          "password": password,
          "c_password": c_password,
          "address": address,
          "shop_name": shop_name,
          "area_id": area_id,
          "device_id": device_id,
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
    return await dioClient.post(AppConstants.LOGIN_URI,data: {

      "token":token,

    });
  }









}
