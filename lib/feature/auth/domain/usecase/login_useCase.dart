import '../repository/login_repository.dart';
import '../user_entity/user_entity.dart';

class LoginUseCase {
  final LoginRepository repository;
  LoginUseCase(this.repository);

  Future<UserEntity> loginCall(String name, String password) {
    return repository.logIn(name, password);
  }
}