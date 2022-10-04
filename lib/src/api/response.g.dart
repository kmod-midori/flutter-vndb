// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetResponse _$GetResponseFromJson(Map<String, dynamic> json) => GetResponse(
      (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      json['num'] as int,
      json['more'] as bool,
    );

Map<String, dynamic> _$GetResponseToJson(GetResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'num': instance.num,
      'more': instance.more,
    };
