import 'package:flt_vndb/src/api/character.dart';
import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/ui/visual_novel_item.dart';
import 'package:flt_vndb/src/widgets/item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharacterList extends HookWidget {
  final ApiQuery query;

  CharacterList({required ApiQuery query, super.key})
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
      itemBuilder: (context, item, index) => InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.image != null)
                SizedBox(
                  width: 100,
                  child: VisualNovelThumbnail(item.image!),
                ),
              Expanded(
                child: ListTile(
                  title: Text(item.name),
                  subtitle: item.original != null ? Text(item.original!) : null,
                ),
              )
            ],
          ),
        ),
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
