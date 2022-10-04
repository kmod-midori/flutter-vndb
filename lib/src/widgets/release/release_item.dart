import 'package:flt_vndb/src/api/release.dart';
import 'package:flt_vndb/src/widgets/language_row.dart';
import 'package:flt_vndb/src/widgets/platform_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReleaseItem extends StatelessWidget {
  final Release release;

  const ReleaseItem(this.release, {super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final listTileTheme = ListTileTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final subtitleTextTheme = textTheme.bodyText2
        ?.copyWith(color: listTileTheme.textColor ?? textTheme.caption?.color);

    final infoCol = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // if (release.patch ?? false) ...[
        //   const SizedBox(width: 8.0),
        //   Text(l10n.patch, style: textTheme.caption)
        // ],
        Text(
          release.getLocalizedTitle(context),
          style: Theme.of(context).textTheme.subtitle1,
          overflow: TextOverflow.ellipsis,
        ),
        if (release.released != null)
          Text(
            release.released!,
            style: subtitleTextTheme,
          ),
        if (release.platforms != null && release.platforms!.isNotEmpty) ...[
          const SizedBox(height: 4.0),
          PlatformRow(codes: release.platforms!)
        ],
        if (release.languages != null && release.languages!.isNotEmpty) ...[
          const SizedBox(height: 4.0),
          LanguageRow(codes: release.languages!)
        ],
      ],
    );

    Widget labelledIcon(IconData icon, String label) {
      return Tooltip(message: label, child: Icon(icon));
    }

    final icons = <Widget>[
      if (release.freeware ?? false)
        labelledIcon(MdiIcons.gift, "Freeware")
      else
        labelledIcon(MdiIcons.currencyUsd, "Non-free"),
      if (release.isDownload)
        labelledIcon(MdiIcons.download, "Internet download"),
      if (release.isDisc) labelledIcon(MdiIcons.disc, "Physical Disc"),
      if (release.isVoiced) labelledIcon(MdiIcons.microphone, "Voiced"),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(child: infoCol),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: icons,
          )
        ],
      ),
    );
  }
}
