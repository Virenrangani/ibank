import '../user_entity/user_entity.dart';

abstract class LoginRepository {
  Future<UserEntity> logIn(String name, String password);
}