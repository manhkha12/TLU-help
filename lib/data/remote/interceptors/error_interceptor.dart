import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tlu_students/data/local/app_provider.dart';
import 'package:tlu_students/data/remote/exceptions/app_exception_state.dart';
import 'package:tlu_students/data/remote/exceptions/exceptions.dart';
import 'package:tlu_students/shared/widgets/simple_toastification.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'dart:io';


class ErrorInterceptor extends Interceptor {
  final AppProvider appProvider;
  final StreamController<CurrentAppExceptionState> _controller = StreamController.broadcast();

  StreamSubscription listenError(ValueChanged<CurrentAppExceptionState> onError) {
    return _controller.stream.listen((event) => onError(event));
  }

  ErrorInterceptor(this.appProvider);

  // @override
  // void onResponse(Response response, ResponseInterceptorHandler handler) {
  //   final _resp = response.data;
  //   if (_resp is Map && _resp['error'] != null) {
  //     return handler.reject(
  //       DioException(response: response, requestOptions: response.requestOptions),
  //       true,
  //     );
  //   }
  //   super.onResponse(response, handler);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        (err.type == DioExceptionType.unknown &&
            err.error != null &&
            err.error.toString().contains('SocketException'))) {
      _controller
          .add(CurrentAppExceptionState(state: AppExceptionState.noInternet));
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          error: NoInternetException(),
          type: DioExceptionType.unknown,
        ),
      );
    }

    if (err.response != null) {
      if (err.requestOptions.extra['ignore_error_check'] ?? false) {
        return handler.resolve(err.response!);
      }
      
      final response = err.response!;
      if (response.statusCode == 401) {
        if (err.requestOptions.path.contains('/auth/refresh')) {
          _logoutAndNotify();
          return handler.next(err);
        }

        if (appProvider.hasAccessToken && appProvider.refreshToken != null) {
          try {
            final dio = Dio(BaseOptions(baseUrl: err.requestOptions.baseUrl));
            final refreshResp = await dio.post(
              '/auth/refresh',
              options: Options(headers: {
                'Authorization': 'Bearer ${appProvider.refreshToken}',
                'device-type': Platform.isAndroid ? 'android' : 'ios',
              }),
            );

            if (refreshResp.statusCode == 200 || refreshResp.statusCode == 201) {
              final data = refreshResp.data['data'] ?? refreshResp.data;
              final String? newAccessToken = data['access_token'];
              final String? newRefreshToken = data['refresh_token'];

              if (newAccessToken != null) {
                await appProvider.setAccessToken(newAccessToken);
                if (newRefreshToken != null) {
                  await appProvider.setRefreshToken(newRefreshToken);
                }

                // Retry original request
                final opts = err.requestOptions;
                opts.headers['Authorization'] = 'Bearer $newAccessToken';
                
                final retryDio = Dio(BaseOptions(baseUrl: opts.baseUrl));
                retryDio.options.contentType = opts.contentType;
                final cloneReq = await retryDio.request(
                  opts.path,
                  options: Options(
                    method: opts.method,
                    headers: opts.headers,
                  ),
                  data: opts.data,
                  queryParameters: opts.queryParameters,
                );
                return handler.resolve(cloneReq);
              }
            }
          } catch (e) {
            // Fallthrough to logout
          }
        }
        
        _logoutAndNotify();
        return handler.next(err);
      }

      try {
        _handleErrorResponse(response);
      } catch (e) {
        // We throw ApiException here which might not be handled nicely if uncaught.
        // It's better to reject with a DioException containing the custom error.
        if (e is ApiException) {
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: e,
            response: response,
            type: DioExceptionType.badResponse,
          ));
        }
      }
    }
    return super.onError(err, handler);
  }

  void _logoutAndNotify() {
    appProvider.setAccessToken(null);
    appProvider.setRefreshToken(null);
    _controller.add(CurrentAppExceptionState(state: AppExceptionState.sessionExpired));
  }

  void _handleErrorResponse(Response<dynamic> response) {
    if (response.statusCode == 500) {
      throw InternalServerException();
    }
    if (response.statusCode == 401) {
      // Handled in onError
      return;
    }
    dynamic data = response.data;
    if (data is String) {
      data = jsonDecode(data) as Map;
    }
    final String? code = data['error_code'];
    final message = data['message'];
    if (code != null) {
      switch (code) {
        default:
          throw ApiException(message, code);
      }
    }
  }
}
