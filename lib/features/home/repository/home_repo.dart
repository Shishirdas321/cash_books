import 'dart:async';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';
import 'package:dio/dio.dart';


import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/utils/app_constants.dart';
import '../../../datasource/remote/dio/utils/api_error_handler.dart';

class HomeRepo {
  final DioClient  dioClient;
  final SharedPreferences sharedPreferences;
  HomeRepo({required this.dioClient, required this.sharedPreferences});

 //for create new business
  Future<ApiResponse> createNewBusiness({
    required String name,

    }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(AppConstants.CREATE_NEW_BUSINESS,data: {
        "name":name,


      });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "login", mustShowErrorInReleaseMode: true),
      );
    }


  }
  Future<ApiResponse> allBusiness({int page = 1}) async {
    try {
      Response response = await dioClient.get(
        AppConstants.CREATE_NEW_BUSINESS,
        queryParameters: {'page': page},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allBusiness", mustShowErrorInReleaseMode: true),
      );
    }
  }










}
