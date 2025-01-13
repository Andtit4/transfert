import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile();
  Future<bool> updatePreference(String key, bool value);
  Future<void> logout();
}