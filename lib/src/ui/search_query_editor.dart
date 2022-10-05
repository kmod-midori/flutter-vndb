import 'dart:convert';

import 'package:flt_vndb/src/settings/settings_view.dart';
import 'package:flt_vndb/src/ui/visual_novel_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchQueryEditor extends HookWidget {
  const SearchQueryEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return Center(
      child: Column(children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Search",
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.restorablePushNamed(
                  context,
                  VisualNovelListView.routeName,
                  arguments: {
                    "filter": "(title ~ ${json.encode(controller.text)})",
                  },
                );
              },
            ),
          ),
        ),
      ]),
    );
  }
}

class SearchQueryPage extends HookWidget {
  static const routeName = '/search';

  const SearchQueryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Query"),
        actions: [
          const SettingsIconButton(),
        ],
      ),
      body: SearchQueryEditor(),
    );
  }
}
