// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'http_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiQuery _$ApiQueryFromJson(Map<String, dynamic> json) {
  return _ApiQuery.fromJson(json);
}

/// @nodoc
mixin _$ApiQuery {
  /// Filter to apply to the query.
  @JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
  Filter get filters => throw _privateConstructorUsedError;

  /// Fields to return.
  List<String> get fields => throw _privateConstructorUsedError;

  /// Which field to sort by.
  String? get sort => throw _privateConstructorUsedError;

  /// Set to true to sort in descending order.
  bool get reverse => throw _privateConstructorUsedError;

  /// Number of results per page, max 100.
  int get results => throw _privateConstructorUsedError;

  /// Page number to request, starting from 1.
  int get page => throw _privateConstructorUsedError;

  /// Whether the response should include the count field (see below).
  /// This option should be avoided when the count is not needed since it has a
  /// considerable performance impact.
  bool get count => throw _privateConstructorUsedError;

  /// Return compact filter representation.
  @JsonKey(name: "compact_filters")
  bool get compactFilters => throw _privateConstructorUsedError;

  /// Return normalized filter representation.
  @JsonKey(name: "normalized_filters")
  bool get normalizedFilters => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiQueryCopyWith<ApiQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiQueryCopyWith<$Res> {
  factory $ApiQueryCopyWith(ApiQuery value, $Res Function(ApiQuery) then) =
      _$ApiQueryCopyWithImpl<$Res, ApiQuery>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
          Filter filters,
      List<String> fields,
      String? sort,
      bool reverse,
      int results,
      int page,
      bool count,
      @JsonKey(name: "compact_filters")
          bool compactFilters,
      @JsonKey(name: "normalized_filters")
          bool normalizedFilters});
}

/// @nodoc
class _$ApiQueryCopyWithImpl<$Res, $Val extends ApiQuery>
    implements $ApiQueryCopyWith<$Res> {
  _$ApiQueryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? fields = null,
    Object? sort = freezed,
    Object? reverse = null,
    Object? results = null,
    Object? page = null,
    Object? count = null,
    Object? compactFilters = null,
    Object? normalizedFilters = null,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filter,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      reverse: null == reverse
          ? _value.reverse
          : reverse // ignore: cast_nullable_to_non_nullable
              as bool,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as bool,
      compactFilters: null == compactFilters
          ? _value.compactFilters
          : compactFilters // ignore: cast_nullable_to_non_nullable
              as bool,
      normalizedFilters: null == normalizedFilters
          ? _value.normalizedFilters
          : normalizedFilters // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiQueryCopyWith<$Res> implements $ApiQueryCopyWith<$Res> {
  factory _$$_ApiQueryCopyWith(
          _$_ApiQuery value, $Res Function(_$_ApiQuery) then) =
      __$$_ApiQueryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
          Filter filters,
      List<String> fields,
      String? sort,
      bool reverse,
      int results,
      int page,
      bool count,
      @JsonKey(name: "compact_filters")
          bool compactFilters,
      @JsonKey(name: "normalized_filters")
          bool normalizedFilters});
}

