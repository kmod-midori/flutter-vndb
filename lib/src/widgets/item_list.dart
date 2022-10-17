import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tuple/tuple.dart';

import 'package:flt_vndb/src/utils/use_paging_controller.dart';

class ItemListPage<T> {
  final List<T> items;
  final bool more;
  ItemListPage(this.items, this.more);
}

enum SortOptionType {
  text("A-Z", "Z-A"),
  number("0-9", "9-0");

  final String ascendingText;
  final String descendingText;

  const SortOptionType(this.ascendingText, this.descendingText);
}

class SortOption {
  final String name;
  final String value;
  final SortOptionType type;

  SortOption(this.name, this.value, this.type);
}

class SortSetting {
  final String field;
  final bool reverse;

  const SortSetting(this.field, this.reverse);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SortSetting &&
        other.field == field &&
        other.reverse == reverse;
  }

  @override
  int get hashCode => field.hashCode ^ reverse.hashCode;
}

class ItemList<T> extends HookWidget {
  final FutureOr<ItemListPage<T>> Function(
    int page,
    SortSetting? sortSetting,
  ) pageFetcher;

  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  final List<SortOption> sortOptions;

  final SortSetting initialSortSetting;

  final bool separated;

  const ItemList({
    required this.pageFetcher,
    required this.itemBuilder,
    required this.initialSortSetting,
    this.sortOptions = const [],
    this.separated = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pagingController = usePagingController<int, T>(firstPageKey: 1);

    final sortSetting = useState<SortSetting>(initialSortSetting);

    useEffect(() {
      callback(int pageKey) async {
        try {
          final items = await pageFetcher(pageKey, sortSetting.value);

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

    useEffect(() {
      pagingController.refresh();
      return null;
    }, [sortSetting.value]);

    final delegate = PagedChildBuilderDelegate<T>(
      itemBuilder: itemBuilder,
    );

    final currentSortOption = sortOptions.firstWhereOrNull(
      (element) => element.value == sortSetting.value.field,
    );

    final sortButton = sortOptions.isNotEmpty
        ? TextButton.icon(
            label: Text(
              currentSortOption != null
                  ? "${currentSortOption.name} ${sortSetting.value.reverse ? currentSortOption.type.descendingText : currentSortOption.type.ascendingText}"
                  : "Sort",
            ),
            icon: const Icon(Icons.sort),
            onPressed: () async {
              final v = await _showSortDialog(context);
              if (v != null) {
                sortSetting.value = v;
              }
            },
          )
        : null;

    return CustomScrollView(
      slivers: [
        if (sortButton != null)
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

  Future<SortSetting?> _showSortDialog(BuildContext context) {
    return showDialog<SortSetting>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text("Sort by"),
        children: [
          for (final option in sortOptions) ...[
            SimpleDialogOption(
              child: Text("${option.name} ${option.type.ascendingText}"),
              onPressed: () =>
                  Navigator.pop(context, SortSetting(option.value, false)),
            ),
            SimpleDialogOption(
              child: Text("${option.name} ${option.type.descendingText}"),
              onPressed: () =>
                  Navigator.pop(context, SortSetting(option.value, true)),
            )
          ]
        ],
      ),
    );
  }
}
