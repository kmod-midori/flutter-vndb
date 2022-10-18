// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompositeFilter {
  CompositeType get type => throw _privateConstructorUsedError;
  List<Filter> get children => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompositeFilterCopyWith<CompositeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompositeFilterCopyWith<$Res> {
  factory $CompositeFilterCopyWith(
          CompositeFilter value, $Res Function(CompositeFilter) then) =
      _$CompositeFilterCopyWithImpl<$Res, CompositeFilter>;
  @useResult
  $Res call({CompositeType type, List<Filter> children});
}

/// @nodoc
class _$CompositeFilterCopyWithImpl<$Res, $Val extends CompositeFilter>
    implements $CompositeFilterCopyWith<$Res> {
  _$CompositeFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CompositeType,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompositeFilterCopyWith<$Res>
    implements $CompositeFilterCopyWith<$Res> {
  factory _$$_CompositeFilterCopyWith(
          _$_CompositeFilter value, $Res Function(_$_CompositeFilter) then) =
      __$$_CompositeFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CompositeType type, List<Filter> children});
}

/// @nodoc
class __$$_CompositeFilterCopyWithImpl<$Res>
    extends _$CompositeFilterCopyWithImpl<$Res, _$_CompositeFilter>
    implements _$$_CompositeFilterCopyWith<$Res> {
  __$$_CompositeFilterCopyWithImpl(
      _$_CompositeFilter _value, $Res Function(_$_CompositeFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? children = null,
  }) {
    return _then(_$_CompositeFilter(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CompositeType,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Filter>,
    ));
  }
}

/// @nodoc

class _$_CompositeFilter extends _CompositeFilter with DiagnosticableTreeMixin {
  const _$_CompositeFilter(
      {required this.type, required final List<Filter> children})
      : _children = children,
        super._();

  @override
  final CompositeType type;
  final List<Filter> _children;
  @override
  List<Filter> get children {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CompositeFilter(type: $type, children: $children)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CompositeFilter'))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('children', children));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompositeFilter &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompositeFilterCopyWith<_$_CompositeFilter> get copyWith =>
      __$$_CompositeFilterCopyWithImpl<_$_CompositeFilter>(this, _$identity);
}

abstract class _CompositeFilter extends CompositeFilter {
  const factory _CompositeFilter(
      {required final CompositeType type,
      required final List<Filter> children}) = _$_CompositeFilter;
  const _CompositeFilter._() : super._();

