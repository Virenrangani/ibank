import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/validation/password_validation/password_validation.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());

  bool passwordTouched=false;
  bool confirmPasswordTouched=false;

  String? passwordError;

  void passwordValidation(String value) {
    passwordTouched=true;
    passwordError = validatePassword(value);
    emit(ChangePasswordValidation());
  }


  bool get isFormValid{
    return passwordTouched && passwordError == null;
  }
}
