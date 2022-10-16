import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The SettingsController
/// uses the SettingsService to store and retrieve user settings.
class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService);

  // Make SettingsService a private variable so it is not used directly.
  final SettingsService _settingsService;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  late ApiConfig _apiConfig;
  ApiConfig get apiConfig => _apiConfig;

  late Locale? _locale;
  Locale? get locale => _locale;

  late TitleLanguage _titleLanguage;
  TitleLanguage get titleLanguage => _titleLanguage;

  static SettingsController of(BuildContext context) {
    return Provider.of<SettingsController>(context);
  }

  /// Load the user's settings from the SettingsService.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _apiConfig = await _settingsService.apiConfig();
    _locale = await _settingsService.locale();
    _titleLanguage = await _settingsService.titleLanguage();

    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode newThemeMode) async {
    if (newThemeMode == _themeMode) return;
    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateApiConfig(ApiConfig newApiConfig) async {
    if (newApiConfig == _apiConfig) {
      return;
    }
    _apiConfig = newApiConfig;
    // vndbApi.configure(newApiConfig);
    notifyListeners();
    await _settingsService.updateApiConfig(newApiConfig);
  }

  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == _locale) {
      return;
    }
    _locale = newLocale;
    notifyListeners();
    await _settingsService.updateLocale(newLocale);
  }

  Future<void> updateTitleLanguage(TitleLanguage newTitleLanguage) async {
    if (newTitleLanguage == _titleLanguage) {
      return;
    }
    _titleLanguage = newTitleLanguage;
    notifyListeners();
    await _settingsService.updateTitleLanguage(newTitleLanguage);
  }
}
