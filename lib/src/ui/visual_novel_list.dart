import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/utils/use_paging_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
    final pagingController =
        usePagingController<int, VisualNovel>(firstPageKey: 1);

    useEffect(() {
      callback(int pageKey) async {
        try {
          final items = await vndbHttpApi.queryVisualNovels(
            query.copyWith(page: pageKey),
          );

          if (items.more) {
            pagingController.appendPage(items.results, pageKey + 1);
          } else {
            pagingController.appendLastPage(items.results);
          }
        } catch (e) {
          try {
            pagingController.error = e;
          } catch (e) {
            // ignore
          }
        }
      }

      pagingController.addPageRequestListener(callback);
      return () {
        pagingController.removePageRequestListener(callback);
      };
    }, [pagingController]);

    final delegate = PagedChildBuilderDelegate<VisualNovel>(
      itemBuilder: (context, item, index) => VisualNovelItem(
        item,
        onTap: onItemClick != null
            ? () {
                onItemClick!.call(item);
              }
            : null,
        selected: selectedId == item.id,
        key: ValueKey(item.id),
      ),
    );

    return PagedListView(
      pagingController: pagingController,
      // Providing a restorationId allows the ListView to restore the
      // scroll position when a user leaves and returns to the app after it
      // has been killed while running in the background.
      restorationId: 'sampleItemListView',
      builderDelegate: delegate,
    );
  }
}
