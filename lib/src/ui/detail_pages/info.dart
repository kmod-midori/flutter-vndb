import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/ui/list_item/visual_novel_item.dart';
import 'package:flt_vndb/src/utils/bb_code_text.dart';
import 'package:flt_vndb/src/utils/hooks.dart';
import 'package:flt_vndb/src/widgets/language_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends HookWidget {
  final VisualNovel? vn;

  const MainPage(this.vn, {super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final isMobileLayout = useIsMobileLayout();

    if (this.vn == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final vn = this.vn!;

    final title = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              child: SelectableText(
                vn.getLocalizedTitle(context),
                style: Theme.of(context).textTheme.titleLarge,
                // maxLines: 3,
              ),
            ),
            const SizedBox(width: 16.0),
            if (vn.titles != null && vn.titles!.length > 1)
              // We have multiple titles, show a button to a dialog.
              IconButton(
                icon: const Icon(Icons.translate),
                tooltip: l10n.otherLanguages,
                onPressed: () {
                  showTitlesDialog(context, vn.titles!);
                },
              )
          ],
        ),
        if (vn.alttitle != null && vn.alttitle!.isNotEmpty)
          SelectableText(
            vn.alttitle!,
            style: Theme.of(context).textTheme.caption,
          ),
        Text(
          vn.id,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );

    final thumbnail =
        vn.imageUrl != null ? VisualNovelThumbnail(vn.image!) : null;

    final lengthToText = {
      1: l10n.lengthVeryShort,
      2: l10n.lengthShort,
      3: l10n.lengthMedium,
      4: l10n.lengthLong,
      5: l10n.lengthVeryLong,
    };

    String? lengthDescription;
    if (vn.length != null) {
      lengthDescription = lengthToText[vn.length!]!;
      if (vn.lengthText != null) {
        lengthDescription += " (${vn.lengthText}";
        if (vn.lengthVotes != null) {
          lengthDescription += " from ${vn.lengthVotes} votes";
        }
        lengthDescription += ")";
      }
    }

    final basicInfo = ExpansionPanelList.radio(
      initialOpenPanelValue: "basic",
      children: <ExpansionPanelRadio>[
        ExpansionPanelRadio(
          value: "basic",
          headerBuilder: (context, isExpanded) => ListTile(
            title: Text(l10n.basicInfo),
          ),
          body: Column(children: [
            if (vn.released != null)
              ListTile(
                title: Text(l10n.releaseDate),
                trailing: Text(vn.released!),
              ),
            if (vn.popularity != null)
              ListTile(
                title: Text(l10n.popularity),
                trailing: Text(vn.popularity.toString()),
              ),
            if (vn.rating != null && vn.votecount != null)
              ListTile(
                title: Text(l10n.rating),
                trailing: Text("${vn.rating} (${vn.votecount})"),
              ),
            if (lengthDescription != null)
              ListTile(
                title: Text(l10n.length),
                trailing: Text(lengthDescription),
              ),
          ]),
        ),
        if (vn.aliases != null && vn.aliases!.isNotEmpty)
          ExpansionPanelRadio(
            value: "aliases",
            headerBuilder: ((context, isExpanded) => ListTile(
                  title: Text(l10n.aliases),
                )),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: vn.aliases!
                  .map((t) => ListTile(title: SelectableText(t)))
                  .toList(),
            ),
          )
      ],
    );
    var children = <Widget>[];

    if (isMobileLayout) {
      if (thumbnail != null) {
        children.add(SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: thumbnail,
        ));
      }
      children.add(title);
      children.add(basicInfo);
    } else {
      final infoRow = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (thumbnail != null) ...[
            SizedBox(
              width: 240,
              child: thumbnail,
            ),
            const SizedBox(width: 16.0),
          ],
          Expanded(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: title,
              ),
              basicInfo
            ]),
          ),
        ],
      );
      children.add(infoRow);
    }

    if (vn.description != null) {
      children.add(
        UrlBBCodeText(
          data: vn.description!,
          selectable: true,
          defaultStyle: theme.textTheme.bodySmall,
        ),
      );
    }

    return ListView(
      children: children
          .map(
            (w) => Padding(padding: const EdgeInsets.all(8.0), child: w),
          )
          .toList(),
    );
  }
}

Future<void> showTitlesDialog(
    BuildContext context, List<VisualNovelTitle> titles) async {
  final l10n = AppLocalizations.of(context)!;
  final textTheme = Theme.of(context).textTheme;

  final children = <Widget>[];
  for (final title in titles) {
    children.add(Row(
      children: [
        LanguageIcon(code: title.lang),
        const SizedBox(width: 8.0),
        SelectableText(title.title, style: textTheme.subtitle1),
        if (!title.official) ...[
          const SizedBox(width: 8.0),
          Text(l10n.unofficial, style: textTheme.caption)
        ],
      ],
    ));
    if (title.latin != null) {
      children.add(SelectableText(title.latin!, style: textTheme.bodyMedium));
    }
    children.add(const Divider());
  }

  if (children.isNotEmpty) {
    children.removeLast();
  }

  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.titles),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
}
