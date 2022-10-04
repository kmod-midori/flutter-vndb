// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VndbTag _$VndbTagFromJson(Map<String, dynamic> json) => VndbTag(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      aliases:
          (json['aliases'] as List<dynamic>).map((e) => e as String).toList(),
      searchable: json['searchable'] as bool,
      applicable: json['applicable'] as bool,
      parents: (json['parents'] as List<dynamic>).map((e) => e as int).toList(),
      vns: json['vns'] as int,
    );

Map<String, dynamic> _$VndbTagToJson(VndbTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'aliases': instance.aliases,
      'searchable': instance.searchable,
      'applicable': instance.applicable,
      'parents': instance.parents,
      'vns': instance.vns,
    };
