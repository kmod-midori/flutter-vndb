import 'dart:convert';

import 'package:flt_vndb/src/api/api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/data/languages.dart';
import 'package:flt_vndb/src/data/platforms.dart';
import 'package:flt_vndb/src/widgets/picker.dart';
import 'package:flt_vndb/src/widgets/release/release_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReleasesPage extends HookWidget {
  final VisualNovel vn;

  const ReleasesPage(this.vn, {super.key});

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

    var filter = "(vn = ${vn.id} ";
    if (filterLanguages.value.length == 1) {
      filter += "and languages = ${json.encode(filterLanguages.value.first)} ";
    } else if (filterLanguages.value.length > 1) {
      filter += "and languages = ${json.encode(filterLanguages.value)} ";
    }
    if (filterPlatforms.value.length == 1) {
      filter += "and platforms = ${json.encode(filterPlatforms.value.first)} ";
    } else if (filterPlatforms.value.length > 1) {
      filter += "and platforms = ${json.encode(filterPlatforms.value)} ";
    }
    filter += ")";

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
            filter: filter,
            sort: ReleaseSort.released,
            key: ValueKey(filter),
          ),
        )
      ],
    );
  }
}
