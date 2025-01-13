import 'package:transfert/data/datasources/profile_datasource.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<ProfileEntity> getProfile() async {
    return await dataSource.getProfile();
  }

  @override
  Future<bool> updatePreference(String key, bool value) async {
    return await dataSource.updatePreference(key, value);
  }

  @override
  Future<void> logout() async {
    await dataSource.logout();
  }
}