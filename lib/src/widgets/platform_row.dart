import 'package:flt_vndb/src/data/platforms.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlatformIcon extends StatelessWidget {
  final String code;

  const PlatformIcon({
    required this.code,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = getPlatformIconPath(code);
    if (path != null) {
      return SizedBox(
          width: 16,
          height: 16,
          child: SvgPicture.asset(path, key: ValueKey(code)));
    } else {
      return Text(code);
    }
  }
}

class PlatformRow extends StatelessWidget {
  final List<String> codes;

  const PlatformRow({
    required this.codes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    for (var code in codes) {
      children.add(PlatformIcon(code: code));
    }

    return Wrap(
      spacing: 2.0,
      runSpacing: 4.0,
      children: children,
    );
  }
}
