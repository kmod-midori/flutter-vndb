// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Character _$CharacterFromJson(Map<String, dynamic> json) {
  return _Character.fromJson(json);
}

/// @nodoc
mixin _$Character {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  /// name in the original script.
  String? get original => throw _privateConstructorUsedError;
  List<String>? get aliases => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  VisualNovelImage? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterCopyWith<Character> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterCopyWith<$Res> {
  factory $CharacterCopyWith(Character value, $Res Function(Character) then) =
      _$CharacterCopyWithImpl<$Res, Character>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? original,
      List<String>? aliases,
      String? description,
      VisualNovelImage? image});

  $VisualNovelImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$CharacterCopyWithImpl<$Res, $Val extends Character>
    implements $CharacterCopyWith<$Res> {
  _$CharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? original = freezed,
    Object? aliases = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      original: freezed == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      aliases: freezed == aliases
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as VisualNovelImage?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisualNovelImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $VisualNovelImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharacterCopyWith<$Res> implements $CharacterCopyWith<$Res> {
  factory _$$_CharacterCopyWith(
          _$_Character value, $Res Function(_$_Character) then) =
      __$$_CharacterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? original,
      List<String>? aliases,
      String? description,
      VisualNovelImage? image});

  @override
  $VisualNovelImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$_CharacterCopyWithImpl<$Res>
    extends _$CharacterCopyWithImpl<$Res, _$_Character>
    implements _$$_CharacterCopyWith<$Res> {
  __$$_CharacterCopyWithImpl(
      _$_Character _value, $Res Function(_$_Character) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? original = freezed,
    Object? aliases = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_Character(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      original: freezed == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String?,
      aliases: freezed == aliases
          ? _value._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as VisualNovelImage?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Character implements _Character {
  const _$_Character(
      {required this.id,
      required this.name,
      this.original,
      final List<String>? aliases,
      this.description,
      this.image})
      : _aliases = aliases;

  factory _$_Character.fromJson(Map<String, dynamic> json) =>
      _$$_CharacterFromJson(json);

  @override
  final String id;
  @override
  final String name;

  /// name in the original script.
  @override
  final String? original;
  final List<String>? _aliases;
  @override
  List<String>? get aliases {
    final value = _aliases;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;
  @override
  final VisualNovelImage? image;

  @override
  String toString() {
    return 'Character(id: $id, name: $name, original: $original, aliases: $aliases, description: $description, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Character &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.original, original) ||
                other.original == original) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, original,
      const DeepCollectionEquality().hash(_aliases), description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharacterCopyWith<_$_Character> get copyWith =>
      __$$_CharacterCopyWithImpl<_$_Character>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CharacterToJson(
      this,
    );
  }
}

abstract class _Character implements Character {
  const factory _Character(
      {required final String id,
      required final String name,
      final String? original,
      final List<String>? aliases,
      final String? description,
      final VisualNovelImage? image}) = _$_Character;

  factory _Character.fromJson(Map<String, dynamic> json) =
      _$_Character.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override

  /// name in the original script.
  String? get original;
  @override
  List<String>? get aliases;
  @override
  String? get description;
  @override
  VisualNovelImage? get image;
  @override
  @JsonKey(ignore: true)
  _$$_CharacterCopyWith<_$_Character> get copyWith =>
      throw _privateConstructorUsedError;
}
