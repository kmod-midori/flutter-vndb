import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/services.dart' show rootBundle;

part 'tags.g.dart';

final vndbTags = <int, VndbTag>{};

Future<void> loadTags() async {
  WidgetsFlutterBinding.ensureInitialized();
  final jsonText =
      await rootBundle.loadString('assets/data/vndb-tags-2022-10-02.json');

  final tags = (json.decode(jsonText) as List)
      .map((e) => VndbTag.fromJson(e as Map<String, dynamic>));

  for (final tag in tags) {
    vndbTags[tag.id] = tag;
  }
}

@JsonSerializable()
class VndbTag {
  final int id;

  final String name;

  /// Can include formatting codes as described in d9#3.
  final String description;

  /// (Possibly empty) list of alternative names.
  final List<String> aliases;

  /// Whether it's possible to filter VNs by this tag.
  final bool searchable;

  /// Whether this tag can be applied to VN entries.
  final bool applicable;

  /// List of parent tags (empty for root tags). The first element in this array points to the primary parent tag.
  final List<int> parents;

  /// Number of tagged VNs (including child tags)
  final int vns;

  VndbTag({
    required this.id,
    required this.name,
    required this.description,
    required this.aliases,
    required this.searchable,
    required this.applicable,
    required this.parents,
    required this.vns,
  });

  factory VndbTag.fromJson(Map<String, dynamic> json) =>
      _$VndbTagFromJson(json);
}
