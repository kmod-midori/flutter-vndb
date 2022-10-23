// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Character _$$_CharacterFromJson(Map<String, dynamic> json) => _$_Character(
      id: json['id'] as String,
      name: json['name'] as String,
      original: json['original'] as String?,
      aliases:
          (json['aliases'] as List<dynamic>?)?.map((e) => e as String).toList(),
      description: json['description'] as String?,
      image: json['image'] == null
          ? null
          : VisualNovelImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CharacterToJson(_$_Character instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original': instance.original,
      'aliases': instance.aliases,
      'description': instance.description,
      'image': instance.image,
    };
