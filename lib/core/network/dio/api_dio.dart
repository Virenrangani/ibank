
import 'package:dio/dio.dart';
import 'package:ibank/core/network/api_url/api_base_url.dart';

class ApiDio {
  static Dio dio=Dio(
    BaseOptions(
      baseUrl: ApiBaseUrl.authLogin,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
}