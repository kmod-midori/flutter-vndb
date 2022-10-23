import 'package:flt_vndb/src/api/filter.dart';
import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/data/languages.dart';
import 'package:flt_vndb/src/data/platforms.dart';
import 'package:flt_vndb/src/widgets/picker.dart';
import 'package:flt_vndb/src/widgets/release/release_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReleasesPage extends HookWidget {
  final String vnId;

  const ReleasesPage(this.vnId, {super.key});

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive(wantKeepAlive: true);

    final filterLanguages = useState<List<String>>([]);
    String languageLabel;
    if (filterLanguages.value.isEmpty) {
      languageLabel = 'All';
    } else if (filterLanguages.value.length == 1) {
      languageLabel = recognizedLanguages[filterLanguages.value.first]!;
    } else {
      languageLabel =
          '${recognizedLanguages[filterLanguages.value.first]} +${filterLanguages.value.length - 1}';
    }
    final languageButton = ElevatedButton(
      onPressed: () async {
        final newLanguages =
            await showLanguagePickerDialog(context, filterLanguages.value);
        if (newLanguages != null) {
          filterLanguages.value = List.from(newLanguages);
        }
      },
      child: Text("Languages: $languageLabel"),
    );

    final filterPlatforms = useState<List<String>>([]);
    String platformLabel;
    if (filterPlatforms.value.isEmpty) {
      platformLabel = 'All';
    } else if (filterPlatforms.value.length == 1) {
      platformLabel = recognizedPlatforms[filterPlatforms.value.first]!;
    } else {
      platformLabel =
          '${recognizedPlatforms[filterPlatforms.value.first]} +${filterPlatforms.value.length - 1}';
    }
    final platformButton = ElevatedButton(
      onPressed: () async {
        final newPlatforms =
            await showPlatformPickerDialog(context, filterPlatforms.value);
        if (newPlatforms != null) {
          filterPlatforms.value = List.from(newPlatforms);
        }
      },
      child: Text("Platforms: $platformLabel"),
    );

    var filters = <Filter>[
      NestedFilter(
        key: "vn",
        op: FilterOperator.eq,
        value: StringFilter(key: "id", op: FilterOperator.eq, value: vnId),
      ),
    ];

    if (filterLanguages.value.isNotEmpty) {
      filters.add(
        CompositeFilter(
          type: CompositeType.or,
          children: filterLanguages.value
              .map(
                (l) => StringFilter(
                  key: "lang",
                  op: FilterOperator.eq,
                  value: l,
                ),
              )
              .toList(),
        ),
      );
    }

    if (filterPlatforms.value.isNotEmpty) {
      filters.add(
        CompositeFilter(
          type: CompositeType.or,
          children: filterPlatforms.value
              .map(
                (p) => StringFilter(
                  key: "platform",
                  op: FilterOperator.eq,
                  value: p,
                ),
              )
              .toList(),
        ),
      );
    }

    return Column(
      children: [
        Material(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                languageButton,
                const SizedBox(width: 8.0),
                platformButton
              ],
            ),
          ),
        ),
        Expanded(
          child: ReleaseList(
            query: ApiQuery(
              filters: CompositeFilter(
                type: CompositeType.and,
                children: filters,
              ),
              fields: [],
            ),
            onItemClick: (item) {
              Navigator.of(context).restorablePushNamed("/release/${item.id}");
            },
            key: ValueKey(filters),
          ),
        )
      ],
    );
  }
}
