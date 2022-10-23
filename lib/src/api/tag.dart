import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.g.dart';
part 'tag.freezed.dart';

/// `tags{id,rating,spoiler,lie,name,category}`
@freezed
class VisualNovelTag with _$VisualNovelTag {
  const factory VisualNovelTag({
    required String id,
    required double rating,
    required int spoiler,
    required bool lie,
    required String name,
    required String category,
    String? description,
    bool? searchable,
    bool? applicable,
  }) = _VisualNovelTag;

  factory VisualNovelTag.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelTagFromJson(json);
}
