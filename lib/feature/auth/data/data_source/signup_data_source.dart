import 'package:dio/dio.dart';
import 'package:ibank/feature/auth/data/user_model/user_model.dart';

import '../../../../core/network/api_url/api_end_points.dart';
import '../../../../core/network/dio/api_dio.dart';

abstract class SignupDataSource {
  Future<UserModel> signUp(String name , String password);
}

class SignupDataSourceImpl extends SignupDataSource {
  @override
  Future<UserModel> signUp(String name, String password) async {
    try {
      final response = await ApiDio.dio.post(
        ApiEndPoints.authLogin,
        data: {
          'username': name,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw Exception('Signup failed: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }
  }
}