  @override
  CompositeType get type;
  @override
  List<Filter> get children;
  @override
  @JsonKey(ignore: true)
  _$$_CompositeFilterCopyWith<_$_CompositeFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StringFilter {
  String get key => throw _privateConstructorUsedError;
  FilterOperator get op => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StringFilterCopyWith<StringFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StringFilterCopyWith<$Res> {
  factory $StringFilterCopyWith(
          StringFilter value, $Res Function(StringFilter) then) =
      _$StringFilterCopyWithImpl<$Res, StringFilter>;
  @useResult
  $Res call({String key, FilterOperator op, String value});
}

/// @nodoc
class _$StringFilterCopyWithImpl<$Res, $Val extends StringFilter>
    implements $StringFilterCopyWith<$Res> {
  _$StringFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StringFilterCopyWith<$Res>
    implements $StringFilterCopyWith<$Res> {
  factory _$$_StringFilterCopyWith(
          _$_StringFilter value, $Res Function(_$_StringFilter) then) =
      __$$_StringFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, FilterOperator op, String value});
}

/// @nodoc
class __$$_StringFilterCopyWithImpl<$Res>
    extends _$StringFilterCopyWithImpl<$Res, _$_StringFilter>
    implements _$$_StringFilterCopyWith<$Res> {
  __$$_StringFilterCopyWithImpl(
      _$_StringFilter _value, $Res Function(_$_StringFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = null,
  }) {
    return _then(_$_StringFilter(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StringFilter extends _StringFilter with DiagnosticableTreeMixin {
  const _$_StringFilter(
      {required this.key, required this.op, required this.value})
      : super._();

  @override
  final String key;
  @override
  final FilterOperator op;
  @override
  final String value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StringFilter(key: $key, op: $op, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StringFilter'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('op', op))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StringFilter &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, op, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StringFilterCopyWith<_$_StringFilter> get copyWith =>
      __$$_StringFilterCopyWithImpl<_$_StringFilter>(this, _$identity);
}

abstract class _StringFilter extends StringFilter {
  const factory _StringFilter(
      {required final String key,
      required final FilterOperator op,
      required final String value}) = _$_StringFilter;
  const _StringFilter._() : super._();

  @override
  String get key;
  @override
  FilterOperator get op;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_StringFilterCopyWith<_$_StringFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$IntFilter {
  String get key => throw _privateConstructorUsedError;
  FilterOperator get op => throw _privateConstructorUsedError;
  int? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IntFilterCopyWith<IntFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntFilterCopyWith<$Res> {
  factory $IntFilterCopyWith(IntFilter value, $Res Function(IntFilter) then) =
      _$IntFilterCopyWithImpl<$Res, IntFilter>;
  @useResult
  $Res call({String key, FilterOperator op, int? value});
}

/// @nodoc
class _$IntFilterCopyWithImpl<$Res, $Val extends IntFilter>
    implements $IntFilterCopyWith<$Res> {
  _$IntFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IntFilterCopyWith<$Res> implements $IntFilterCopyWith<$Res> {
  factory _$$_IntFilterCopyWith(
          _$_IntFilter value, $Res Function(_$_IntFilter) then) =
      __$$_IntFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, FilterOperator op, int? value});
}

/// @nodoc
class __$$_IntFilterCopyWithImpl<$Res>
    extends _$IntFilterCopyWithImpl<$Res, _$_IntFilter>
    implements _$$_IntFilterCopyWith<$Res> {
  __$$_IntFilterCopyWithImpl(
      _$_IntFilter _value, $Res Function(_$_IntFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = freezed,
  }) {
    return _then(_$_IntFilter(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_IntFilter extends _IntFilter with DiagnosticableTreeMixin {
  const _$_IntFilter({required this.key, required this.op, required this.value})
      : super._();

  @override
  final String key;
  @override
  final FilterOperator op;
  @override
  final int? value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'IntFilter(key: $key, op: $op, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'IntFilter'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('op', op))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IntFilter &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, op, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IntFilterCopyWith<_$_IntFilter> get copyWith =>
      __$$_IntFilterCopyWithImpl<_$_IntFilter>(this, _$identity);
}

abstract class _IntFilter extends IntFilter {
  const factory _IntFilter(
      {required final String key,
      required final FilterOperator op,
      required final int? value}) = _$_IntFilter;
  const _IntFilter._() : super._();

  @override
  String get key;
  @override
  FilterOperator get op;
  @override
  int? get value;
  @override
  @JsonKey(ignore: true)
  _$$_IntFilterCopyWith<_$_IntFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DoubleFilter {
  String get key => throw _privateConstructorUsedError;
  FilterOperator get op => throw _privateConstructorUsedError;
  double? get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DoubleFilterCopyWith<DoubleFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoubleFilterCopyWith<$Res> {
  factory $DoubleFilterCopyWith(
          DoubleFilter value, $Res Function(DoubleFilter) then) =
      _$DoubleFilterCopyWithImpl<$Res, DoubleFilter>;
  @useResult
  $Res call({String key, FilterOperator op, double? value});
}

/// @nodoc
class _$DoubleFilterCopyWithImpl<$Res, $Val extends DoubleFilter>
    implements $DoubleFilterCopyWith<$Res> {
  _$DoubleFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoubleFilterCopyWith<$Res>
    implements $DoubleFilterCopyWith<$Res> {
  factory _$$_DoubleFilterCopyWith(
          _$_DoubleFilter value, $Res Function(_$_DoubleFilter) then) =
      __$$_DoubleFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, FilterOperator op, double? value});
}

/// @nodoc
class __$$_DoubleFilterCopyWithImpl<$Res>
    extends _$DoubleFilterCopyWithImpl<$Res, _$_DoubleFilter>
    implements _$$_DoubleFilterCopyWith<$Res> {
  __$$_DoubleFilterCopyWithImpl(
      _$_DoubleFilter _value, $Res Function(_$_DoubleFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = freezed,
  }) {
    return _then(_$_DoubleFilter(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$_DoubleFilter extends _DoubleFilter with DiagnosticableTreeMixin {
  const _$_DoubleFilter(
      {required this.key, required this.op, required this.value})
      : super._();

  @override
  final String key;
  @override
  final FilterOperator op;
  @override
  final double? value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DoubleFilter(key: $key, op: $op, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DoubleFilter'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('op', op))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoubleFilter &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, op, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoubleFilterCopyWith<_$_DoubleFilter> get copyWith =>
      __$$_DoubleFilterCopyWithImpl<_$_DoubleFilter>(this, _$identity);
}

abstract class _DoubleFilter extends DoubleFilter {
  const factory _DoubleFilter(
      {required final String key,
      required final FilterOperator op,
      required final double? value}) = _$_DoubleFilter;
  const _DoubleFilter._() : super._();

  @override
  String get key;
  @override
  FilterOperator get op;
  @override
  double? get value;
  @override
  @JsonKey(ignore: true)
  _$$_DoubleFilterCopyWith<_$_DoubleFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NestedFilter {
  String get key => throw _privateConstructorUsedError;
  FilterOperator get op => throw _privateConstructorUsedError;
  Filter get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NestedFilterCopyWith<NestedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NestedFilterCopyWith<$Res> {
  factory $NestedFilterCopyWith(
          NestedFilter value, $Res Function(NestedFilter) then) =
      _$NestedFilterCopyWithImpl<$Res, NestedFilter>;
  @useResult
  $Res call({String key, FilterOperator op, Filter value});
}

/// @nodoc
class _$NestedFilterCopyWithImpl<$Res, $Val extends NestedFilter>
    implements $NestedFilterCopyWith<$Res> {
  _$NestedFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Filter,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NestedFilterCopyWith<$Res>
    implements $NestedFilterCopyWith<$Res> {
  factory _$$_NestedFilterCopyWith(
          _$_NestedFilter value, $Res Function(_$_NestedFilter) then) =
      __$$_NestedFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, FilterOperator op, Filter value});
}

/// @nodoc
class __$$_NestedFilterCopyWithImpl<$Res>
    extends _$NestedFilterCopyWithImpl<$Res, _$_NestedFilter>
    implements _$$_NestedFilterCopyWith<$Res> {
  __$$_NestedFilterCopyWithImpl(
      _$_NestedFilter _value, $Res Function(_$_NestedFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? op = null,
    Object? value = null,
  }) {
    return _then(_$_NestedFilter(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      op: null == op
          ? _value.op
          : op // ignore: cast_nullable_to_non_nullable
              as FilterOperator,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as Filter,
    ));
  }
}

/// @nodoc

class _$_NestedFilter extends _NestedFilter with DiagnosticableTreeMixin {
  const _$_NestedFilter(
      {required this.key, required this.op, required this.value})
      : super._();

  @override
  final String key;
  @override
  final FilterOperator op;
  @override
  final Filter value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NestedFilter(key: $key, op: $op, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NestedFilter'))
      ..add(DiagnosticsProperty('key', key))
      ..add(DiagnosticsProperty('op', op))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NestedFilter &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, key, op, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NestedFilterCopyWith<_$_NestedFilter> get copyWith =>
      __$$_NestedFilterCopyWithImpl<_$_NestedFilter>(this, _$identity);
}

abstract class _NestedFilter extends NestedFilter {
  const factory _NestedFilter(
      {required final String key,
      required final FilterOperator op,
      required final Filter value}) = _$_NestedFilter;
  const _NestedFilter._() : super._();

  @override
  String get key;
  @override
  FilterOperator get op;
  @override
  Filter get value;
  @override
  @JsonKey(ignore: true)
  _$$_NestedFilterCopyWith<_$_NestedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
