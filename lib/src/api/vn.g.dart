// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualNovelRelation _$VisualNovelRelationFromJson(Map<String, dynamic> json) =>
    VisualNovelRelation(
      id: json['id'] as int,
      relation: json['relation'] as String,
      title: json['title'] as String,
      original: json['original'] as String?,
      official: json['official'] as bool,
    );

Map<String, dynamic> _$VisualNovelRelationToJson(
        VisualNovelRelation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'relation': instance.relation,
      'title': instance.title,
      'original': instance.original,
      'official': instance.official,
    };

VisualNovelStaff _$VisualNovelStaffFromJson(Map<String, dynamic> json) =>
    VisualNovelStaff(
      sid: json['sid'] as int,
      aid: json['aid'] as int,
      name: json['name'] as String,
      original: json['original'] as String?,
      role: json['role'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$VisualNovelStaffToJson(VisualNovelStaff instance) =>
    <String, dynamic>{
      'sid': instance.sid,
      'aid': instance.aid,
      'name': instance.name,
      'original': instance.original,
      'role': instance.role,
      'note': instance.note,
    };

_$_VisualNovel _$$_VisualNovelFromJson(Map<String, dynamic> json) =>
    _$_VisualNovel(
      id: json['id'] as String,
      title: json['title'] as String?,
      alttitle: json['alttitle'] as String?,
      titles: (json['titles'] as List<dynamic>?)
          ?.map((e) => VisualNovelTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      aliases:
          (json['aliases'] as List<dynamic>?)?.map((e) => e as String).toList(),
      olang: json['olang'] as String?,
      devstatus: json['devstatus'] as int?,
      released: json['released'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] == null
          ? null
          : VisualNovelImage.fromJson(json['image'] as Map<String, dynamic>),
      length: json['length'] as int?,
      lengthMinutes: json['length_minutes'] as int?,
      lengthVotes: json['length_votes'] as int?,
      description: json['description'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      votecount: json['votecount'] as int?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => VisualNovelTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_VisualNovelToJson(_$_VisualNovel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'alttitle': instance.alttitle,
      'titles': instance.titles,
      'aliases': instance.aliases,
      'olang': instance.olang,
      'devstatus': instance.devstatus,
      'released': instance.released,
      'languages': instance.languages,
      'platforms': instance.platforms,
      'image': instance.image,
      'length': instance.length,
      'length_minutes': instance.lengthMinutes,
      'length_votes': instance.lengthVotes,
      'description': instance.description,
      'popularity': instance.popularity,
      'rating': instance.rating,
      'votecount': instance.votecount,
      'tags': instance.tags,
    };

_$_VisualNovelTitle _$$_VisualNovelTitleFromJson(Map<String, dynamic> json) =>
    _$_VisualNovelTitle(
      lang: json['lang'] as String,
      title: json['title'] as String,
      latin: json['latin'] as String?,
      official: json['official'] as bool,
      main: json['main'] as bool,
    );

Map<String, dynamic> _$$_VisualNovelTitleToJson(_$_VisualNovelTitle instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'title': instance.title,
      'latin': instance.latin,
      'official': instance.official,
      'main': instance.main,
    };

_$_VisualNovelImage _$$_VisualNovelImageFromJson(Map<String, dynamic> json) =>
    _$_VisualNovelImage(
      id: json['id'] as String?,
      url: json['url'] as String?,
      sexual: (json['sexual'] as num?)?.toDouble(),
      violence: (json['violence'] as num?)?.toDouble(),
      votecount: json['votecount'] as int?,
    );

Map<String, dynamic> _$$_VisualNovelImageToJson(_$_VisualNovelImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'sexual': instance.sexual,
      'violence': instance.violence,
      'votecount': instance.votecount,
    };

_$_VisualNovelTag _$$_VisualNovelTagFromJson(Map<String, dynamic> json) =>
    _$_VisualNovelTag(
      id: json['id'] as String,
      rating: (json['rating'] as num).toDouble(),
      spoiler: json['spoiler'] as int,
      lie: json['lie'] as bool,
      name: json['name'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_VisualNovelTagToJson(_$_VisualNovelTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'spoiler': instance.spoiler,
      'lie': instance.lie,
      'name': instance.name,
      'category': instance.category,
    };
