import 'package:collection/collection.dart';
import 'package:flt_vndb/src/data/locales.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
class SettingsService {
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeMode = prefs.getInt('themeMode') ?? 0;
    return ThemeMode.values[themeMode];
  }

  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', theme.index);
  }

  Future<bool> localizedTitle() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('localizedTitle') ?? true;
  }

  Future<void> updateLocalizedTitle(bool localizedTitle) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('localizedTitle', localizedTitle);
  }

  Future<ApiConfig> apiConfig() async {
    final prefs = await SharedPreferences.getInstance();
    final address = prefs.getString('apiAddress') ?? "api.vndb.org";
    final port = prefs.getInt('apiPort') ?? 19535;
    final useTls = prefs.getBool('apiUseTls') ?? true;
    return ApiConfig(address: address, port: port, useTls: useTls);
  }

  Future<void> updateApiConfig(ApiConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiAddress', config.address);
    await prefs.setInt('apiPort', config.port);
    await prefs.setBool('apiUseTls', config.useTls);
  }

  Future<Locale?> locale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeText = prefs.getString('locale');
    if (localeText == null) {
      return null;
    }

    return supportedLocales
        .firstWhereOrNull((element) => element.item1 == localeText)
        ?.item2;
  }

  Future<void> updateLocale(Locale? locale) async {
    final localeText = supportedLocales
        .firstWhereOrNull((element) => element.item2 == locale)
        ?.item1;

    final prefs = await SharedPreferences.getInstance();

    if (localeText != null) {
      await prefs.setString('locale', localeText);
    } else {
      await prefs.remove('locale');
    }
  }
}

class ApiConfig {
  final String address;

  final int port;

  final bool useTls;

  const ApiConfig({
    required this.address,
    required this.port,
    required this.useTls,
  });

  @override
  String toString() =>
      'ApiConfig(address: $address, port: $port, useTls: $useTls)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiConfig &&
        other.address == address &&
        other.port == port &&
        other.useTls == useTls;
  }

  @override
  int get hashCode => address.hashCode ^ port.hashCode ^ useTls.hashCode;
}
