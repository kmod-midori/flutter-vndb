import 'package:flt_vndb/src/settings/settings_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flt_vndb/src/settings/settings_controller.dart';

part 'vn.g.dart';

@JsonSerializable(explicitToJson: true)
class VisualNovel {
  final int id;

  // === basic ===

  final String? title;

  /// Original/official title.
  final String? original;

  /// Date of the first release.
  final String? released;

  /// Can be an empty array when nothing has been released yet.
  final List<String>? languages;

  // /// Original language of the VN. Always contains a single language.
  // @JsonKey(name: 'orig_lang')
  // final List<String> origLanguages;

  /// Can be an empty array when unknown or nothing has been released yet.
  final List<String>? platforms;

  // === details ===

  /// Aliases, separated by newlines.
  final String? aliases;

  /// Length of the game, 1-5
  final int? length;

  /// Average play time from length votes
  @JsonKey(name: 'length_minutes')
  final int? lengthMinutes;

  String? get lengthText => lengthMinutes != null
      ? lengthMinutes! < 60
          ? '${lengthMinutes!.toString().padLeft(2, '0')}m'
          : '${(lengthMinutes! / 60).floor().toString().padLeft(2, '0')}h${(lengthMinutes! % 60).toString().padLeft(2, '0')}m'
      : null;

  /// Number of length votes
  @JsonKey(name: 'length_votes')
  final int? lengthVotes;

  /// Description of the VN. Can include formatting codes as described in d9#3.
  final String? description;

  /// HTTP link to the VN image.
  final String? image;

  /// Width of the image in pixels.
  @JsonKey(name: 'image_width')
  final int? imageWidth;

  /// Height of the image in pixels.
  @JsonKey(name: 'image_height')
  final int? imageHeight;

  // TODO: image_flagging

  // === titles ===
  final List<VisualNovelTitle>? titles;

  String getLocalizedTitle(BuildContext context) {
    assert(this.title != null);

    final settings = SettingsController.of(context);

    if (settings.titleLanguage == TitleLanguage.romaji) {
      return this.title!;
    } else if (settings.titleLanguage == TitleLanguage.original) {
      if (original != null) {
        return original!;
      } else {
        return this.title!;
      }
    }

    // if (!settings.localizedTitle) {
    //   return this.title!;
    // }

    final availableLocales = titles?.map((t) {
      final p = t.lang.indexOf('-');
      if (p == -1) {
        return Locale(t.lang);
      } else {
        return Locale(t.lang.substring(0, p), t.lang.substring(p + 1));
      }
    }).toList();

    var title = this.title!;

    if (availableLocales != null) {
      const undLocale = Locale('und');

      final titleLocale = basicLocaleListResolution([
        Localizations.localeOf(context),
      ], [
        undLocale,
        ...availableLocales
      ]);

      if (titleLocale != undLocale) {
        title = titles![availableLocales.indexOf(titleLocale)].title;
      }
    }

    return title;
  }

  // === relations ===
  final List<VisualNovelRelation>? relations;

  // === tags ===
  final List<List<double>>? tags;

  // === stats ===

  /// Between 0 (unpopular) and 100 (most popular).
  final double? popularity;

  /// Bayesian rating, between 1 and 10.
  final double? rating;

  /// Number of votes.
  final int? votecount;

  // === staff ===
  final List<VisualNovelStaff>? staff;

  VisualNovel({
    required this.id,
    this.title,
    this.original,
    this.released,
    this.languages,
    this.platforms,
    this.aliases,
    this.length,
    this.lengthMinutes,
    this.lengthVotes,
    this.description,
    this.image,
    this.imageWidth,
    this.imageHeight,
    this.titles,
    this.relations,
    this.tags,
    this.popularity,
    this.rating,
    this.votecount,
    this.staff,
  });

  factory VisualNovel.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelToJson(this);
}

@JsonSerializable()
class VisualNovelTitle {
  /// language of this title.
  final String lang;

  /// title in the original script
  final String title;

  /// romanized version of "title"
  final String? latin;

  /// whether this is an official title
  final bool official;

  VisualNovelTitle({
    required this.lang,
    required this.title,
    this.latin,
    required this.official,
  });

  factory VisualNovelTitle.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelTitleFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelTitleToJson(this);

  @override
  String toString() {
    return 'VisualNovelTitle(lang: $lang, title: $title, latin: $latin, official: $official)';
  }
}

@JsonSerializable()
class VisualNovelRelation {
  final int id;

  /// relation to the VN
  final String relation;

  /// (romaji) title
  final String title;

  /// original/official title
  final String? original;

  final bool official;

  VisualNovelRelation({
    required this.id,
    required this.relation,
    required this.title,
    this.original,
    required this.official,
  });

  factory VisualNovelRelation.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelRelationFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelRelationToJson(this);

  @override
  String toString() {
    return 'VisualNovelRelation(id: $id, relation: $relation, title: $title, original: $original, official: $official)';
  }
}

@JsonSerializable()
class VisualNovelStaff {
  /// Staff ID
  final int sid;

  /// Alias ID
  final int aid;

  final String name;

  /// original name
  final String? original;

  /// original/official title
  final String role;

  final String? note;

  VisualNovelStaff({
    required this.sid,
    required this.aid,
    required this.name,
    this.original,
    required this.role,
    this.note,
  });

  factory VisualNovelStaff.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelStaffFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelStaffToJson(this);

  @override
  String toString() {
    return 'VisualNovelStaff(sid: $sid, aid: $aid, name: $name, original: $original, role: $role, note: $note)';
  }
}
