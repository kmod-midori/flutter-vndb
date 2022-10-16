import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flt_vndb/src/api/filter.dart';
import 'package:flt_vndb/src/api/release.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flt_vndb/src/api/vn.dart';
import 'package:logging/logging.dart';

part 'http_api.g.dart';

@JsonSerializable()
class ApiQuery {
  final List<dynamic> filters;

  final List<String> fields;

  final String? sort;

  /// Set to true to sort in descending order.
  final bool reverse;

  /// Number of results per page, max 100.
  final int results;

  /// Page number to request, starting from 1.
  final int page;

  /// Whether the response should include the count field (see below).
  /// This option should be avoided when the count is not needed since it has a
  /// considerable performance impact.
  final bool count;

  @JsonKey(name: "compact_filters")
  final bool compactFilters;

  @JsonKey(name: "normalized_filters")
  final bool normalizedFilters;

  ApiQuery({
    required this.filters,
    required this.fields,
    this.sort,
    this.reverse = false,
    this.results = 25,
    this.page = 1,
    this.count = false,
    this.compactFilters = false,
    this.normalizedFilters = false,
  });

  factory ApiQuery.fromJson(Map<String, dynamic> json) =>
      _$ApiQueryFromJson(json);

  Map<String, dynamic> toJson() => _$ApiQueryToJson(this);

  ApiQuery copyWith({
    List<dynamic>? filters,
    List<String>? fields,
    String? sort,
    bool? reverse,
    int? results,
    int? page,
    bool? count,
    bool? compactFilters,
    bool? normalizedFilters,
  }) {
    return ApiQuery(
      filters: filters ?? this.filters,
      fields: fields ?? this.fields,
      sort: sort ?? this.sort,
      reverse: reverse ?? this.reverse,
      results: results ?? this.results,
      page: page ?? this.page,
      count: count ?? this.count,
      compactFilters: compactFilters ?? this.compactFilters,
      normalizedFilters: normalizedFilters ?? this.normalizedFilters,
    );
  }
}

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final List<T> results;

  /// When true, repeating the query with an incremented page number will yield more results.
  final bool more;

  final int? count;

  @JsonKey(name: "compact_filters")
  final String? compactFilters;

  @JsonKey(name: "normalized_filters")
  final List<dynamic>? normalizedFilters;

  ApiResponse({
    required this.results,
    required this.more,
    this.count,
    this.compactFilters,
    this.normalizedFilters,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(
        json,
        (obj) => fromJsonT(obj as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T value) toJsonT,
  ) =>
      _$ApiResponseToJson(this, toJsonT);
}

class VndbHttpApi {
  static final log = Logger("VndbHttpApi");

  final Dio _dio;

  VndbHttpApi({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: 5000,
            receiveTimeout: 5000,
          ),
        ) {
    final adapter = _dio.httpClientAdapter as DefaultHttpClientAdapter;
    adapter.onHttpClientCreate = (HttpClient client) {
      client.findProxy = (uri) {
        //proxy all request to localhost:8888
        return 'PROXY 127.0.0.1:10809';
      };

      return client;
    };
  }

  Future<ApiResponse<T>> _query<T>(
    String path,
    ApiQuery query,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) async {
    final jsonQuery = query.toJson();

    jsonQuery["fields"] = jsonQuery["fields"].join(",");

    final response = await _dio.post(
      path,
      data: jsonQuery,
    );

    return ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT,
    );
  }

  Future<ApiResponse<VisualNovel>> queryVisualNovels(
    ApiQuery query,
  ) async {
    return _query(
      '/vn',
      query,
      (json) => VisualNovel.fromJson(json),
    );
  }

  Future<ApiResponse<Release>> queryReleases(
    ApiQuery query,
  ) async {
    return _query(
      '/release',
      query,
      (json) => Release.fromJson(json),
    );
  }

  Future<VisualNovel?> querySingleVisualNovel(
      String id, List<String> fields) async {
    final query = ApiQuery(
      filters: StringFilter("id", FilterOperator.eq, id).toFilterJson(),
      fields: fields,
    );

    final response = await queryVisualNovels(query);
    if (response.results.isEmpty) {
      return null;
    }

    final result = response.results.first;
    return result;
  }
}

final vndbHttpApi = VndbHttpApi(baseUrl: "https://api.vndb.org/kana");