/// @nodoc
class __$$_ApiQueryCopyWithImpl<$Res>
    extends _$ApiQueryCopyWithImpl<$Res, _$_ApiQuery>
    implements _$$_ApiQueryCopyWith<$Res> {
  __$$_ApiQueryCopyWithImpl(
      _$_ApiQuery _value, $Res Function(_$_ApiQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? fields = null,
    Object? sort = freezed,
    Object? reverse = null,
    Object? results = null,
    Object? page = null,
    Object? count = null,
    Object? compactFilters = null,
    Object? normalizedFilters = null,
  }) {
    return _then(_$_ApiQuery(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Filter,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as String?,
      reverse: null == reverse
          ? _value.reverse
          : reverse // ignore: cast_nullable_to_non_nullable
              as bool,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as bool,
      compactFilters: null == compactFilters
          ? _value.compactFilters
          : compactFilters // ignore: cast_nullable_to_non_nullable
              as bool,
      normalizedFilters: null == normalizedFilters
          ? _value.normalizedFilters
          : normalizedFilters // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiQuery implements _ApiQuery {
  const _$_ApiQuery(
      {@JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
          required this.filters,
      required final List<String> fields,
      this.sort,
      this.reverse = false,
      this.results = 20,
      this.page = 1,
      this.count = false,
      @JsonKey(name: "compact_filters")
          this.compactFilters = false,
      @JsonKey(name: "normalized_filters")
          this.normalizedFilters = false})
      : _fields = fields;

  factory _$_ApiQuery.fromJson(Map<String, dynamic> json) =>
      _$$_ApiQueryFromJson(json);

  /// Filter to apply to the query.
  @override
  @JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
  final Filter filters;

  /// Fields to return.
  final List<String> _fields;

  /// Fields to return.
  @override
  List<String> get fields {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  /// Which field to sort by.
  @override
  final String? sort;

  /// Set to true to sort in descending order.
  @override
  @JsonKey()
  final bool reverse;

  /// Number of results per page, max 100.
  @override
  @JsonKey()
  final int results;

  /// Page number to request, starting from 1.
  @override
  @JsonKey()
  final int page;

  /// Whether the response should include the count field (see below).
  /// This option should be avoided when the count is not needed since it has a
  /// considerable performance impact.
  @override
  @JsonKey()
  final bool count;

  /// Return compact filter representation.
  @override
  @JsonKey(name: "compact_filters")
  final bool compactFilters;

  /// Return normalized filter representation.
  @override
  @JsonKey(name: "normalized_filters")
  final bool normalizedFilters;

  @override
  String toString() {
    return 'ApiQuery(filters: $filters, fields: $fields, sort: $sort, reverse: $reverse, results: $results, page: $page, count: $count, compactFilters: $compactFilters, normalizedFilters: $normalizedFilters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiQuery &&
            (identical(other.filters, filters) || other.filters == filters) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.reverse, reverse) || other.reverse == reverse) &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.compactFilters, compactFilters) ||
                other.compactFilters == compactFilters) &&
            (identical(other.normalizedFilters, normalizedFilters) ||
                other.normalizedFilters == normalizedFilters));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      filters,
      const DeepCollectionEquality().hash(_fields),
      sort,
      reverse,
      results,
      page,
      count,
      compactFilters,
      normalizedFilters);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiQueryCopyWith<_$_ApiQuery> get copyWith =>
      __$$_ApiQueryCopyWithImpl<_$_ApiQuery>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiQueryToJson(
      this,
    );
  }
}

abstract class _ApiQuery implements ApiQuery {
  const factory _ApiQuery(
      {@JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
          required final Filter filters,
      required final List<String> fields,
      final String? sort,
      final bool reverse,
      final int results,
      final int page,
      final bool count,
      @JsonKey(name: "compact_filters")
          final bool compactFilters,
      @JsonKey(name: "normalized_filters")
          final bool normalizedFilters}) = _$_ApiQuery;

  factory _ApiQuery.fromJson(Map<String, dynamic> json) = _$_ApiQuery.fromJson;

  @override

  /// Filter to apply to the query.
  @JsonKey(fromJson: _filtersFromJson, toJson: _filtersToJson)
  Filter get filters;
  @override

  /// Fields to return.
  List<String> get fields;
  @override

  /// Which field to sort by.
  String? get sort;
  @override

  /// Set to true to sort in descending order.
  bool get reverse;
  @override

  /// Number of results per page, max 100.
  int get results;
  @override

  /// Page number to request, starting from 1.
  int get page;
  @override

  /// Whether the response should include the count field (see below).
  /// This option should be avoided when the count is not needed since it has a
  /// considerable performance impact.
  bool get count;
  @override

  /// Return compact filter representation.
  @JsonKey(name: "compact_filters")
  bool get compactFilters;
  @override

  /// Return normalized filter representation.
  @JsonKey(name: "normalized_filters")
  bool get normalizedFilters;
  @override
  @JsonKey(ignore: true)
  _$$_ApiQueryCopyWith<_$_ApiQuery> get copyWith =>
      throw _privateConstructorUsedError;
}
