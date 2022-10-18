// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      more: json['more'] as bool,
      count: json['count'] as int?,
      compactFilters: json['compact_filters'] as String?,
      normalizedFilters: json['normalized_filters'] as List<dynamic>?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'more': instance.more,
      'count': instance.count,
      'compact_filters': instance.compactFilters,
      'normalized_filters': instance.normalizedFilters,
    };

_$_ApiQuery _$$_ApiQueryFromJson(Map<String, dynamic> json) => _$_ApiQuery(
      filters: _filtersFromJson(json['filters'] as List),
      fields:
          (json['fields'] as List<dynamic>).map((e) => e as String).toList(),
      sort: json['sort'] as String?,
      reverse: json['reverse'] as bool? ?? false,
      results: json['results'] as int? ?? 20,
      page: json['page'] as int? ?? 1,
      count: json['count'] as bool? ?? false,
      compactFilters: json['compact_filters'] as bool? ?? false,
      normalizedFilters: json['normalized_filters'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ApiQueryToJson(_$_ApiQuery instance) =>
    <String, dynamic>{
      'filters': _filtersToJson(instance.filters),
      'fields': instance.fields,
      'sort': instance.sort,
      'reverse': instance.reverse,
      'results': instance.results,
      'page': instance.page,
      'count': instance.count,
      'compact_filters': instance.compactFilters,
      'normalized_filters': instance.normalizedFilters,
    };
