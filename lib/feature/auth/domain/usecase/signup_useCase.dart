import 'package:ibank/feature/auth/domain/repository/signup_repository.dart';
import '../user_entity/user_entity.dart';

class SignupUseCase {
  final SignupRepository signupRepository;
  SignupUseCase(this.signupRepository);

  Future<UserEntity> signUpCall(String email,String name,String password){
    return signupRepository.signUp(email, name, password);
  }
}