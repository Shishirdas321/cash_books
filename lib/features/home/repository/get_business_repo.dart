// // import 'dart:async';
// // import 'package:cash_books/datasource/remote/dio/dio_client.dart';
// // import 'package:dio/dio.dart';
// //
// //
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// //
// // import '../../../core/utils/app_constants.dart';
// //
// // class GetBusinessRepo {
// //   final DioClient  dioClient;
// //   final SharedPreferences sharedPreferences;
// //   GetBusinessRepo({required this.dioClient, required this.sharedPreferences});
// //
// //   //for get business
// //   Future<Response> allBusiness(
// //
// //   )async{
// //     Response _response = await dioClient.get(AppConstants.CREATE_NEW_BUSINESS,);
// //     return _response;
// //   }
// //
// //
// // }
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/app_constants.dart';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import '../../../datasource/remote/dio/utils/api_error_handler.dart';
import '../../../datasource/remote/models/api_response.dart';

class GetBusinessRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  GetBusinessRepo( {required this.dioClient, required this.sharedPreferences});

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

