import 'dart:async';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';
import 'package:dio/dio.dart';


import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/utils/app_constants.dart';
import '../../../datasource/remote/dio/utils/api_error_handler.dart';

class BusinessTeamRepo {
  final DioClient  dioClient;
  final SharedPreferences sharedPreferences;
  BusinessTeamRepo({required this.dioClient, required this.sharedPreferences});


  //Add Team member
  Future<ApiResponse> addTeamMember({
    required String email,
    required int businessId,
    required String role

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.ADD_TEME_MEMBER}/add-member',
          data: {
            "email":email,
            "business_id":businessId,
            "role":role,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "addTeamMember", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //Get team member
  Future<ApiResponse> getTeamMember({ required int businessId,
  }) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.GET_TEAM_MEMBER}/team?business_id=$businessId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "getTeamMember", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //Change Team role
  Future<ApiResponse> changeRole({
    required int userId,
    required int businessId,
    required String role

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.CHANGE_ROLE}/change-role',
          data: {
            "user_id":userId,
            "business_id":businessId,
            "role":role,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "changeTeamRole", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //Remove Team member
  Future<ApiResponse> removeTeamMember({
    required int userId,
    required int businessId,

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.REMOVE_TEAM_BUSINESS}/remove-member',
          data: {
            "user_id":userId,
            "business_id":businessId,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "removeTeamMember", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //Get all book accessList user wish
  Future<ApiResponse> allBookAccessListUserWish({ required int businessId,required int userId
  }) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.ALLBOOKACCESSLISTUSERWISH}/$businessId/users/$userId/books',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allBookAccessListUserWish", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //Add book access
  Future<ApiResponse> addBookAccess({
    required int bookId,
    required int businessId,
    required String role,
    required int userId

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.ADDBOOKACCESS}/$businessId/books/$bookId/access',
          data: {
            "user_id":userId,
            "role":role,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "addBookAccess", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //Change Book role
  Future<ApiResponse> changeBookRole({
    required int userId,
    required int businessId,
    required String role,
    required int bookId
  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.put(
          '${AppConstants.CHANGE_BOOK_ROLE}/$businessId/books/$bookId/access',
          data: {
            "user_id":userId,
            "role":role,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "changeBookRole", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //delete book access
  Future<ApiResponse> deleteBookAccess({
    required int userId,
    required int businessId,
    required int bookId
  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.delete(
          '${AppConstants.REMOVE_BOOK_ACCESS}/$businessId/books/$bookId/access',
          data: {
            "user_id":userId,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deleteBookAccess", mustShowErrorInReleaseMode: true),
      );
    }
  }















}
