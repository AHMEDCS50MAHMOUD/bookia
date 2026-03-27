import 'package:bookia/core/networking/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: ApiConstant.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      headers: {
        "Accept": "application/json",
        if (ApiConstant.token != null) "Authorization": "Bearer ${ApiConstant.token}",
      },
    ));

    dio?.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode));
  }

  static void setTokenAfterLogin(String token) {
    ApiConstant.token = token;
    dio?.options.headers["Authorization"] = "Bearer $token";
  }
}
