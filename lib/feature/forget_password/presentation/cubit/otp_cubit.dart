import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibank/core/validation/otp_validation/otp_validation.dart';
import 'forget_password_state.dart';

class OtpCubit extends Cubit<ForgetPasswordState>{
  OtpCubit():super(ForgetPasswordInitial());

  bool otpTouched=false;
  String? otpError;

  void otpVerification(String value){
    otpTouched=true;
    otpError=validateOtp(value);
    emit(ForgetFormValidation());
  }

  bool get isOtpValid{
    return otpError == null
        && otpTouched;
  }
}