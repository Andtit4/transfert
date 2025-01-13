class ProfileEntity {
  final String id;
  final String email;
  final String username;
  final String? avatarUrl;
  final bool isPushEnabled;
  final bool isFaceIdEnabled;
  final bool hasPinCode;

  ProfileEntity({
    required this.id,
    required this.email,
    required this.username,
    this.avatarUrl,
    required this.isPushEnabled,
    required this.isFaceIdEnabled,
    required this.hasPinCode,
  });
}