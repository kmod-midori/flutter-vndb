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
        ListTile(
          title: Text(l10n.localizedTitle),
          subtitle: Text(l10n.localizedTitleDescription),
          trailing: Switch(
            value: settingsController.localizedTitle,
            onChanged: settingsController.updateLocalizedTitle,
          ),
        ),
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
        ListTile(
          title: Text("API"),
          onTap: () async {
            final newApiConfig = await showDialog<ApiConfig>(
              context: context,
              builder: (context) => ApiSettingsDialog(
                initialValue: settingsController.apiConfig,
              ),
            );

            if (newApiConfig != null) {
              settingsController.updateApiConfig(newApiConfig);
            }
          },
        )
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