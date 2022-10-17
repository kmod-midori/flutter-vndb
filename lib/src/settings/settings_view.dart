import 'package:flt_vndb/src/data/locales.dart';
import 'package:flt_vndb/src/settings/api_settings_dialog.dart';
import 'package:flt_vndb/src/settings/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'settings_controller.dart';

class SettingsView extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final settingsController = SettingsController.of(context);

    final body = ListView(
      children: ListTile.divideTiles(context: context, tiles: <Widget>[
        // Localized Title
        ListTile(
          title: Text(l10n.titleLanguage),
          subtitle: Text(l10n.titleLanguageDescription),
          trailing: DropdownButton<TitleLanguage>(
            value: settingsController.titleLanguage,
            onChanged: (value) {
              if (value != null) {
                settingsController.updateTitleLanguage(value);
              }
            },
            items: [
              DropdownMenuItem(
                value: TitleLanguage.localized,
                child: Text(l10n.titleLanguageLocalized),
              ),
              DropdownMenuItem(
                value: TitleLanguage.romaji,
                child: Text(l10n.titleLanguageRomaji),
              ),
              DropdownMenuItem(
                value: TitleLanguage.original,
                child: Text(l10n.titleLanguageOriginal),
              )
            ],
          ),
        ),
        // Theme
        ListTile(
          title: Text(l10n.theme),
          trailing: DropdownButton<ThemeMode>(
            value: settingsController.themeMode,
            onChanged: (value) {
              if (value != null) {
                settingsController.updateThemeMode(value);
              }
            },
            items: [
              DropdownMenuItem(
                value: ThemeMode.system,
                child: Text(l10n.systemTheme),
              ),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text(l10n.lightTheme),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Text(l10n.darkTheme),
              )
            ],
          ),
        ),
        // API Address
        // ListTile(
        //   title: Text(l10n.apiAddress),
        //   subtitle: Text(l10n.apiAddressDescription),
        //   onTap: () async {
        //     final newApiConfig = await showDialog<ApiConfig>(
        //       context: context,
        //       builder: (context) => ApiSettingsDialog(
        //         initialValue: settingsController.apiConfig,
        //       ),
        //     );

        //     if (newApiConfig != null) {
        //       settingsController.updateApiConfig(newApiConfig);
        //     }
        //   },
        // ),
        // Language Override
        ListTile(
          title: Text(l10n.language),
          trailing: DropdownButton<Locale?>(
            value: settingsController.locale,
            onChanged: (value) {
              settingsController.updateLocale(value);
            },
            items: [
              DropdownMenuItem(value: null, child: Text(l10n.systemLanguage)),
              ...supportedLocales.map(
                (e) => DropdownMenuItem(value: e.item2, child: Text(e.item1)),
              )
            ],
          ),
        ),
      ]).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTitle),
      ),
      body: body,
    );
  }
}

class SettingsIconButton extends StatelessWidget {
  const SettingsIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.restorablePushNamed(context, SettingsView.routeName);
      },
    );
  }
}
