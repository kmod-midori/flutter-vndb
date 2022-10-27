import 'package:flt_vndb/src/api/tag.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flt_vndb/src/settings/settings_controller.dart';
import 'package:flt_vndb/src/settings/settings_service.dart';

part 'vn.g.dart';
part 'vn.freezed.dart';

@freezed
class VisualNovel with _$VisualNovel {
  const factory VisualNovel({
    /// vndbid.
    required String id,

    /// Main title as displayed on the site, typically romanized from the original script.
    String? title,

    /// Main title as displayed on the site, typically romanized from the original script.
    String? alttitle,

    /// Full list of titles associated with the VN, always contains at least one title.
    List<VisualNovelTitle>? titles,

    /// list of aliases
    List<String>? aliases,

    /// language the VN has originally been written in.
    String? olang,

    /// development status. 0 meaning ‘Finished’, 1 is ‘In development’ and 2 for ‘Cancelled’.
    DevelopmentStatus? devstatus,

    /// Date of the first release.
    String? released,

    /// list of languages this VN is available in. Does not include machine translations.
    List<String>? languages,

    /// list of platforms for which this VN is available.
    List<String>? platforms,
    VisualNovelImage? image,

    /// Length of the game, 1-5.
    /// This field is only used as a fallback for when there are no length votes,
    /// so you’ll probably want to fetch length_minutes too.
    int? length,

    /// Average play time from length votes
    @JsonKey(name: 'length_minutes') int? lengthMinutes,

    /// Number of length votes
    @JsonKey(name: 'length_votes') int? lengthVotes,

    /// Description of the VN. Can include formatting codes as described in d9#3.
    String? description,

    /// Between 0 (unpopular) and 100 (most popular).
    double? popularity,

    /// Bayesian rating, between 1 and 10, null if nobody voted.
    double? rating,

    /// Number of votes.
    int? votecount,

    /// Tags associated with the VN.
    List<VisualNovelTag>? tags,
  }) = _VisualNovel;

  const VisualNovel._();

  String? get imageUrl => image?.url;

  String? get lengthText => lengthMinutes != null
      ? lengthMinutes! < 60
          ? '${lengthMinutes!.toString().padLeft(2, '0')}m'
          : '${(lengthMinutes! / 60).floor().toString().padLeft(2, '0')}h${(lengthMinutes! % 60).toString().padLeft(2, '0')}m'
      : null;

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

  // // // === relations ===
  // // final List<VisualNovelRelation>? relations;

  factory VisualNovel.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelFromJson(json);
}

/// You must use `titles{lang,title,official,main}` if you are using this class.
@freezed
class VisualNovelTitle with _$VisualNovelTitle {
  static const defaultFields = "titles{lang,title,official,main}";

  const factory VisualNovelTitle({
    /// language of this title. Each language appears at most once in the titles list.
    required String lang,

    /// title in the original script
    required String title,

    /// romanized version of "title"
    String? latin,

    /// whether this is an official title
    required bool official,

    /// whether this is the “main” title for the visual novel entry
    required bool main,
  }) = _VisualNovelTitle;

  factory VisualNovelTitle.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelTitleFromJson(json);
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

@freezed
class VisualNovelImage with _$VisualNovelImage {
  static const defaultFields = "image{url,sexual,violence}";

  const factory VisualNovelImage({
    String? id,
    String? url,

    /// Number between 0 and 2 (inclusive), average image flagging vote for sexual content.
    double? sexual,

    /// Number between 0 and 2 (inclusive), average image flagging vote for violence.
    double? violence,

    /// number of image flagging votes.
    int? votecount,

    /// Pixel dimensions of the image, array with two integer elements indicating the width and height.
    List<int>? dims,
  }) = _VisualNovelImage;

  const VisualNovelImage._();

  bool get isSuggestive => sexual != null && sexual! > 0.4;
  bool get isExplicit => sexual != null && sexual! > 1.3;
  bool get isViolent => violence != null && violence! > 0.4;
  bool get isBrutal => violence != null && violence! > 1.3;

  factory VisualNovelImage.fromJson(Map<String, dynamic> json) =>
      _$VisualNovelImageFromJson(json);
}

enum DevelopmentStatus {
  @JsonValue(0)
  finished,
  @JsonValue(1)
  inDevelopment,
  @JsonValue(2)
  cancelled,
}
