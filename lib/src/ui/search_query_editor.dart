import 'package:flt_vndb/src/api/filter.dart';
import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/settings/settings_view.dart';
import 'package:flt_vndb/src/ui/visual_novel_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SearchQueryEditor extends HookWidget {
  const SearchQueryEditor({super.key});

  void _runQuery(BuildContext context, String search) {
    final query = ApiQuery(
      filters: StringFilter(
        key: "search",
        op: FilterOperator.eq,
        value: search,
      ),
      fields: [],
      sort: "rating",
      reverse: true,
    );

    Navigator.restorablePushNamed(
      context,
      VisualNovelListView.routeName,
      arguments: {
        "query": query.toJson(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchField = TextField(
      decoration: const InputDecoration(
        hintText: "Search",
        suffixIcon: Icon(Icons.search),
      ),
      onSubmitted: (value) {
        _runQuery(context, value);
      },
    );

    return Center(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: searchField,
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
    final tabs = <Widget>[
      const Tab(text: "Visual Novels"),
      // const Tab(text: "Releases"),
      // const Tab(text: "Producers"),
      // const Tab(text: "Staff"),
      // const Tab(text: "Characters"),
      // const Tab(text: "Tags"),
      // const Tab(text: "Traits"),
    ];
    final tabController = useTabController(initialLength: tabs.length);
    final tabBar = TabBar(
      tabs: tabs,
      controller: tabController,
      isScrollable: true,
    );
    final tabBarView = TabBarView(
      controller: tabController,
      children: <Widget>[
        // MainPage(vn, key: ValueKey("${id}_main")),
        // TagsPage(id, key: ValueKey("${id}_tags")),
        // ReleasesPage(id, key: ValueKey("${id}_releases")),
        // Center(child: Text(vnDetail?.staff?.toString() ?? "Loading...")),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Search Query"),
        actions: [
          const SettingsIconButton(),
        ],
        bottom: tabBar,
      ),
      body: SearchQueryEditor(),
    );
  }
}
