import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/ui/detail_pages/info.dart';
import 'package:flt_vndb/src/ui/detail_pages/releases.dart';
import 'package:flt_vndb/src/ui/detail_pages/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Displays detailed information about a SampleItem.
class VisualNovelDetailsView extends HookWidget {
  final String id;

  const VisualNovelDetailsView(this.id, {super.key});

  factory VisualNovelDetailsView.fromRouteSettings(RouteSettings settings) {
    final id = (settings.arguments as Map<String, dynamic>)["id"];
    return VisualNovelDetailsView(id, key: ValueKey(id));
  }

  static const routeName = '/vn';

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!;

    final tabController = useTabController(initialLength: 2);

    final vnDetailSnapshot = useFuture(
      useMemoized(
        () => vndbHttpApi.querySingleVisualNovel(id, [
          "title",
          "alttitle",
          "released",
          "titles{lang,title,latin,official,main}",
          "image.url",
          "aliases",
          "description",
          "length",
          "length_minutes",
          "length_votes"
        ]),
        [id],
      ),
      preserveState: false,
    );

    final vn = vnDetailSnapshot.data;

    if (vn == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: Colors.white,
      tabs: <Widget>[
        const Tab(icon: Icon(Icons.info)), // Info
        // const Tab(icon: Icon(Icons.tag)), // Tags
        const Tab(icon: Icon(Icons.discount)), // Releases
        // const Tab(icon: Icon(Icons.person)) // Staff
      ],
    );

    final tabBarView = TabBarView(
      controller: tabController,
      children: <Widget>[
        MainPage(vn),
        // vnDetail != null
        //     ? TagsPage.fromUnsorted(vnDetail.tags!)
        //     : const Center(child: CircularProgressIndicator()),
        ReleasesPage(vn, key: ValueKey(vn.id)),
        // Center(child: Text(vnDetail?.staff?.toString() ?? "Loading...")),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(vn.getLocalizedTitle(context)),
        bottom: tabBar,
      ),
      body: tabBarView,
    );
  }
}
