import 'package:cached_network_image/cached_network_image.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/widgets/language_row.dart';
import 'package:flt_vndb/src/widgets/platform_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VisualNovelItem extends StatelessWidget {
  final VisualNovel item;

  final void Function()? onTap;

  final bool selected;

  const VisualNovelItem(this.item,
      {this.onTap, this.selected = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listTileTheme = ListTileTheme.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final subtitleTextTheme = textTheme.bodyText2
        ?.copyWith(color: listTileTheme.textColor ?? textTheme.caption?.color);

    final l10n = AppLocalizations.of(context)!;

    Color tileColor;
    if (selected) {
      tileColor = listTileTheme.selectedColor ?? theme.colorScheme.primary;
    } else {
      tileColor = listTileTheme.tileColor ?? Colors.transparent;
    }

    Widget detailRow(String text) => Text(
          text,
          style: subtitleTextTheme,
          overflow: TextOverflow.ellipsis,
        );

    final rows = <Widget>[
      Text(
        item.getLocalizedTitle(context),
        style: Theme.of(context).textTheme.subtitle1,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
      detailRow(
        item.released ?? "Unknown",
      ),
      const SizedBox(height: 4.0),
      PlatformRow(codes: item.platforms!),
      const SizedBox(height: 4.0),
      LanguageRow(codes: item.languages!),
      const SizedBox(height: 4.0),
      if (item.popularity != null)
        detailRow("${l10n.popularity} ${item.popularity}"),
      if (item.rating != null && item.votecount != null)
        detailRow("${l10n.rating} ${item.rating} (${item.votecount})"),
    ];

    return InkWell(
      onTap: onTap,
      child: Container(
        color: tileColor,
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (item.image?.url != null)
              SizedBox(
                width: 90,
                child: VisualNovelThumbnail(
                  item.image!.url!,
                ),
              ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rows,
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class VisualNovelThumbnail extends StatelessWidget {
  final String url;

  final double? width;

  final double? height;

  const VisualNovelThumbnail(this.url, {this.width, this.height, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.contain,
      alignment: Alignment.topCenter,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
