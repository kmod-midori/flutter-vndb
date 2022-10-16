// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
      id: json['id'] as String,
      title: json['title'] as String?,
      alttitle: json['alttitle'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => ReleaseLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => ReleaseMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      released: json['released'] as String?,
      minage: json['minage'] as int?,
      patch: json['patch'] as bool?,
      freeware: json['freeware'] as bool?,
      uncensored: json['uncensored'] as bool?,
      official: json['official'] as bool?,
      hasEro: json['has_ero'] as bool?,
      engine: json['engine'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'alttitle': instance.alttitle,
      'languages': instance.languages,
      'platforms': instance.platforms,
      'media': instance.media,
      'released': instance.released,
      'minage': instance.minage,
      'patch': instance.patch,
      'freeware': instance.freeware,
      'uncensored': instance.uncensored,
      'official': instance.official,
      'has_ero': instance.hasEro,
      'engine': instance.engine,
      'notes': instance.notes,
    };

ReleaseLanguage _$ReleaseLanguageFromJson(Map<String, dynamic> json) =>
    ReleaseLanguage(
      lang: json['lang'] as String,
      title: json['title'] as String?,
      latin: json['latin'] as String?,
      mtl: json['mtl'] as bool?,
      main: json['main'] as bool,
    );

Map<String, dynamic> _$ReleaseLanguageToJson(ReleaseLanguage instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'title': instance.title,
      'latin': instance.latin,
      'mtl': instance.mtl,
      'main': instance.main,
    };

ReleaseLink _$ReleaseLinkFromJson(Map<String, dynamic> json) => ReleaseLink(
      label: json['label'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ReleaseLinkToJson(ReleaseLink instance) =>
    <String, dynamic>{
      'label': instance.label,
      'url': instance.url,
    };

ReleaseMedia _$ReleaseMediaFromJson(Map<String, dynamic> json) => ReleaseMedia(
      medium: json['medium'] as String,
      qty: json['qty'] as int?,
    );

Map<String, dynamic> _$ReleaseMediaToJson(ReleaseMedia instance) =>
    <String, dynamic>{
      'medium': instance.medium,
      'qty': instance.qty,
    };
