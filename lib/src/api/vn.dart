import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flt_vndb/src/settings/settings_controller.dart';
import 'package:flt_vndb/src/settings/settings_service.dart';

part 'vn.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class VisualNovel {
  /// vndbid.
  final String id;

  /// Main title as displayed on the site, typically romanized from the original script.
  final String? title;

  /// Alternative title, typically the same as title but in the original script.
  final String? alttitle;

  /// Full list of titles associated with the VN, always contains at least one title.
  final List<VisualNovelTitle>? titles;

  /// list of aliases
  final List<String>? aliases;

  /// language the VN has originally been written in.
  final String? olang;

  /// development status. 0 meaning ‘Finished’, 1 is ‘In development’ and 2 for ‘Cancelled’.
  final int? devstatus;

  /// Date of the first release.
  final String? released;

  /// list of languages this VN is available in. Does not include machine translations.
  final List<String>? languages;

  /// list of platforms for which this VN is available.
  final List<String>? platforms;

  final VisualNovelImage? image;

  String? get imageUrl => image?.url;

  /// Length of the game, 1-5.
  /// This field is only used as a fallback for when there are no length votes,
  /// so you’ll probably want to fetch length_minutes too.
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

  String getLocalizedTitle(BuildContext context) {
    assert(this.title != null);

    final settings = SettingsController.of(context);

    if (settings.titleLanguage == TitleLanguage.romaji) {
      return this.title!;
    } else if (settings.titleLanguage == TitleLanguage.original) {
      if (alttitle != null) {
        return alttitle!;
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

  // // === relations ===
  // final List<VisualNovelRelation>? relations;

  // // === tags ===
  // final List<List<double>>? tags;

  // // === stats ===

  /// Between 0 (unpopular) and 100 (most popular).
  final double? popularity;

  /// Bayesian rating, between 1 and 10, null if nobody voted.
  final double? rating;

  /// Number of votes.
  final int? votecount;

  // // === staff ===
  // final List<VisualNovelStaff>? staff;

  VisualNovel({
    required this.id,
    this.title,
    this.alttitle,
    this.titles,
    this.aliases,
    this.olang,
    this.devstatus,
    this.released,
    this.languages,
    this.platforms,
    this.image,
    this.length,
    this.lengthMinutes,
    this.lengthVotes,
    this.description,
    this.popularity,
    this.rating,
    this.votecount,
  });

  factory VisualNovel.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelToJson(this);
}

/// You must use `titles{lang,title,official,main}` if you are using this class.
@JsonSerializable()
class VisualNovelTitle {
  /// language of this title. Each language appears at most once in the titles list.
  final String lang;

  /// title in the original script
  final String title;

  /// romanized version of "title"
  final String? latin;

  /// whether this is an official title
  final bool official;

  /// whether this is the “main” title for the visual novel entry
  final bool main;

  VisualNovelTitle({
    required this.lang,
    required this.title,
    this.latin,
    required this.official,
    required this.main,
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

@JsonSerializable()
class VisualNovelImage {
  final String? id;

  final String? url;

  /// Number between 0 and 2 (inclusive), average image flagging vote for sexual content.
  final double? sexual;

  /// Number between 0 and 2 (inclusive), average image flagging vote for violence.
  final double? violence;

  /// number of image flagging votes.
  final int? votecount;

  VisualNovelImage({
    this.id,
    this.url,
    this.sexual,
    this.violence,
    this.votecount,
  });

  factory VisualNovelImage.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelImageFromJson(json);

  Map<String, dynamic> toJson() => _$VisualNovelImageToJson(this);
}
