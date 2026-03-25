import 'package:ibank/feature/auth/domain/user_entity/user_entity.dart';

abstract class SignupRepository {
  Future<UserEntity> signUp(String name,String email,String password);
}