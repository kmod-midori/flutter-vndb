// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Release _$ReleaseFromJson(Map<String, dynamic> json) => Release(
      id: json['id'] as int,
      title: json['title'] as String?,
      original: json['original'] as String?,
      released: json['released'] as String?,
      patch: json['patch'] as bool?,
      freeware: json['freeware'] as bool?,
      official: json['official'] as bool?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      website: json['website'] as String?,
      notes: json['notes'] as String?,
      minage: json['minage'] as int?,
      gtin: json['gtin'] as String?,
      catalog: json['catalog'] as String?,
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => ReleaseMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolution: json['resolution'] as String?,
      voiced: $enumDecodeNullable(_$ReleaseVoiceStatusEnumMap, json['voiced']),
      animation:
          (json['animation'] as List<dynamic>?)?.map((e) => e as int?).toList(),
      lang: (json['lang'] as List<dynamic>?)
          ?.map((e) => ReleaseLanguage.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => ReleaseLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReleaseToJson(Release instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original': instance.original,
      'released': instance.released,
      'patch': instance.patch,
      'freeware': instance.freeware,
      'official': instance.official,
      'languages': instance.languages,
      'website': instance.website,
      'notes': instance.notes,
      'minage': instance.minage,
      'gtin': instance.gtin,
      'catalog': instance.catalog,
      'platforms': instance.platforms,
      'media': instance.media,
      'resolution': instance.resolution,
      'voiced': _$ReleaseVoiceStatusEnumMap[instance.voiced],
      'animation': instance.animation,
      'lang': instance.lang,
      'links': instance.links,
    };

const _$ReleaseVoiceStatusEnumMap = {
  ReleaseVoiceStatus.notVoiced: 1,
  ReleaseVoiceStatus.onlyEroScenesVoiced: 2,
  ReleaseVoiceStatus.partiallyVoiced: 3,
  ReleaseVoiceStatus.fullyVoiced: 4,
};

ReleaseLanguage _$ReleaseLanguageFromJson(Map<String, dynamic> json) =>
    ReleaseLanguage(
      lang: json['lang'] as String,
      title: json['title'] as String?,
      latin: json['latin'] as String?,
      mtl: json['mtl'] as bool,
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
