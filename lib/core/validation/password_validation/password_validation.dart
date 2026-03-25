import '../../constant/string/custom_string.dart';

String? validatePassword(String password) {
  if (password.isEmpty) return AppStrings.passwordRequired;
  if (password.length < 8) return AppStrings.passwordMinChar;
  if(password.contains(" ")) return AppStrings.passwordNotContainsSpace;

  if (!RegExp(r'[A-Z]').hasMatch(password)) {
    return AppStrings.atLeastOneUpperCase;
  }

  if (!RegExp(r'[a-z]').hasMatch(password)) {
    return AppStrings.atLeastOneLowerCase;
  }

  if (!RegExp(r'[0-9]').hasMatch(password)) {
    return AppStrings.atLeastOneNumber;
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
    return AppStrings.atLeastOneSpecialChar;
  }

  return null;
}