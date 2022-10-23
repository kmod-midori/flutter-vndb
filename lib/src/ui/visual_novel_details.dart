import 'package:flt_vndb/src/api/http_api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/ui/detail_pages/character.dart';
import 'package:flt_vndb/src/ui/detail_pages/info.dart';
import 'package:flt_vndb/src/ui/detail_pages/releases.dart';
import 'package:flt_vndb/src/ui/detail_pages/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Displays detailed information about a SampleItem.
class VisualNovelDetailsView extends HookWidget {
  final String id;

  final bool showBackButton;

  const VisualNovelDetailsView(this.id,
      {required this.showBackButton, super.key});

  factory VisualNovelDetailsView.fromRouteSettings(RouteSettings settings) {
    final id = (settings.arguments as Map<String, dynamic>)["id"];
    return VisualNovelDetailsView(
      id,
      showBackButton: true,
      key: ValueKey(id),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 4);

    final vnSnapshot = useFuture(
      useMemoized(
        () => vndbHttpApi.querySingleVisualNovel(id, [
          "title",
          "alttitle",
          "released",
          VisualNovelTitle.defaultFields,
          VisualNovelImage.defaultFields,
          "aliases",
          "description",
          "length",
          "length_minutes",
          "length_votes",
          "popularity",
          "rating",
          "votecount",
        ]),
        [id],
      ),
    );

    final vn = vnSnapshot.data;

    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: Colors.white,
      tabs: <Widget>[
        const Tab(text: "Info"), // Info
        const Tab(text: "Tags"), // Tags
        const Tab(text: "Releases"), // Releases
        const Tab(text: "Characters"),
        // const Tab(icon: Icon(Icons.person)) // Staff
      ],
      isScrollable: true,
    );

    final tabBarView = TabBarView(
      controller: tabController,
      children: <Widget>[
        MainPage(vn),
        TagsPage(id),
        ReleasesPage(id),
        CharactersPage(id),
        // Center(child: Text(vnDetail?.staff?.toString() ?? "Loading...")),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: vn != null ? Text(vn.getLocalizedTitle(context)) : null,
        bottom: tabBar,
        automaticallyImplyLeading: showBackButton,
        actions: [
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: () {
              launchUrlString("https://vndb.org/$id");
            },
          )
        ],
      ),
      body: tabBarView,
    );
  }
}
