import 'package:flt_vndb/src/api/api.dart';
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

  late bool _localizedTitle;
  bool get localizedTitle => _localizedTitle;

  late ApiConfig _apiConfig;
  ApiConfig get apiConfig => _apiConfig;

  late Locale? _locale;
  Locale? get locale => _locale;

  static SettingsController of(BuildContext context) {
    return Provider.of<SettingsController>(context);
  }

  /// Load the user's settings from the SettingsService.
  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _localizedTitle = await _settingsService.localizedTitle();
    _apiConfig = await _settingsService.apiConfig();
    _locale = await _settingsService.locale();

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

  Future<void> updateLocalizedTitle(bool newLocalizedTitle) async {
    if (newLocalizedTitle == _localizedTitle) {
      return;
    }
    _localizedTitle = newLocalizedTitle;
    notifyListeners();
    await _settingsService.updateLocalizedTitle(newLocalizedTitle);
  }

  Future<void> updateApiConfig(ApiConfig newApiConfig) async {
    if (newApiConfig == _apiConfig) {
      return;
    }
    _apiConfig = newApiConfig;
    vndbApi.configure(newApiConfig);
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
}
