import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/feature/auth/domain/usecase/login_useCase.dart';
import 'package:ibank/feature/auth/presentation/cubit/auth_state.dart';
import 'package:ibank/core/validation/password_validation/password_validation.dart';
import 'package:ibank/core/validation/mobile_number_validation/mobile_number_validation.dart';

class LoginCubit extends Cubit<AuthState> {
  final LoginUseCase useCase;
  LoginCubit(this.useCase):super(AuthInitial());

  bool mobileNumberTouched = false;
  bool passwordTouched = false;

  String? mobileNumberError;
  String? passwordError;


  void mobileNumberValidation(String value) {
    mobileNumberTouched=true;
    mobileNumberError = validateMobileNumber(value);
    emit(AuthFormValidation());
  }

  void passwordValidation(String value) {
    passwordTouched=true;
    passwordError = validatePassword(value);
    emit(AuthFormValidation());
  }

  bool get isFormValid {
    return mobileNumberError == null
        && passwordError == null
        && mobileNumberTouched
    && passwordTouched;
  }

  Future<void> logIn(String name,String password)async{
    emit(AuthLoading());
    try{
      final user=await useCase.loginCall(name, password);
      emit(AuthSuccess(user));
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }
}