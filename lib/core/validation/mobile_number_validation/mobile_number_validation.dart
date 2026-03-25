String? validateMobileNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter mobile number';
  }
  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    return 'Please enter valid 10 digit mobile number';
  }
  return null;
}