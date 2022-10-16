import 'package:flutter/foundation.dart';

enum FilterOperator {
  eq("="),
  ne("!="),
  gt(">"),
  gte(">="),
  lt("<"),
  lte("<=");

  const FilterOperator(this.value);

  final String value;
}

enum CompositeType {
  and("and"),
  or("or");

  const CompositeType(this.value);

  final String value;
}

abstract class Filter {
  List<dynamic> toFilterJson();
}

class CompositeFilter extends Filter {
  final CompositeType type;

  final List<Filter> children;

  CompositeFilter({
    required this.type,
    required this.children,
  });

  @override
  List<dynamic> toFilterJson() {
    return [
      type.value,
      ...children.map((child) => child.toFilterJson()).toList(),
    ];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompositeFilter &&
        other.type == type &&
        listEquals(other.children, children);
  }

  @override
  int get hashCode => type.hashCode ^ children.hashCode;
}

class StringFilter extends Filter {
  final String key;

  final FilterOperator op;

  final String? value;

  StringFilter(
    this.key,
    this.op,
    this.value,
  );

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StringFilter &&
        other.key == key &&
        other.op == op &&
        other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ op.hashCode ^ value.hashCode;
}

class IntFilter extends Filter {
  final String key;

  final FilterOperator op;

  final int? value;

  IntFilter(
    this.key,
    this.op,
    this.value,
  );

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is IntFilter &&
        other.key == key &&
        other.op == op &&
        other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ op.hashCode ^ value.hashCode;
}

class DoubleFilter extends Filter {
  final String key;

  final FilterOperator op;

  final double? value;

  DoubleFilter(
    this.key,
    this.op,
    this.value,
  );

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DoubleFilter &&
        other.key == key &&
        other.op == op &&
        other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ op.hashCode ^ value.hashCode;
}

class NestedFilter extends Filter {
  final String key;

  final FilterOperator op;

  final Filter value;

  NestedFilter(
    this.key,
    this.op,
    this.value,
  );

  @override
  List<dynamic> toFilterJson() {
    return [key, op.value, value.toFilterJson()];
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NestedFilter &&
        other.key == key &&
        other.op == op &&
        other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ op.hashCode ^ value.hashCode;
}
