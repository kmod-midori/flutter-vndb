// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisualNovelTag _$$_VisualNovelTagFromJson(Map<String, dynamic> json) =>
    _$_VisualNovelTag(
      id: json['id'] as String,
      rating: (json['rating'] as num).toDouble(),
      spoiler: json['spoiler'] as int,
      lie: json['lie'] as bool,
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String?,
      searchable: json['searchable'] as bool?,
      applicable: json['applicable'] as bool?,
    );

Map<String, dynamic> _$$_VisualNovelTagToJson(_$_VisualNovelTag instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'spoiler': instance.spoiler,
      'lie': instance.lie,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'searchable': instance.searchable,
      'applicable': instance.applicable,
    };
