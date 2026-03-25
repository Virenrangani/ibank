import 'package:ibank/core/constant/string/custom_string.dart';

String? validateOtp(String otp){

  if(otp.isEmpty) return AppStrings.otpRequired;

  if(otp.length<4) return AppStrings.otpMinChar;

  return null;

}