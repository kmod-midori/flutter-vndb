import 'package:flt_vndb/src/api/filter.dart';
import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/ui/list/character_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CharactersPage extends HookWidget {
  final String vnId;
  const CharactersPage(this.vnId, {super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    var filters = NestedFilter(
      key: "vn",
      op: FilterOperator.eq,
      value: StringFilter(key: "id", op: FilterOperator.eq, value: vnId),
    );

    return CharacterList(query: ApiQuery(filters: filters, fields: []));
  }
}
