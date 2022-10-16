import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flt_vndb/src/settings/settings_controller.dart';
import 'package:flt_vndb/src/settings/settings_service.dart';

part 'release.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Release {
  /// vndbid.
  final String id;

  /// Release title (romaji)
  final String? title;

  /// Original/official title of the release.
  final String? alttitle;

  /// List of languages with associated metadata.
  final List<ReleaseLanguage>? languages;

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
    final availableLocales = languages?.where((t) => t.title != null).map((t) {
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
        final matchedTitle =
            languages![availableLocales.indexOf(titleLocale)].title;
        if (matchedTitle != null) {
          title = matchedTitle;
        } else {
          title = languages!.firstWhere((l) => l.main).title!;
        }
      }
    }

    return title;
  }

  /// Empty array when platform is unknown.
  final List<String>? platforms;

  final List<ReleaseMedia>? media;

  bool get isDownload => media?.any((e) => e.medium == 'in') ?? false;

  bool get isDisc =>
      media?.any((e) => e.medium == 'cd' || e.medium == 'dvd') ?? false;

  /// Release date
  final String? released;

  /// Age rating, 0 = all ages.
  final int? minage;

  final bool? patch;

  final bool? freeware;

  final bool? uncensored;

  final bool? official;

  final bool? hasEro;

  // TODO: resolution

  final String? engine;

  ///	Random notes, can contain formatting codes as described in d9#3
  final String? notes;

  // === details ===

  // /// Official website URL
  // final String? website;

  // /// JAN/UPC/EAN code. This is actually an integer, but formatted as a string to avoid an overflow on 32bit platforms.
  // final String? gtin;

  // /// Catalog number.
  // final String? catalog;

  // final String? resolution;

  // /// 1 = Not voiced, 2 = Only ero scenes voiced, 3 = Partially voiced, 4 = Fully voiced
  // final ReleaseVoiceStatus? voiced;
  // bool get isVoiced => voiced != null && voiced != ReleaseVoiceStatus.notVoiced;

  // /// The array has two integer members, the first one indicating the story animations, the second the ero scene animations. Both members can be null if unknown or not applicable.
  // ///
  // /// When not null, the number indicates the following: 1 = No animations, 2 = Simple animations, 3 = Some fully animated scenes, 4 = All scenes fully animated.
  // final List<int?>? animation;

  // === lang ===

  // === vn ===
  // TODO: vn

  // === producers ===
  // TODO: producers

  // === links ===
  // final List<ReleaseLink>? links;

  Release({
    required this.id,
    this.title,
    this.alttitle,
    this.languages,
    this.platforms,
    this.media,
    this.released,
    this.minage,
    this.patch,
    this.freeware,
    this.uncensored,
    this.official,
    this.hasEro,
    this.engine,
    this.notes,
  });

  factory Release.fromJson(Map<String, dynamic> json) =>
      _$ReleaseFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseToJson(this);
}

/// Use at least `languages{lang,title,main}`.
@JsonSerializable()
class ReleaseLanguage {
  /// language the release is available in
  final String lang;

  /// title in the original script
  ///
  /// Can be null, in which case the title for this language is the same as the “main” language.
  final String? title;

  /// romanized version of "title"
  final String? latin;

  /// whether this is a machine translation
  final bool? mtl;

  /// whether this title is used as main title for the release entry
  ///
  /// There is always exactly one object where "main" is true.
  final bool main;

  ReleaseLanguage({
    required this.lang,
    this.title,
    this.latin,
    this.mtl,
    required this.main,
  });

  factory ReleaseLanguage.fromJson(Map<String, dynamic> json) =>
      _$ReleaseLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseLanguageToJson(this);
}

@JsonSerializable()
class ReleaseLink {
  /// Multiple links with the same label may be present.
  final String label;

  final String url;

  ReleaseLink({
    required this.label,
    required this.url,
  });

  factory ReleaseLink.fromJson(Map<String, dynamic> json) =>
      _$ReleaseLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseLinkToJson(this);
}

@JsonEnum()
enum ReleaseVoiceStatus {
  /// Not voiced
  @JsonValue(1)
  notVoiced,

  /// Only ero scenes voiced
  @JsonValue(2)
  onlyEroScenesVoiced,

  /// Partially voiced
  @JsonValue(3)
  partiallyVoiced,

  /// Fully voiced
  @JsonValue(4)
  fullyVoiced,
}

@JsonSerializable()
class ReleaseMedia {
  final String medium;

  /// the quantity. null when it is not applicable for the medium.
  final int? qty;

  ReleaseMedia({
    required this.medium,
    this.qty,
  });

  factory ReleaseMedia.fromJson(Map<String, dynamic> json) =>
      _$ReleaseMediaFromJson(json);

  Map<String, dynamic> toJson() => _$ReleaseMediaToJson(this);
}
