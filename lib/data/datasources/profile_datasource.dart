import '../models/profile_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future<bool> updatePreference(String key, bool value);
  Future<void> logout();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    // Simulation d'un appel API
    await Future.delayed(const Duration(seconds: 1));
    return ProfileModel(
      id: '1',
      email: 'mark.buck@cloud.com',
      username: 'Coffeestories',
      avatarUrl: 'https://example.com/avatar.jpg',
      isPushEnabled: true,
      isFaceIdEnabled: true,
      hasPinCode: true,
    );
  }

  @override
  Future<bool> updatePreference(String key, bool value) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  @override
  Future<void> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}