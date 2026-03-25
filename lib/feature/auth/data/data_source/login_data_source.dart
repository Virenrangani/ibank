import 'package:dio/dio.dart';
import '../../../../core/network/api_url/api_end_points.dart';
import '../../../../core/network/dio/api_dio.dart';
import '../user_model/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> logIn(String name , String password);
}

class LoginDataSourceImpl extends LoginDataSource {
  @override
  Future<UserModel> logIn(String name, String password) async {
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
        throw Exception('LogIn failed: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print(e.toString());
      throw Exception(e.message);
    }
  }
}