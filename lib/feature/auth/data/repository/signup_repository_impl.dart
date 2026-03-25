import 'package:ibank/feature/auth/data/data_source/signup_data_source.dart';
import 'package:ibank/feature/auth/domain/repository/signup_repository.dart';
import 'package:ibank/feature/auth/domain/user_entity/user_entity.dart';

class SignupRepositoryImpl extends SignupRepository{
  final SignupDataSource signupDataSource;
  SignupRepositoryImpl(this.signupDataSource);

  @override
  Future<UserEntity> signUp(String name, String email, String password)async {
    final user=await signupDataSource.signUp(name, password);
    return UserEntity(name: user.name, token: user.token,);
  }
}