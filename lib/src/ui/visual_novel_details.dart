import 'package:flt_vndb/src/api/api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/ui/detail_pages/info.dart';
import 'package:flt_vndb/src/ui/detail_pages/releases.dart';
import 'package:flt_vndb/src/ui/detail_pages/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Displays detailed information about a SampleItem.
class VisualNovelDetailsView extends HookWidget {
  final VisualNovel vn;

  const VisualNovelDetailsView(this.vn, {super.key});

  factory VisualNovelDetailsView.fromRouteSettings(RouteSettings settings) {
    final vn = VisualNovel.fromJson(
      (settings.arguments as Map<String, dynamic>)["vn"],
    );
    return VisualNovelDetailsView(vn, key: ValueKey(vn.id));
  }

  static const routeName = '/vn';

  @override
  Widget build(BuildContext context) {
    // final l10n = AppLocalizations.of(context)!;

    final tabController = useTabController(initialLength: 4);

    final vnDetailSnapshot = useFuture(
      useMemoized(
        () => vndbApi.getVn(
          [VnFlag.relations, VnFlag.tags, VnFlag.staff],
          "(id = ${vn.id})",
        ).then((res) => res.items[0]),
        [vn.id],
      ),
      preserveState: false,
    );

    final vnDetail = vnDetailSnapshot.data;

    final tabBar = TabBar(
      controller: tabController,
      indicatorColor: Colors.white,
      tabs: <Widget>[
        const Tab(icon: Icon(Icons.info)), // Info
        const Tab(icon: Icon(Icons.tag)), // Tags
        const Tab(icon: Icon(Icons.discount)), // Releases
        const Tab(icon: Icon(Icons.person)) // Staff
      ],
    );

    final tabBarView = TabBarView(
      controller: tabController,
      children: <Widget>[
        MainPage(vn, null),
        vnDetail != null
            ? TagsPage.fromUnsorted(vnDetail.tags!)
            : const Center(child: CircularProgressIndicator()),
        ReleasesPage(vn, key: ValueKey(vn.id)),
        Center(child: Text(vnDetail?.staff?.toString() ?? "Loading...")),
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
