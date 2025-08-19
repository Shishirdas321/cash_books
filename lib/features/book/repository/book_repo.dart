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


  //specific book details
  Future<ApiResponse> specificBookDetails({required int businessId,required int bookId,
  }) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.ALL_Book}/$businessId/books',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allBook", mustShowErrorInReleaseMode: true),
      );
    }
  }












}
