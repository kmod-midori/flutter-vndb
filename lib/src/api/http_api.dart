import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:flt_vndb/src/api/character.dart';
import 'package:flt_vndb/src/api/filter.dart';
import 'package:flt_vndb/src/api/release.dart';
import 'package:flt_vndb/src/api/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flt_vndb/src/api/vn.dart';
import 'package:logging/logging.dart';
import 'package:quiver/cache.dart';
import 'package:tuple/tuple.dart';

part 'http_api.g.dart';
part 'http_api.freezed.dart';

List<dynamic> _filtersToJson(Filter filter) => filter.toFilterJson();
Filter _filtersFromJson(List<dynamic> val) => parseFilter(val);

@freezed
class ApiQuery with _$ApiQuery {
  const factory ApiQuery({
    /// Filter to apply to the query.
    @JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
        required Filter filters,

    /// Fields to return.
    required List<String> fields,

    /// Which field to sort by.
    String? sort,

    /// Set to true to sort in descending order.
    @Default(false) bool reverse,

    /// Number of results per page, max 100.
    @Default(20) int results,

    /// Page number to request, starting from 1.
    @Default(1) int page,

    /// Whether the response should include the count field (see below).
    /// This option should be avoided when the count is not needed since it has a
    /// considerable performance impact.
    @Default(false) bool count,

    /// Return compact filter representation.
    @JsonKey(name: "compact_filters") @Default(false) bool compactFilters,

    /// Return normalized filter representation.
    @JsonKey(name: "normalized_filters") @Default(false) bool normalizedFilters,
  }) = _ApiQuery;

  factory ApiQuery.fromJson(Map<String, dynamic> json) =>
      _$ApiQueryFromJson(json);
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

  ApiResponse<R> cast<R>() => ApiResponse<R>(
        results: results.cast<R>(),
        more: more,
        count: count,
        compactFilters: compactFilters,
        normalizedFilters: normalizedFilters,
      );
}

class VndbHttpApi {
  static final log = Logger("VndbHttpApi");

  final Dio _dio;

  final cache = MapCache<Tuple2<String, ApiQuery>, ApiResponse<dynamic>>.lru(
    maximumSize: 20,
  );

  VndbHttpApi({required String baseUrl})
      : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
            connectTimeout: 5000,
            receiveTimeout: 5000,
          ),
        ) {
    if (_dio.httpClientAdapter is DefaultHttpClientAdapter) {
      final adapter = _dio.httpClientAdapter as DefaultHttpClientAdapter;

      adapter.onHttpClientCreate = (HttpClient client) {
        client.findProxy = (uri) {
          //proxy all request to localhost:8888
          return 'PROXY 127.0.0.1:10809';
        };

        return client;
      };
    }
  }

  Future<ApiResponse<T>> _query<T>(
    String path,
    ApiQuery query,
    T Function(Map<String, dynamic> json) fromJsonT,
  ) async {
    final cacheKey = Tuple2(path, query);
    final cachedResponse = await cache.get(cacheKey);
    if (cachedResponse != null) {
      return cachedResponse.cast<T>();
    }

    final jsonQuery = query.toJson();

    jsonQuery["fields"] = jsonQuery["fields"].join(",");

    final response = await _dio.post(
      path,
      data: jsonQuery,
    );

    final r = ApiResponse.fromJson(
      response.data as Map<String, dynamic>,
      fromJsonT,
    );

    await cache.set(cacheKey, r);

    return r;
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

  Future<ApiResponse<VisualNovelTag>> queryTags(
    ApiQuery query,
  ) async {
    return _query(
      '/tag',
      query,
      (json) => VisualNovelTag.fromJson(json),
    );
  }

  Future<ApiResponse<Character>> queryCharacters(
    ApiQuery query,
  ) async {
    return _query(
      '/character',
      query,
      (json) => Character.fromJson(json),
    );
  }

  Future<VisualNovel?> querySingleVisualNovel(
      String id, List<String> fields) async {
    final query = ApiQuery(
      filters: StringFilter(
        key: "id",
        op: FilterOperator.eq,
        value: id,
      ),
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
