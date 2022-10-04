// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualNovel _$VisualNovelFromJson(Map<String, dynamic> json) => VisualNovel(
      id: json['id'] as int,
      title: json['title'] as String?,
      original: json['original'] as String?,
      released: json['released'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      platforms: (json['platforms'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      aliases: json['aliases'] as String?,
      length: json['length'] as int?,
      lengthMinutes: json['length_minutes'] as int?,
      lengthVotes: json['length_votes'] as int?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      imageWidth: json['image_width'] as int?,
      imageHeight: json['image_height'] as int?,
      titles: (json['titles'] as List<dynamic>?)
          ?.map((e) => VisualNovelTitle.fromJson(e as Map<String, dynamic>))
          .toList(),
      relations: (json['relations'] as List<dynamic>?)
          ?.map((e) => VisualNovelRelation.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
      popularity: (json['popularity'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      votecount: json['votecount'] as int?,
      staff: (json['staff'] as List<dynamic>?)
          ?.map((e) => VisualNovelStaff.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisualNovelToJson(VisualNovel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original': instance.original,
      'released': instance.released,
      'languages': instance.languages,
      'platforms': instance.platforms,
      'aliases': instance.aliases,
      'length': instance.length,
      'length_minutes': instance.lengthMinutes,
      'length_votes': instance.lengthVotes,
      'description': instance.description,
      'image': instance.image,
      'image_width': instance.imageWidth,
      'image_height': instance.imageHeight,
      'titles': instance.titles?.map((e) => e.toJson()).toList(),
      'relations': instance.relations?.map((e) => e.toJson()).toList(),
      'tags': instance.tags,
      'popularity': instance.popularity,
      'rating': instance.rating,
      'votecount': instance.votecount,
      'staff': instance.staff?.map((e) => e.toJson()).toList(),
    };

VisualNovelTitle _$VisualNovelTitleFromJson(Map<String, dynamic> json) =>
    VisualNovelTitle(
      lang: json['lang'] as String,
      title: json['title'] as String,
      latin: json['latin'] as String?,
      official: json['official'] as bool,
    );

Map<String, dynamic> _$VisualNovelTitleToJson(VisualNovelTitle instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'title': instance.title,
      'latin': instance.latin,
      'official': instance.official,
    };

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
