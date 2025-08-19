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
  //for get allBusiness
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

//deleteBusiness
  Future<ApiResponse> deleteBusiness(int id) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.delete('${AppConstants.DELETE_BUSINESS}/$id', );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deleteBusiness", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //update business

  Future<ApiResponse> updateBusiness({
    required int id,
    required String name,
    required int status,
  }) async {
    try {
      Response response = await dioClient.put(
        '${AppConstants.UPDATE_BUSINESS}/$id',
        data: {
          "name": name,
          "status": status, // body te status
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(
          e,
          "update_business",
          mustShowErrorInReleaseMode: true,
        ),
      );
    }
  }

  //get book
  Future<ApiResponse> allBook({int page = 1,required int id,
    }) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.ALL_Book}/$id/books',
        queryParameters: {'page': page},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allBook", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //create new book
  Future<ApiResponse> createNewBook({
    required String name,
    required double balance,
    required int id

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.CREATE_NEW_BOOK}/$id/books',
          data: {
        "name":name,
        "balance":balance



      });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "createNewBook", mustShowErrorInReleaseMode: true),
      );
    }


  }












}
