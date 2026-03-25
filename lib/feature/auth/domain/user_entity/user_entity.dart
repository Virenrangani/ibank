class UserEntity {
  final String name;
  final String token;
  final String? refreshToken;

  UserEntity({
    required this.name,
    required this.token,
    this.refreshToken
  });
}