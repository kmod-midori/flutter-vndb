import 'package:flt_vndb/src/api/vn.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  static const defaultListFields = <String>[
    "name",
    "original",
    VisualNovelImage.defaultFields,
    "vns{spoiler,role,id}",
  ];

  const factory Character({
    required String id,
    required String name,

    /// name in the original script.
    String? original,
    List<String>? aliases,
    String? description,
    VisualNovelImage? image,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}
