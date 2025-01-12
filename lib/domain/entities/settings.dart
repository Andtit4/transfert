class Settings {
  final bool isGoogleAuthEnabled;
  final String language;
  final bool isDarkMode; // Ajout du mode sombre
  
  Settings({
    required this.isGoogleAuthEnabled,
    required this.language,
    required this.isDarkMode,
  });
}