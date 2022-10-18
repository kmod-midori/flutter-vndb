import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';

enum FilterOperator {
  eq("="),
  ne("!="),
  gt(">"),
  gte(">="),
  lt("<"),
  lte("<=");

  const FilterOperator(this.value);

  final String value;

  static FilterOperator fromString(String value) {
    for (final op in values) {
      if (op.value == value) {
        return op;
      }
    }
    throw ArgumentError.value(value, 'value', 'Invalid operator');
  }
}

enum CompositeType {
  and("and"),
  or("or");

  const CompositeType(this.value);

  final String value;

  static CompositeType fromString(String value) {
    for (final op in values) {
      if (op.value == value) {
        return op;
      }
    }
    throw ArgumentError.value(value, 'value', 'Invalid composite type');
  }
}

abstract class Filter {
  const Filter();

  List<dynamic> toFilterJson();
}

@freezed
class CompositeFilter extends Filter with _$CompositeFilter {
  const factory CompositeFilter({
    required CompositeType type,
    required List<Filter> children,
  }) = _CompositeFilter;

  const CompositeFilter._();

  @override
  List<dynamic> toFilterJson() {
    return [
      type.value,
      ...children.map((child) => child.toFilterJson()).toList(),
    ];
  }
}

@freezed
class StringFilter extends Filter with _$StringFilter {
  const factory StringFilter({
    required String key,
    required FilterOperator op,
    required String value,
  }) = _StringFilter;

  const StringFilter._();

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value];
  }
}

@freezed
class IntFilter extends Filter with _$IntFilter {
  const factory IntFilter({
    required String key,
    required FilterOperator op,
    required int? value,
  }) = _IntFilter;

  const IntFilter._();

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value];
  }
}

@freezed
class DoubleFilter extends Filter with _$DoubleFilter {
  const factory DoubleFilter({
    required final String key,
    required final FilterOperator op,
    required final double? value,
  }) = _DoubleFilter;

  const DoubleFilter._();

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value];
  }
}

@freezed
class NestedFilter extends Filter with _$NestedFilter {
  const factory NestedFilter({
    required String key,
    required FilterOperator op,
    required Filter value,
  }) = _NestedFilter;

  const NestedFilter._();

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value.toFilterJson()];
  }
}

Filter parseFilter(List<dynamic> serFilter) {
  switch (serFilter.length) {
    case 0:
    case 1:
      throw const FormatException("Invalid filter: too few elements");
    case 2:
      // Composite filter
      final type = CompositeType.fromString(serFilter[0] as String);
      final children = (serFilter[1] as List<dynamic>)
          .map((child) => parseFilter(child as List<dynamic>))
          .toList();
      return CompositeFilter(type: type, children: children);
    case 3:
      final key = serFilter[0] as String;
      final op = FilterOperator.fromString(serFilter[1] as String);
      final value = serFilter[2];
      if (value is String) {
        return StringFilter(key: key, op: op, value: value);
      } else if (value is int) {
        return IntFilter(key: key, op: op, value: value);
      } else if (value is double) {
        return DoubleFilter(key: key, op: op, value: value);
      } else if (value is List) {
        return NestedFilter(key: key, op: op, value: parseFilter(value));
      } else {
        throw const FormatException("Invalid filter: invalid value type");
      }
    default:
      throw const FormatException("Invalid filter: too many elements");
  }
}
