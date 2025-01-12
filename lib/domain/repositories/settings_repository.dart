import 'package:transfert/domain/entities/settings.dart';

abstract class SettingsRepository {
  Future<Settings> getSettings();
  Future<void> updateSettings(Settings settings);
  Future<void> toggleGoogleAuth(bool enabled);
  Future<void> changeLanguage(String language);
}