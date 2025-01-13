import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required String id,
    required String email,
    required String username,
    String? avatarUrl,
    required bool isPushEnabled,
    required bool isFaceIdEnabled,
    required bool hasPinCode,
  }) : super(
          id: id,
          email: email,
          username: username,
          avatarUrl: avatarUrl,
          isPushEnabled: isPushEnabled,
          isFaceIdEnabled: isFaceIdEnabled,
          hasPinCode: hasPinCode,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      avatarUrl: json['avatarUrl'],
      isPushEnabled: json['isPushEnabled'],
      isFaceIdEnabled: json['isFaceIdEnabled'],
      hasPinCode: json['hasPinCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'avatarUrl': avatarUrl,
      'isPushEnabled': isPushEnabled,
      'isFaceIdEnabled': isFaceIdEnabled,
      'hasPinCode': hasPinCode,
    };
  }
}