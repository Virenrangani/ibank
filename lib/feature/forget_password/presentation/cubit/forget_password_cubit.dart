import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/core/validation/mobile_number_validation/mobile_number_validation.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());

  bool mobileTouched=false;
  String? mobileNumberError;

  void mobileNumberVerification(String value){
    mobileTouched=true;
    mobileNumberError=validateMobileNumber(value);
    emit(ForgetFormValidation());
  }

  bool get isFormValid {
    return mobileNumberError == null
        &&mobileTouched;
  }
}
