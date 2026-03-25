import 'package:get_it/get_it.dart';
import 'package:ibank/feature/auth/data/data_source/login_data_source.dart';
import 'package:ibank/feature/auth/data/data_source/signup_data_source.dart';
import 'package:ibank/feature/auth/data/repository/login_repository_impl.dart';
import 'package:ibank/feature/auth/data/repository/signup_repository_impl.dart';
import 'package:ibank/feature/auth/domain/repository/login_repository.dart';
import 'package:ibank/feature/auth/domain/repository/signup_repository.dart';
import 'package:ibank/feature/auth/domain/usecase/login_useCase.dart';
import 'package:ibank/feature/auth/domain/usecase/signup_useCase.dart';
import 'package:ibank/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:ibank/feature/auth/presentation/cubit/signup_cubit.dart';


class Injection {
  final GetIt sl = GetIt.instance;

   void configDependencies(){
    sl.registerLazySingleton<SignupDataSource>(()=>SignupDataSourceImpl());
    sl.registerLazySingleton<SignupRepository>(()=>SignupRepositoryImpl(sl()));
    sl.registerLazySingleton<SignupUseCase>(()=>SignupUseCase(sl()));
    sl.registerFactory(()=>SignupCubit(sl()));

    sl.registerLazySingleton<LoginDataSource>(()=>LoginDataSourceImpl());
    sl.registerLazySingleton<LoginRepository>(()=>LoginRepositoryImpl(sl()));
    sl.registerLazySingleton(()=>LoginUseCase(sl()));
    sl.registerFactory(()=>LoginCubit(sl()));
  }
}