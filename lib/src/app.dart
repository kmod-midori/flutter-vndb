import 'package:flt_vndb/src/data/locales.dart';
import 'package:flt_vndb/src/ui/release_details.dart';
import 'package:flt_vndb/src/ui/search_query_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'ui/visual_novel_details.dart';
import 'ui/visual_novel_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  static final log = Logger("App");

  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settingsController = context.read<SettingsController>();

    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: supportedLocales.map((e) => e.item2),
          locale: settingsController.locale,

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            log.info("onGenerateRoute: ${routeSettings.name}");

            switch (routeSettings.name) {
              case SettingsView.routeName:
                return MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                  settings: routeSettings,
                );
              case '/search/vn':
                if (routeSettings.arguments == null) {
                  continue fallback;
                }
                return MaterialPageRoute(
                  builder: (context) => VisualNovelListView.fromRouteSettings(
                    routeSettings,
                  ),
                  settings: routeSettings,
                );
              fallback:
              case null:
              case '/':
                return MaterialPageRoute(
                  builder: (context) => const SearchQueryPage(),
                  settings: routeSettings,
                );
            }

            final uri = Uri.parse(routeSettings.name!);
            if (uri.pathSegments.length == 2) {
              switch (uri.pathSegments[0]) {
                case 'vn':
                  final id = uri.pathSegments[1];
                  return MaterialPageRoute(
                    builder: (context) => VisualNovelDetailsView(
                      id,
                      showBackButton: true,
                      key: ValueKey(id),
                    ),
                    settings: routeSettings,
                  );
                case 'release':
                  final id = uri.pathSegments[1];
                  return MaterialPageRoute(
                    builder: (context) => ReleaseDetailsView(
                      id,
                      showBackButton: true,
                      key: ValueKey(id),
                    ),
                    settings: routeSettings,
                  );
              }
            }

            // If there's no matching route, return the home page.
            return MaterialPageRoute(
              settings: routeSettings,
              builder: (BuildContext context) {
                return const SearchQueryPage();
              },
            );
          },
        );
      },
    );
  }
}
