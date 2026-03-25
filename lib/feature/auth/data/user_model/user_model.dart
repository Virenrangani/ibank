import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String token;
  final String refreshToken;

  UserModel({
    required this.name,
    required this.email,
    required this.token,
    required this.refreshToken
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['firstName'],
      email: json['email'],
      token: json['accessToken'],
      refreshToken: json['refreshToken']
    );
  }
}
