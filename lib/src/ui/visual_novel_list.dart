import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'visual_novel_item.dart';

/// Displays a list of visual novels.
class VisualNovelList extends HookWidget {
  final ApiQuery query;

  final String? selectedId;

  final void Function(VisualNovel)? onItemClick;

  VisualNovelList({
    required ApiQuery query,
    this.onItemClick,
    this.selectedId,
    super.key,
  }) : query = query.copyWith(fields: [
          "title",
          "alttitle",
          "released",
          "titles{lang,title,latin,official,main}",
          "languages",
          "platforms",
          "image.url",
          "rating",
          "popularity",
          "votecount"
        ]);

  @override
  Widget build(BuildContext context) {
    return ItemList<VisualNovel>(
      pageFetcher: (pageKey, sortSetting) async {
        final items = await vndbHttpApi.queryVisualNovels(
          query.copyWith(
            page: pageKey,
            sort: sortSetting?.field,
            reverse: sortSetting?.reverse ?? query.reverse,
          ),
        );
        return ItemListPage(items.results, items.more);
      },
      itemBuilder: (context, item, index) => VisualNovelItem(
        item,
        onTap: onItemClick != null
            ? () {
                onItemClick?.call(item);
              }
            : null,
        selected: selectedId == item.id,
        key: ValueKey(item.id),
      ),
      initialSortSetting: const SortSetting("popularity", true),
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
        SortOption(
          "Popularity",
          "popularity",
          SortOptionType.number,
        ),
        SortOption(
          "Rating",
          "rating",
          SortOptionType.number,
        ),
        SortOption(
          "Vote Count",
          "votecount",
          SortOptionType.number,
        ),
      ],
    );
  }
}
