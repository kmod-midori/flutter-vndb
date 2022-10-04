import 'package:flt_vndb/src/api/api.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/sample_feature/visual_novel_details.dart';
import 'package:flt_vndb/src/utils/hooks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../settings/settings_view.dart';
import 'visual_novel_list.dart';

/// Displays a list of SampleItems.
class VisualNovelListView extends HookWidget {
  const VisualNovelListView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    var isMobileLayout = useIsMobileLayout();

    final selectedVn = useState<VisualNovel?>(null);

    useEffect(() {
      if (isMobileLayout) {
        selectedVn.value = null;
      }
      return null;
    }, [isMobileLayout]);

    final listBody = VisualNovelList(
      filter: '(platforms = "swi")',
      sort: VnSort.rating,
      reverse: true,
      onItemClick: (vn) {
        if (isMobileLayout) {
          Navigator.restorablePushNamed(
            context,
            VisualNovelDetailsView.routeName,
            arguments: {
              "vn": vn.toJson(),
            },
          );
        } else {
          selectedVn.value = vn;
        }
      },
      selectedId: selectedVn.value?.id,
    );

    final listScaffold = Scaffold(
      appBar: AppBar(
        title: Text(l10n.searchResults),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: listBody,
    );

    Widget body;
    if (isMobileLayout) {
      body = listScaffold;
    } else {
      final detailView = selectedVn.value == null
          ? Scaffold(body: Center(child: Text(l10n.emptyDetailsPage)))
          : VisualNovelDetailsView(
              selectedVn.value!,
              key: ValueKey(selectedVn.value!.id),
            );

      body = Row(
        children: <Widget>[
          Flexible(
              flex: 1, child: Material(elevation: 4.0, child: listScaffold)),
          Flexible(
            flex: 3,
            child: detailView,
          )
        ],
      );
    }

    return body;
  }
}
