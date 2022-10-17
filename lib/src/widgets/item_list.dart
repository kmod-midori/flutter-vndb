import 'dart:async';

import 'package:flt_vndb/src/utils/use_paging_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ItemListPage<T> {
  final List<T> items;
  final bool more;
  ItemListPage(this.items, this.more);
}

class ItemList<T> extends HookWidget {
  final FutureOr<ItemListPage<T>> Function(int page) pageFetcher;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  final bool separated;

  const ItemList({
    required this.pageFetcher,
    required this.itemBuilder,
    this.separated = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pagingController = usePagingController<int, T>(firstPageKey: 1);

    useEffect(() {
      callback(int pageKey) async {
        try {
          final items = await pageFetcher(pageKey);

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

    final delegate = PagedChildBuilderDelegate<T>(
      itemBuilder: itemBuilder,
    );

    final sortButton = TextButton.icon(
      label: const Text("Sort"),
      icon: const Icon(Icons.sort),
      onPressed: () {},
    );

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            children: [
              const Spacer(),
              Padding(padding: const EdgeInsets.all(8), child: sortButton),
            ],
          ),
        ),
        separated
            ? PagedSliverList.separated(
                pagingController: pagingController,
                builderDelegate: delegate,
                separatorBuilder: (context, index) =>
                    const Divider(height: 1.0),
              )
            : PagedSliverList(
                pagingController: pagingController,
                builderDelegate: delegate,
              )
      ],
    );
  }
}
