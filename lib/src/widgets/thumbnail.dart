import 'package:cached_network_image/cached_network_image.dart';
import 'package:flt_vndb/src/api/vn.dart';
import 'package:flt_vndb/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VisualNovelThumbnail extends HookWidget {
  final VisualNovelImage image;

  const VisualNovelThumbnail(
    this.image, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final settings = SettingsController.of(context);

    if ((image.isSuggestive || image.isViolent) && !settings.nsfw) {
      return const SizedBox(
        height: 100.0,
        child: Center(child: Icon(Icons.block)),
      );
    }
    return CachedNetworkImage(
      imageUrl: image.url!,
      fit: BoxFit.contain,
      alignment: Alignment.topCenter,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(value: downloadProgress.progress)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
