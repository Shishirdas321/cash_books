import 'dart:async';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';


import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/utils/app_constants.dart';

class CreateBusinessRepo {
  final DioClient  dioClient;
  final SharedPreferences sharedPreferences;
  CreateBusinessRepo({required this.dioClient, required this.sharedPreferences});

 //for create new business
 Future<Response> createNewBusiness({
    required String name
})async{
   Response _response = await dioClient.post(AppConstants.CREATE_NEW_BUSINESS,data: {
     "name": name
   });
   return _response;
 }











}
