import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TagsPage extends HookWidget {
  final String vnId;

  const TagsPage(this.vnId, {super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    final l10n = AppLocalizations.of(context)!;

    final vnSnapshot = useFuture(
      useMemoized(
        () => vndbHttpApi.querySingleVisualNovel(vnId, [
          "tags{id,rating,spoiler,lie,name,category}",
        ]),
        [vnId],
      ),
    );

    final tags = vnSnapshot.data?.tags;

    if (tags == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

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
        tags.where((tag) => tag.spoiler <= spoilerLevel.value).toList();
    shownTags.sort((a, b) => b.rating.compareTo(a.rating));

    final gridView = SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final tag = shownTags[index];
          final spoilerLevelText = spoilerLevelToText[tag.spoiler]!;
          final body = ListTile(
            title: Text(
              tag.name,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              "${tag.rating.toStringAsFixed(1)}/$spoilerLevelText",
            ),
          );

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
                  // if (tag.item1.searchable)
                  //   IconButton(
                  //     icon: const Icon(Icons.search),
                  //     onPressed: () {},
                  //   )
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
