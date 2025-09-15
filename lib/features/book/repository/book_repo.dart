import 'dart:async';
import 'package:cash_books/datasource/remote/dio/dio_client.dart';
import 'package:cash_books/datasource/remote/models/api_response.dart';
import 'package:dio/dio.dart';


import 'package:shared_preferences/shared_preferences.dart';


import '../../../core/utils/app_constants.dart';
import '../../../datasource/remote/dio/utils/api_error_handler.dart';

class BookRepo {
  final DioClient  dioClient;
  final SharedPreferences sharedPreferences;
  BookRepo({required this.dioClient, required this.sharedPreferences});


  //specific book details
  Future<ApiResponse> specificBookDetails({required int businessId,required int bookId,
  }) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.SPECIFIC_BOOK_DETAILS}/$businessId/books/$bookId',
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "specificBookDetails", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //book category
  Future<ApiResponse> createBookCategory({
    required String name,
    required int bookId

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.BOOK_CATEGORY}/$bookId/categories',
          data: {
            "name":name,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "createBookCategory", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //Get book category
  Future<ApiResponse> allCategory({int page = 1, required int bookId}) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.BOOK_CATEGORY}/$bookId/categories',
        queryParameters: {'page': page},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allCategory", mustShowErrorInReleaseMode: true),
      );
    }
  }
  //delete category
  Future<ApiResponse> deleteCategory(int bookId,int categoryId) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.delete('${AppConstants.DELETE_BOOK_CATEGORY}/$bookId/categories/$categoryId', );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deleteCategory", mustShowErrorInReleaseMode: true),
      );
    }


  }

  //UPDATE CATEGORY
  Future<ApiResponse> updateCategory({
    required int bookId,
    required int categoryId,
    required String name,
    required int status,
  }) async {
    try {
      Response response = await dioClient.put(
        '${AppConstants.EDIT_BOOK_CATEGORY}/$bookId/categories/$categoryId',
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
          "update_category",
          mustShowErrorInReleaseMode: true,
        ),
      );
    }
  }

  //Get contact person
  Future<ApiResponse> allContactPerson({int page = 1, required int bookId}) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.CONTACT_PERSON}/$bookId/contact-persons',
        queryParameters: {'page': page},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allCategory", mustShowErrorInReleaseMode: true),
      );
    }
  }
  //CREATE CONTACT PERSON
  Future<ApiResponse> createContactPerson({
    required String name,
    required String number,
    required int bookId

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.BOOK_CATEGORY}/$bookId/contact-persons',
          data: {
            "name":name,
            "mobile_no":number
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "createContactPerson", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //UPDATE contact person
  Future<ApiResponse> updateContactPerson({
    required int bookId,
    required int categoryId,
    required String name,
    required String phone,
  }) async {
    try {
      Response response = await dioClient.put(
        '${AppConstants.EDIT_CONTACT_PERSON}/$bookId/contact-persons/$categoryId',
        data: {
          "name": name,
          "mobile_no":phone
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(
          e,
          "update_contact_person",
          mustShowErrorInReleaseMode: true,
        ),
      );
    }
  }

  //delete contact person
  Future<ApiResponse> deleteContactPerson(int bookId,int contactPerId) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.delete('${AppConstants.DELETE_CONTACT_PERSON}/$bookId/contact-persons/$contactPerId', );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deleteContactPerson", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //Get payment method
  Future<ApiResponse> allPaymentMethod({int page = 1, required int businessId}) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.PAYMENT_METHOD}/$businessId/payment-modes',
        queryParameters: {'page': page},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "allPaymentMethod", mustShowErrorInReleaseMode: true),
      );
    }
  }
  //CREATE CONTACT PERSON
  Future<ApiResponse> createPaymentMethod({
    required String name,
    required int businessId

  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.post(
          '${AppConstants.CREATE_PAYMENT_METHOD}/$businessId/payment-modes',
          data: {
            "name":name,
          });
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "createPaymentMethod", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //UPDATE payment method
  Future<ApiResponse> updatePaymentMethod({
    required int businessId,
    required int paymentMethodId,
    required String name,

  }) async {
    try {
      Response response = await dioClient.put(
        '${AppConstants.EDIT_PAYMENT_METHOD}/$businessId/payment-modes/$paymentMethodId',
        data: {
          "name": name,
        },
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(
          e,
          "updatePaymentMethod",
          mustShowErrorInReleaseMode: true,
        ),
      );
    }
  }
  //delete payment method
  Future<ApiResponse> deletePaymentMethod( int businessId,int paymentId) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.delete('${AppConstants.DELETE_PAYMENT_METHOD}/$businessId/payment-modes/$paymentId', );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deletePaymentMethod", mustShowErrorInReleaseMode: true),
      );
    }
  }
  //CREATE Cash in
  Future<ApiResponse> createCashInAndOut({
    required String date,
    required String time,
    required int type,
    required int amount,
    int? contactId,       //  nullable
    int? categoryId,      //  nullable
   required int paymentModeId,
    required String remarks,
    required int bookId,
  }) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try {
      final data = {
        "opt_date": date,
        "opt_time": time,
        "type": type,
        "amount": amount,
        "remarks": remarks,
        "payment_mode_id":paymentModeId
      };

      if (contactId != null) data["contact_id"] = contactId;
      if (categoryId != null) data["category_id"] = categoryId;
      if (paymentModeId != null) data["payment_mode_id"] = paymentModeId;

      Response response = await dioClient.post(
        '${AppConstants.CREATE_CASH_IN}/$bookId/items',
        data: data,
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(
          e,
          "createCashIn",
          mustShowErrorInReleaseMode: true,
        ),
      );
    }
  }
  //Get transaction history
  Future<ApiResponse> transactionHistory({int page = 1, required int bookId}) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.TRANSACTION_HISTORY}/$bookId/items',
        queryParameters: {'page': page},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "transactionHistory", mustShowErrorInReleaseMode: true),
      );
    }
  }
  //Get SPECIFIC transaction
  Future<ApiResponse> specificTransaction({ required int bookId,required int selectedId}) async {
    try {
      Response response = await dioClient.get(
        '${AppConstants.SPECIFIC_TRANSACTION_DETAILS}/$bookId/items/$selectedId',

      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "specificTransaction", mustShowErrorInReleaseMode: true),
      );
    }
  }

  //delete transaction details
  Future<ApiResponse> deleteTransactionDetails( int bookId,int selectedId) async {
    // return await apiClient.postData(AppConstants.LOGIN_URI, {"jsonData":jsonEncode(loginBody.toJson())});
    try{
      Response response= await dioClient.delete('${AppConstants.DELETE_TRANSACTION_DETAILS}/$bookId/items/$selectedId', );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(
        ApiErrorHandler.handle(e, "deleteTransactionDetails", mustShowErrorInReleaseMode: true),
      );
    }
  }















}
