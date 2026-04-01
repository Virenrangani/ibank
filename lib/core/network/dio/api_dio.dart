import 'package:dio/dio.dart';
import 'package:ibank/core/network/api_url/api_base_url.dart';
import 'package:ibank/core/network/interceptor/app_interceptor.dart';

import 'package:dio/dio.dart';
import 'package:ibank/core/network/api_url/api_base_url.dart';
import 'package:ibank/core/network/interceptor/app_interceptor.dart';

class ApiDio {

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiBaseUrl.authLogin,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
    ),
  )..interceptors.add(AuthInterceptor());
}