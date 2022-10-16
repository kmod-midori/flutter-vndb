import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/release.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/utils/use_paging_controller.dart';
import 'package:flt_vndb/src/widgets/release/release_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

/// Displays a list of visual novels.
class ReleaseList extends HookWidget {
  final ApiQuery query;

  final String? selectedId;

  final void Function(VisualNovel)? onItemClick;

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

  Future<ApiResponse<Release>> _fetchPage(int page) {
    return vndbHttpApi.queryReleases(query.copyWith(page: page));
  }

  @override
  Widget build(BuildContext context) {
    final pagingController = usePagingController<int, Release>(firstPageKey: 1);

    useEffect(() {
      callback(pageKey) async {
        try {
          final items = await _fetchPage(pageKey);

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

    final delegate = PagedChildBuilderDelegate<Release>(
      itemBuilder: (context, item, index) {
        return ReleaseItem(item);
      },
    );

    return PagedListView.separated(
      pagingController: pagingController,
      // TODO: restorationId
      builderDelegate: delegate,
      separatorBuilder: (context, index) => const Divider(height: 1.0),
    );
  }
}
