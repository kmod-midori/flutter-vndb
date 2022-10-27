import 'package:flt_vndb/src/api/character.dart';
import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/ui/list_item/character_item.dart';
import 'package:flt_vndb/src/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharacterList extends HookWidget {
  final ApiQuery query;

  final void Function(Character)? onItemClick;

  CharacterList({required ApiQuery query, this.onItemClick, super.key})
      : query = query.copyWith(fields: Character.defaultListFields);

  @override
  Widget build(BuildContext context) {
    return ItemList<Character>(
      pageFetcher: (pageKey, sortSetting) async {
        final items = await vndbHttpApi.queryCharacters(
          query.copyWith(
            page: pageKey,
            // We can not explicitly sort by role,but the API sorts by role by default.
            sort: sortSetting?.field == "role" ? null : sortSetting?.field,
            reverse: sortSetting?.reverse ?? query.reverse,
          ),
        );
        return ItemListPage(items.results, items.more);
      },
      itemBuilder: (context, item, index) => CharacterItem(
        item,
        onTap: onItemClick != null
            ? () {
                onItemClick?.call(item);
              }
            : null,
        key: ValueKey(item.id),
      ),
      initialSortSetting: const SortSetting("role", false),
      sortOptions: [
        SortOption("Name", "name", SortOptionType.text),
        SortOption("Role", "role", SortOptionType.text),
      ],
      separated: true,
    );
  }
}
