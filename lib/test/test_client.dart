import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_logging_interceptor/dio_logging_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:temu_interceptor/test/temu_interceptor.dart';

abstract class HttpClient {
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  });

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  });
}

class DioClient extends HttpClient {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";
  late Dio _dio;

  DioClient() {
    _dio = Dio();
    if (kDebugMode) {
      if (_dio.interceptors.isEmpty == true) {
        // _dio.interceptors.add(
        //   DioLoggingInterceptor(
        //     level: Level.body,
        //     compact: false,
        //   ),
        // );
        _dio.interceptors.add(TemuInterceptor());
      }
    }
  }

  Future<BaseOptions> _getOptions() async {
    return BaseOptions(
        baseUrl: _baseUrl,
        responseType: ResponseType.plain,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        validateStatus: (code) {
          if (code! >= 200 && code <= 400) {
            return true;
          } else {
            return false;
          }
        });
  }

  CancelToken cancelToken() {
    return CancelToken();
  }

  @override
  Future<Response> post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    _dio.options = await _getOptions();
    return _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onSendProgress);
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    _dio.options = await _getOptions();

    return _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
  }
}
