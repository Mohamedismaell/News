import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_consumer.dart';
import 'api_interceptor.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;

    dio.interceptors.add(ApiInterceptor());

    dio.interceptors.add(
      LogInterceptor(
        request: kDebugMode,
        requestHeader: kDebugMode,
        requestBody: kDebugMode,
        // responseBody: kDebugMode,
        // responseHeader: kDebugMode,
        error: kDebugMode,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.delete(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.get(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );

    return response.data;
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.patch(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    final response = await dio.post(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
