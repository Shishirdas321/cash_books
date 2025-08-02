import 'dart:developer';
import 'dart:io';

import 'package:cash_books/remote/dio/utils/appconstant.dart';

import 'package:cash_books/remote/dio/utils/logging_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:songly/core/utils/ext.dart';
import 'package:songly/datasource/remote/dio/utils/logging_interceptor.dart';
import 'package:songly/datasource/remote/dio/utils/token_interceptor.dart';

import '../../../../utils/appconstant.dart';
import '../../local/session.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;
  final SharedPreferences sharedPreferences;

  Dio? dio;
  String? token;
  String? countryCode;

  DioClient(
      this.baseUrl,
      Dio? dioC, {
        required this.loggingInterceptor,
        required this.sharedPreferences,
      }) {
    initDioClient(dioC);
  }

  void resetClientWithNewToken() {
    initDioClient(null);
  }

  Future<Response> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );

      if (kDebugMode) {
        print("$data");
      }

      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        log("Response body===>${data.toString()}");
      }
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );

      if (kDebugMode) {
        log("$data");
      }
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        log("Response body===>${data.toString()}");
      }
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );
      if (kDebugMode) {
        log("$data");
      }
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
      );
      if (kDebugMode) {
        log("Response body===>${data.toString()}");
      }
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> uploadMultipartFiles(
      String uri, {
        required List<String> filePaths,
        required String fileKeyName,
        required Map<String, dynamic> fields,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
        CancelToken? cancelToken,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );
      List<MultipartFile> multipartFiles = [];

      for (var path in filePaths) {
        final file = await MultipartFile.fromFile(
          path,
          filename: path.split('/').last,
        );
        multipartFiles.add(file);
      }

      final formData = FormData.fromMap({
        fileKeyName: multipartFiles,
        ...fields, // e.g., title, price etc.
      });

      if (kDebugMode) {
        log("Uploading files: $filePaths");
        log("With fields: $fields");
      }

      final response = await dio!.post(
        uri,
        data: formData,
        cancelToken: cancelToken,
        options: mergedOptions,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Options buildRequestOptions({
    Map<String, dynamic>? additionalHeaders,
    Options? baseOptions,
  }) {
    token = Session.getToken();
    countryCode = "en";
    if (kDebugMode) {
      log("JWT token: $token");
    }
    Map<String, String> defaultHeaders = {
      AppConstants.contentType: 'application/json; charset=UTF-8',
      AppConstants.authorization: 'Bearer $token',
      AppConstants.accept: 'application/json',
      AppConstants.languageCode: countryCode!.toLowerCase(),
    };
    additionalHeaders?.forEach((k, v) {
      defaultHeaders[k] = v;
    });

    return baseOptions?.copyWith(headers: defaultHeaders) ??
        Options(headers: defaultHeaders);
  }

  void initDioClient(Dio? dioC, {Map<String, dynamic>? additionalHeaders}) {
    token = Session.getToken();
    countryCode = "en";

    if (kDebugMode) {
      log("JWT token: $token");
    }
    Map<String, String> headers = {
      AppConstants.contentType: 'application/json; charset=UTF-8',
      AppConstants.authorization: 'Bearer $token',
      AppConstants.accept: 'application/json',
      AppConstants.languageCode: countryCode!.toLowerCase(),
    };
    additionalHeaders?.forEach((k, v) {
      headers[k] = v;
    });

    dio = dioC ?? Dio();
    dio
      ?..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..httpClientAdapter
      ..options.headers = headers;
    if (kDebugMode) {
      dio!.interceptors.add(loggingInterceptor);
      dio!.interceptors.add(PrettyDioLogger());
    }

    /// ✅ Benefits of This Setup
    /// Only one refresh request is triggered.
    /// Other failed requests wait and are replayed once the token is refreshed.
    /// No race conditions or duplicate refreshes.
    /// You can still handle logout if refresh fails.
    dio!.interceptors.add(
      TokenInterceptor(
        dio: dio!,
        refreshToken: () async {
          try {
            final response = await Dio().post(
              '$baseUrl/refresh-token',
              data: {
                'refreshToken': Session.getRefreshToken(),
                'rememberMe': true,
              },
            );

            final newToken = response.data['data']['accessToken'];
            final newRefreshToken = response.data['data']['refreshToken'];

            if (newToken != null && newRefreshToken != null) {
              await Session.saveToken(newToken);
              await Session.saveRefreshToken(newRefreshToken);
              return true;
            }
          } catch (_) {}

          return false;
        },
      ),
    );
  }

  postData(String s, Map<String, String> map) {

  }
}

class Session {

}
