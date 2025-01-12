import 'package:shared_preferences/shared_preferences.dart';
import 'package:transfert/domain/entities/settings.dart';
import 'package:transfert/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SharedPreferences _prefs;
  
  SettingsRepositoryImpl(this._prefs);
  
  @override
  Future<Settings> getSettings() async {
    return Settings(
      isGoogleAuthEnabled: _prefs.getBool('google_auth_enabled') ?? false,
      language: _prefs.getString('language') ?? 'fr',
            isDarkMode: _prefs.getBool('is_dark_mode') ?? false,

    );
  }
  
  @override
  Future<void> toggleGoogleAuth(bool enabled) async {
    await _prefs.setBool('google_auth_enabled', enabled);
  }
  
  @override
  Future<void> changeLanguage(String language) async {
    await _prefs.setString('language', language);
  }
  
  @override
  Future<void> updateSettings(Settings settings) async {
    await _prefs.setBool('google_auth_enabled', settings.isGoogleAuthEnabled);
    await _prefs.setString('language', settings.language);
    
  }

  @override
  Future<void> toggleDarkMode(bool enabled) async {
    await _prefs.setBool('is_dark_mode', enabled);
  }
}