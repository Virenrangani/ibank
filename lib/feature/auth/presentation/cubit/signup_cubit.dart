import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/feature/auth/domain/usecase/signup_useCase.dart';
import 'auth_state.dart';
import 'package:ibank/core/validation/password_validation/password_validation.dart';
import 'package:ibank/core/validation/mobile_number_validation/mobile_number_validation.dart';


class SignupCubit extends Cubit<AuthState> {
  final SignupUseCase signupUseCase;
  SignupCubit(this.signupUseCase) : super(AuthInitial());

  bool nameTouched=false;
  bool mobileNumberTouched = false;
  bool passwordTouched = false;
  String? nameError;
  String? mobileError;
  String? passwordError;
  bool isChecked = false;

  void nameValidation(String value) {
    nameTouched=true;
    nameError = value.isEmpty ? 'Name is required' : null;
    emit(AuthFormValidation());
  }

  void mobileNumberValidation(String value) {
    mobileNumberTouched=true;
    mobileError = validateMobileNumber(value);
    emit(AuthFormValidation());
  }

  void passwordValidation(String value) {
    passwordTouched=true;
    passwordError = validatePassword(value);
    emit(AuthFormValidation());
  }

  void toggleCheckbox() {
    isChecked = !isChecked;
    emit(AuthFormValidation());
  }

  bool get isFormValid {
    return nameError == null &&
        mobileError == null &&
        passwordError == null &&
        isChecked && nameTouched && passwordTouched && mobileNumberTouched;
  }

  Future<void> signUp(String name, String email,String password)async{
    emit(AuthLoading());
    try{
      final user=await signupUseCase.signUpCall(email, name, password);
      emit(AuthSuccess(user));
    }catch(e){
      emit(AuthFailure(e.toString()));
    }
  }
}
