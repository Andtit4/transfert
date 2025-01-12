import 'package:transfert/domain/entities/settings.dart';
import 'package:transfert/domain/repositories/settings_repository.dart';

class SettingsUseCases {
  final SettingsRepository repository;
  
  SettingsUseCases(this.repository);
  
  Future<Settings> getSettings() => repository.getSettings();
  Future<void> toggleGoogleAuth(bool enabled) => repository.toggleGoogleAuth(enabled);
  Future<void> changeLanguage(String language) => repository.changeLanguage(language);
}