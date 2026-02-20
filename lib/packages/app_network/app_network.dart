import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:gulfownsalesview/core/build_config/build_config.dart';
import 'package:gulfownsalesview/core/constants/api_endpoints.dart';
import 'package:gulfownsalesview/domain/common/model/app_failure.dart';
import 'package:gulfownsalesview/domain/common/model/generic_types.dart';

class AppNetwork {
  // Base Dio options
  static BaseOptions get _baseOptions => BaseOptions(
    receiveDataWhenStatusError: true,
    baseUrl: BuildConfig.baseUrl,
    headers: {"Content-Type": "application/json"},
  );

  /// Generic GET request
  static FutureEither<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final dio = Dio(_baseOptions..headers.addAll(_getCustomHeaders(url)));

      // Logging interceptor
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );

      final res = await dio.get(url, queryParameters: queryParameters);
      return Right(res);
    } on DioException catch (e) {
      log(
        "${e.message} | URL: ${e.response?.realUri} | Status: ${e.response?.statusCode} | Error: ${e.error}",
      );
      return Left(
        AppFailure.server(
          e.message ?? "Server error",
          e.response?.statusCode ?? 500,
        ),
      );
    } catch (e) {
      log("$e");
      return Left(
        AppFailure.client(
          kDebugMode ? e.toString() : "Unexpected error occurred",
        ),
      );
    }
  }

  /// Generic POST request
  static FutureEither<Response<dynamic>> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Object? data,
  }) async {
    try {
      final dio = Dio(_baseOptions..headers.addAll(_getCustomHeaders(url)));

      // Logging interceptor
      dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          error: true,
        ),
      );

      final payload = body ?? data;

      final res = await dio.post(
        url,
        queryParameters: queryParameters,
        data: payload,
      );

      return Right(res);
    } on DioException catch (e) {
      log("POST URL: $url | Body: $body | Data: $data");
      log(
        "${e.message} | URL: ${e.response?.realUri} | Status: ${e.response?.statusCode} | Error: ${e.error}",
      );

      return Left(
        AppFailure.server(
          e.message ?? "Server error",
          e.response?.statusCode ?? 500,
        ),
      );
    } catch (e) {
      log("$e");
      return Left(
        AppFailure.client(
          kDebugMode ? e.toString() : "Unexpected error occurred",
        ),
      );
    }
  }

  /// Determines correct Authorization headers based on endpoint
  static Map<String, dynamic> _getCustomHeaders(String url) {
    final Map<String, dynamic> headers = {"Content-Type": "application/json"};

    if (url.contains(ApiEndpoints.appAuth)) {
      // No token needed for appAuth
    } else if (url.contains(ApiEndpoints.userAuth) ||
        url.contains(ApiEndpoints.userLocations)) {
      // userAuth & userLocations require appToken
      headers["Authorization"] = "Bearer ${BuildConfig.appToken}";
    } else {
      // All other endpoints require userToken
      headers["Authorization"] = "Bearer ${BuildConfig.userToken}";
    }

    return headers;
  }
}
