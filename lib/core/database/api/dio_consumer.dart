import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../errors/exceptions.dart';
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
        responseBody: kDebugMode,
        responseHeader: kDebugMode,
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
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    try {
      // debugPrint('🔍 Request URL: ${dio.options.baseUrl}$path');
      // debugPrint('🔍 Query Parameters: $queryParameters');

      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
      );

      // debugPrint('📥 Total Results: ${response.data['totalResults']}');
      // debugPrint('📥 Posts Count: ${response.data['posts']?.length ?? 0}');
      // debugPrint('📥 Requests Left: ${response.data['requestsLeft']}');
      // debugPrint(
      //   '📥 Response URL: ${dio.options.baseUrl}$path?${Uri(queryParameters: queryParameters).query}',
      // );
      // debugPrint(
      //   '📥 Response categories: ${response.data['posts']?[0]?['categories']}',
      // );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
