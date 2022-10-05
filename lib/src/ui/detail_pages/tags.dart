import 'package:flt_vndb/src/data/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TagsPage extends HookWidget {
  final List<Tuple2<VndbTag, List<double>>> tags;

  const TagsPage(this.tags, {super.key});

  factory TagsPage.fromUnsorted(List<List<double>> tags) {
    final cp = List<List<double>>.from(tags);
    cp.sort((a, b) => (b[1]).compareTo(a[1]));

    final outTags = <Tuple2<VndbTag, List<double>>>[];
    for (final tag in cp) {
      final tagInfo = vndbTags[tag[0].toInt()];
      if (tagInfo != null) {
        outTags.add(Tuple2(tagInfo, tag));
      }
    }

    return TagsPage(outTags);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final spoilerLevelToText = <int, String>{
      0: l10n.spoilerLevelNone,
      1: l10n.spoilerLevelMinor,
      2: l10n.spoilerLevelMajor,
    };

    final spoilerLevel = useState<int>(0);

    final spoilerSelector = Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.spoilerLevel),
            const SizedBox(width: 8.0),
            ToggleButtons(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              isSelected: [
                spoilerLevel.value >= 0,
                spoilerLevel.value >= 1,
                spoilerLevel.value >= 2
              ],
              onPressed: (index) {
                spoilerLevel.value = index;
              },
              constraints: const BoxConstraints(
                minHeight: 30.0,
                minWidth: 80.0,
              ),
              children: [
                Text(spoilerLevelToText[0]!),
                Text(spoilerLevelToText[1]!),
                Text(spoilerLevelToText[2]!),
              ],
            )
          ],
        ));

    final shownTags =
        tags.where((tag) => tag.item2[2] <= spoilerLevel.value).toList();

    final gridView = SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final tag = shownTags[index];
          final spoilerLevelText = spoilerLevelToText[tag.item2[2].toInt()]!;
          final body = ListTile(
              title: Text(
                tag.item1.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text("${tag.item2[1]}/$spoilerLevelText"));

          return Card(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              body,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.info),
                    onPressed: () {},
                  ),
                  if (tag.item1.searchable)
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    )
                ],
              )
            ],
          ));
        },
        childCount: shownTags.length,
      ),
    );

    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: spoilerSelector),
      gridView,
    ]);
  }
}
