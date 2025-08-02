import 'dart:async';

import 'package:dio/dio.dart';

import '../../../local/session.dart';


class TokenInterceptor extends Interceptor {
  final Dio dio;
  final Future<bool> Function() refreshToken;

  bool _isRefreshing = false;
  final List<Function> _retryQueue = [];

  TokenInterceptor({
    required this.dio,
    required this.refreshToken,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = Session.getToken();
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;
    final options = err.requestOptions;

    if (statusCode == 401 && !_isRefreshing) {
      _isRefreshing = true;

      final success = await refreshToken();

      _isRefreshing = false;

      if (success) {
        // Replay queued requests
        for (var retry in _retryQueue) {
          retry();
        }
        _retryQueue.clear();

        try{
          final retryResponse = await _retryRequest(options);
          return handler.resolve(retryResponse);
        }catch(error){}

      } else {
        _retryQueue.clear();
        return handler.next(err);
      }
    } else if (statusCode == 401 && _isRefreshing) {
      final responseCompleter = Completer<Response>();

      _retryQueue.add(() async {
        try {
          final newResponse = await _retryRequest(options);
          responseCompleter.complete(newResponse);
        } catch (error) {
          responseCompleter.completeError(error);
        }
      });

      return handler.resolve(await responseCompleter.future);
    }

    return handler.next(err);
  }

  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    final token = await Session.getToken();

    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $token',
      },
    );

    return dio.request(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
