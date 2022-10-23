import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/release.dart';
import 'package:flt_vndb/src/widgets/item_list.dart';
import 'package:flt_vndb/src/widgets/release/release_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Displays a list of visual novels.
class ReleaseList extends HookWidget {
  final ApiQuery query;

  final String? selectedId;

  final void Function(Release)? onItemClick;

  ReleaseList({
    required ApiQuery query,
    this.onItemClick,
    this.selectedId,
    super.key,
  }) : query = query.copyWith(fields: [
          "title",
          "languages{lang,title,latin,mtl,main}",
          "platforms",
          "media{medium,qty}",
          "released",
          "patch",
          "freeware",
          "official",
          "engine",
          "notes"
        ]);

  @override
  Widget build(BuildContext context) {
    return ItemList<Release>(
      pageFetcher: (pageKey, sortSetting) async {
        final items = await vndbHttpApi.queryReleases(
          query.copyWith(
            page: pageKey,
            sort: sortSetting?.field,
            reverse: sortSetting?.reverse ?? query.reverse,
          ),
        );
        return ItemListPage(items.results, items.more);
      },
      itemBuilder: (context, item, index) => ReleaseItem(
        item,
        onTap: onItemClick != null
            ? () {
                onItemClick?.call(item);
              }
            : null,
        selected: selectedId == item.id,
        key: ValueKey(item.id),
      ),
      initialSortSetting: const SortSetting("released", true),
      sortOptions: [
        SortOption(
          "Title",
          "title",
          SortOptionType.text,
        ),
        SortOption(
          "Release Date",
          "released",
          SortOptionType.number,
        ),
      ],
      separated: true,
    );
  }
}
