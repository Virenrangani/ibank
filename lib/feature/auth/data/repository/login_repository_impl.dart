import 'package:ibank/feature/auth/data/data_source/login_data_source.dart';

import '../../domain/repository/login_repository.dart';
import '../../domain/user_entity/user_entity.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource datasource;
  LoginRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> logIn(String name, String password) async {
    final model=await datasource.logIn(name, password);
    return UserEntity(
        name: model.name,
        token: model.token,
        refreshToken: model.refreshToken,
    );
  }
}