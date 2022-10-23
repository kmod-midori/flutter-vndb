// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
