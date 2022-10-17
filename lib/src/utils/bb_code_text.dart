import 'package:flutter/material.dart';
import 'package:flutter_bbcode/flutter_bbcode.dart';
import 'package:flutter_bbcode/tags/basic_tags.dart';
import 'package:flutter_bbcode/tags/tag_parser.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Customized `BBCodeText` widget that supports URL launching.
class UrlBBCodeText extends BBCodeText {
  UrlBBCodeText({
    required String data,
    bool selectable = false,
    TextStyle? defaultStyle,
    Key? key,
  }) : super(
          data: data,
          defaultStyle: defaultStyle,
          selectable: selectable,
          tagsParsers: <AbstractTag>{
            BoldTag(),
            StrikeThroughTag(),
            ItalicTag(),
            UrlTag(onTap: (url) {
              launchUrlString(url);
            }),
            ColorTag(),
            UnderlineTag(),
            QuoteTag(),
          },
          key: key,
        );
}
