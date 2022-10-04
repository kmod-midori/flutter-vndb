import 'package:flt_vndb/src/data/languages.dart';
import 'package:flutter/cupertino.dart';

class LanguageIcon extends StatelessWidget {
  final String code;

  const LanguageIcon({
    required this.code,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final path = getLanguageIconPath(code);
    if (path != null) {
      return Image.asset(path, width: 13, height: 11);
    } else {
      return Text(code);
    }
  }
}

class LanguageRow extends StatelessWidget {
  final List<String> codes;

  const LanguageRow({
    required this.codes,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    for (var code in codes) {
      children.add(LanguageIcon(code: code));
    }

    return Wrap(
      spacing: 2.0,
      runSpacing: 4.0,
      children: children,
    );
  }
}
