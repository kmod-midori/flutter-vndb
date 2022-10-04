import 'package:flt_vndb/src/api/api.dart';
import 'package:flt_vndb/src/api/release.dart';
import 'package:flt_vndb/src/api/response.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/utils/use_paging_controller.dart';
import 'package:flt_vndb/src/widgets/release/release_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Displays a list of visual novels.
class ReleaseList extends HookWidget {
  final String filter;
  final ReleaseSort? sort;
  final bool? reverse;

  final int? selectedId;

  final void Function(VisualNovel)? onItemClick;

  const ReleaseList({
    required this.filter,
    this.sort,
    this.reverse,
    this.onItemClick,
    this.selectedId,
    super.key,
  });

  Future<ItemList<Release>> _fetchPage(int page) {
    return vndbApi.getRelease(
      [
        ReleaseFlag.basic,
        ReleaseFlag.details,
        ReleaseFlag.lang,
        ReleaseFlag.links,
      ],
      filter,
      page: page,
      results: 25,
      sort: sort,
      reverse: reverse,
    );
  }

  @override
  Widget build(BuildContext context) {
    final pagingController = usePagingController<int, Release>(firstPageKey: 1);

    useEffect(() {
      callback(pageKey) async {
        try {
          final items = await _fetchPage(pageKey);

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

    final delegate = PagedChildBuilderDelegate<Release>(
      itemBuilder: (context, item, index) {
        return ReleaseItem(item);
      },
    );

    return PagedListView.separated(
      pagingController: pagingController,
      restorationId: "release_list_${filter.hashCode}",
      builderDelegate: delegate,
      separatorBuilder: (context, index) => const Divider(height: 1.0),
    );
  }
}
