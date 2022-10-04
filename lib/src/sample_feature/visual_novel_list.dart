import 'package:flt_vndb/src/api/api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/utils/use_paging_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'visual_novel_item.dart';

/// Displays a list of visual novels.
class VisualNovelList extends HookWidget {
  final String filter;
  final VnSort? sort;
  final bool? reverse;

  final int? selectedId;

  final void Function(VisualNovel)? onItemClick;

  const VisualNovelList({
    required this.filter,
    this.sort,
    this.reverse,
    this.onItemClick,
    this.selectedId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pagingController =
        usePagingController<int, VisualNovel>(firstPageKey: 1);

    useEffect(() {
      callback(int pageKey) async {
        try {
          final items = await vndbApi.getVn([
            VnFlag.basic,
            VnFlag.details,
            VnFlag.titles,
            VnFlag.stats
          ], filter, page: pageKey, results: 25, sort: sort, reverse: reverse);

          if (items.more) {
            pagingController.appendPage(items.items, pageKey + 1);
          } else {
            pagingController.appendLastPage(items.items);
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
