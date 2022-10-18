// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'vn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisualNovel _$VisualNovelFromJson(Map<String, dynamic> json) {
  return _VisualNovel.fromJson(json);
}

/// @nodoc
mixin _$VisualNovel {
  /// vndbid.
  String get id => throw _privateConstructorUsedError;

  /// Main title as displayed on the site, typically romanized from the original script.
  String? get title => throw _privateConstructorUsedError;

  /// Main title as displayed on the site, typically romanized from the original script.
  String? get alttitle => throw _privateConstructorUsedError;

  /// Full list of titles associated with the VN, always contains at least one title.
  List<VisualNovelTitle>? get titles => throw _privateConstructorUsedError;

  /// list of aliases
  List<String>? get aliases => throw _privateConstructorUsedError;

  /// language the VN has originally been written in.
  String? get olang => throw _privateConstructorUsedError;

  /// development status. 0 meaning ‘Finished’, 1 is ‘In development’ and 2 for ‘Cancelled’.
  int? get devstatus => throw _privateConstructorUsedError;

  /// Date of the first release.
  String? get released => throw _privateConstructorUsedError;

  /// list of languages this VN is available in. Does not include machine translations.
  List<String>? get languages => throw _privateConstructorUsedError;

  /// list of platforms for which this VN is available.
  List<String>? get platforms => throw _privateConstructorUsedError;
  VisualNovelImage? get image => throw _privateConstructorUsedError;

  /// Length of the game, 1-5.
  /// This field is only used as a fallback for when there are no length votes,
  /// so you’ll probably want to fetch length_minutes too.
  int? get length => throw _privateConstructorUsedError;

  /// Average play time from length votes
  @JsonKey(name: 'length_minutes')
  int? get lengthMinutes => throw _privateConstructorUsedError;

  /// Number of length votes
  @JsonKey(name: 'length_votes')
  int? get lengthVotes => throw _privateConstructorUsedError;

  /// Description of the VN. Can include formatting codes as described in d9#3.
  String? get description => throw _privateConstructorUsedError;

  /// Between 0 (unpopular) and 100 (most popular).
  double? get popularity => throw _privateConstructorUsedError;

  /// Bayesian rating, between 1 and 10, null if nobody voted.
  double? get rating => throw _privateConstructorUsedError;

  /// Number of votes.
  int? get votecount => throw _privateConstructorUsedError;

  /// Tags associated with the VN.
  List<VisualNovelTag>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisualNovelCopyWith<VisualNovel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualNovelCopyWith<$Res> {
  factory $VisualNovelCopyWith(
          VisualNovel value, $Res Function(VisualNovel) then) =
      _$VisualNovelCopyWithImpl<$Res, VisualNovel>;
  @useResult
  $Res call(
      {String id,
      String? title,
      String? alttitle,
      List<VisualNovelTitle>? titles,
      List<String>? aliases,
      String? olang,
      int? devstatus,
      String? released,
      List<String>? languages,
      List<String>? platforms,
      VisualNovelImage? image,
      int? length,
      @JsonKey(name: 'length_minutes') int? lengthMinutes,
      @JsonKey(name: 'length_votes') int? lengthVotes,
      String? description,
      double? popularity,
      double? rating,
      int? votecount,
      List<VisualNovelTag>? tags});

  $VisualNovelImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$VisualNovelCopyWithImpl<$Res, $Val extends VisualNovel>
    implements $VisualNovelCopyWith<$Res> {
  _$VisualNovelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? alttitle = freezed,
    Object? titles = freezed,
    Object? aliases = freezed,
    Object? olang = freezed,
    Object? devstatus = freezed,
    Object? released = freezed,
    Object? languages = freezed,
    Object? platforms = freezed,
    Object? image = freezed,
    Object? length = freezed,
    Object? lengthMinutes = freezed,
    Object? lengthVotes = freezed,
    Object? description = freezed,
    Object? popularity = freezed,
    Object? rating = freezed,
    Object? votecount = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      alttitle: freezed == alttitle
          ? _value.alttitle
          : alttitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titles: freezed == titles
          ? _value.titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<VisualNovelTitle>?,
      aliases: freezed == aliases
          ? _value.aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      olang: freezed == olang
          ? _value.olang
          : olang // ignore: cast_nullable_to_non_nullable
              as String?,
      devstatus: freezed == devstatus
          ? _value.devstatus
          : devstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: freezed == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      platforms: freezed == platforms
          ? _value.platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as VisualNovelImage?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      lengthMinutes: freezed == lengthMinutes
          ? _value.lengthMinutes
          : lengthMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      lengthVotes: freezed == lengthVotes
          ? _value.lengthVotes
          : lengthVotes // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      votecount: freezed == votecount
          ? _value.votecount
          : votecount // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<VisualNovelTag>?,
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
abstract class _$$_VisualNovelCopyWith<$Res>
    implements $VisualNovelCopyWith<$Res> {
  factory _$$_VisualNovelCopyWith(
          _$_VisualNovel value, $Res Function(_$_VisualNovel) then) =
      __$$_VisualNovelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? title,
      String? alttitle,
      List<VisualNovelTitle>? titles,
      List<String>? aliases,
      String? olang,
      int? devstatus,
      String? released,
      List<String>? languages,
      List<String>? platforms,
      VisualNovelImage? image,
      int? length,
      @JsonKey(name: 'length_minutes') int? lengthMinutes,
      @JsonKey(name: 'length_votes') int? lengthVotes,
      String? description,
      double? popularity,
      double? rating,
      int? votecount,
      List<VisualNovelTag>? tags});

  @override
  $VisualNovelImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$_VisualNovelCopyWithImpl<$Res>
    extends _$VisualNovelCopyWithImpl<$Res, _$_VisualNovel>
    implements _$$_VisualNovelCopyWith<$Res> {
  __$$_VisualNovelCopyWithImpl(
      _$_VisualNovel _value, $Res Function(_$_VisualNovel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? alttitle = freezed,
    Object? titles = freezed,
    Object? aliases = freezed,
    Object? olang = freezed,
    Object? devstatus = freezed,
    Object? released = freezed,
    Object? languages = freezed,
    Object? platforms = freezed,
    Object? image = freezed,
    Object? length = freezed,
    Object? lengthMinutes = freezed,
    Object? lengthVotes = freezed,
    Object? description = freezed,
    Object? popularity = freezed,
    Object? rating = freezed,
    Object? votecount = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_VisualNovel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      alttitle: freezed == alttitle
          ? _value.alttitle
          : alttitle // ignore: cast_nullable_to_non_nullable
              as String?,
      titles: freezed == titles
          ? _value._titles
          : titles // ignore: cast_nullable_to_non_nullable
              as List<VisualNovelTitle>?,
      aliases: freezed == aliases
          ? _value._aliases
          : aliases // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      olang: freezed == olang
          ? _value.olang
          : olang // ignore: cast_nullable_to_non_nullable
              as String?,
      devstatus: freezed == devstatus
          ? _value.devstatus
          : devstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      released: freezed == released
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: freezed == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      platforms: freezed == platforms
          ? _value._platforms
          : platforms // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as VisualNovelImage?,
      length: freezed == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int?,
      lengthMinutes: freezed == lengthMinutes
          ? _value.lengthMinutes
          : lengthMinutes // ignore: cast_nullable_to_non_nullable
              as int?,
      lengthVotes: freezed == lengthVotes
          ? _value.lengthVotes
          : lengthVotes // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      popularity: freezed == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      votecount: freezed == votecount
          ? _value.votecount
          : votecount // ignore: cast_nullable_to_non_nullable
              as int?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<VisualNovelTag>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisualNovel extends _VisualNovel {
  const _$_VisualNovel(
      {required this.id,
      this.title,
      this.alttitle,
      final List<VisualNovelTitle>? titles,
      final List<String>? aliases,
      this.olang,
      this.devstatus,
      this.released,
      final List<String>? languages,
      final List<String>? platforms,
      this.image,
      this.length,
      @JsonKey(name: 'length_minutes') this.lengthMinutes,
      @JsonKey(name: 'length_votes') this.lengthVotes,
      this.description,
      this.popularity,
      this.rating,
      this.votecount,
      final List<VisualNovelTag>? tags})
      : _titles = titles,
        _aliases = aliases,
        _languages = languages,
        _platforms = platforms,
        _tags = tags,
        super._();

  factory _$_VisualNovel.fromJson(Map<String, dynamic> json) =>
      _$$_VisualNovelFromJson(json);

  /// vndbid.
  @override
  final String id;

  /// Main title as displayed on the site, typically romanized from the original script.
  @override
  final String? title;

  /// Main title as displayed on the site, typically romanized from the original script.
  @override
  final String? alttitle;

  /// Full list of titles associated with the VN, always contains at least one title.
  final List<VisualNovelTitle>? _titles;

  /// Full list of titles associated with the VN, always contains at least one title.
  @override
  List<VisualNovelTitle>? get titles {
    final value = _titles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// list of aliases
  final List<String>? _aliases;

  /// list of aliases
  @override
  List<String>? get aliases {
    final value = _aliases;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// language the VN has originally been written in.
  @override
  final String? olang;

  /// development status. 0 meaning ‘Finished’, 1 is ‘In development’ and 2 for ‘Cancelled’.
  @override
  final int? devstatus;

  /// Date of the first release.
  @override
  final String? released;

  /// list of languages this VN is available in. Does not include machine translations.
  final List<String>? _languages;

  /// list of languages this VN is available in. Does not include machine translations.
  @override
  List<String>? get languages {
    final value = _languages;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// list of platforms for which this VN is available.
  final List<String>? _platforms;

  /// list of platforms for which this VN is available.
  @override
  List<String>? get platforms {
    final value = _platforms;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final VisualNovelImage? image;

  /// Length of the game, 1-5.
  /// This field is only used as a fallback for when there are no length votes,
  /// so you’ll probably want to fetch length_minutes too.
  @override
  final int? length;

  /// Average play time from length votes
  @override
  @JsonKey(name: 'length_minutes')
  final int? lengthMinutes;

  /// Number of length votes
  @override
  @JsonKey(name: 'length_votes')
  final int? lengthVotes;

  /// Description of the VN. Can include formatting codes as described in d9#3.
  @override
  final String? description;

  /// Between 0 (unpopular) and 100 (most popular).
  @override
  final double? popularity;

  /// Bayesian rating, between 1 and 10, null if nobody voted.
  @override
  final double? rating;

  /// Number of votes.
  @override
  final int? votecount;

  /// Tags associated with the VN.
  final List<VisualNovelTag>? _tags;

  /// Tags associated with the VN.
  @override
  List<VisualNovelTag>? get tags {
    final value = _tags;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'VisualNovel(id: $id, title: $title, alttitle: $alttitle, titles: $titles, aliases: $aliases, olang: $olang, devstatus: $devstatus, released: $released, languages: $languages, platforms: $platforms, image: $image, length: $length, lengthMinutes: $lengthMinutes, lengthVotes: $lengthVotes, description: $description, popularity: $popularity, rating: $rating, votecount: $votecount, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisualNovel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.alttitle, alttitle) ||
                other.alttitle == alttitle) &&
            const DeepCollectionEquality().equals(other._titles, _titles) &&
            const DeepCollectionEquality().equals(other._aliases, _aliases) &&
            (identical(other.olang, olang) || other.olang == olang) &&
            (identical(other.devstatus, devstatus) ||
                other.devstatus == devstatus) &&
            (identical(other.released, released) ||
                other.released == released) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            const DeepCollectionEquality()
                .equals(other._platforms, _platforms) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.lengthMinutes, lengthMinutes) ||
                other.lengthMinutes == lengthMinutes) &&
            (identical(other.lengthVotes, lengthVotes) ||
                other.lengthVotes == lengthVotes) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.popularity, popularity) ||
                other.popularity == popularity) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.votecount, votecount) ||
                other.votecount == votecount) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        alttitle,
        const DeepCollectionEquality().hash(_titles),
        const DeepCollectionEquality().hash(_aliases),
        olang,
        devstatus,
        released,
        const DeepCollectionEquality().hash(_languages),
        const DeepCollectionEquality().hash(_platforms),
        image,
        length,
        lengthMinutes,
        lengthVotes,
        description,
        popularity,
        rating,
        votecount,
        const DeepCollectionEquality().hash(_tags)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisualNovelCopyWith<_$_VisualNovel> get copyWith =>
      __$$_VisualNovelCopyWithImpl<_$_VisualNovel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisualNovelToJson(
      this,
    );
  }
}

abstract class _VisualNovel extends VisualNovel {
  const factory _VisualNovel(
      {required final String id,
      final String? title,
      final String? alttitle,
      final List<VisualNovelTitle>? titles,
      final List<String>? aliases,
      final String? olang,
      final int? devstatus,
      final String? released,
      final List<String>? languages,
      final List<String>? platforms,
      final VisualNovelImage? image,
      final int? length,
      @JsonKey(name: 'length_minutes') final int? lengthMinutes,
      @JsonKey(name: 'length_votes') final int? lengthVotes,
      final String? description,
      final double? popularity,
      final double? rating,
      final int? votecount,
      final List<VisualNovelTag>? tags}) = _$_VisualNovel;
  const _VisualNovel._() : super._();

  factory _VisualNovel.fromJson(Map<String, dynamic> json) =
      _$_VisualNovel.fromJson;

  @override

  /// vndbid.
  String get id;
  @override

  /// Main title as displayed on the site, typically romanized from the original script.
  String? get title;
  @override

  /// Main title as displayed on the site, typically romanized from the original script.
  String? get alttitle;
  @override

  /// Full list of titles associated with the VN, always contains at least one title.
  List<VisualNovelTitle>? get titles;
  @override

  /// list of aliases
  List<String>? get aliases;
  @override

  /// language the VN has originally been written in.
  String? get olang;
  @override

  /// development status. 0 meaning ‘Finished’, 1 is ‘In development’ and 2 for ‘Cancelled’.
  int? get devstatus;
  @override

  /// Date of the first release.
  String? get released;
  @override

  /// list of languages this VN is available in. Does not include machine translations.
  List<String>? get languages;
  @override

  /// list of platforms for which this VN is available.
  List<String>? get platforms;
  @override
  VisualNovelImage? get image;
  @override

  /// Length of the game, 1-5.
  /// This field is only used as a fallback for when there are no length votes,
  /// so you’ll probably want to fetch length_minutes too.
  int? get length;
  @override

  /// Average play time from length votes
  @JsonKey(name: 'length_minutes')
  int? get lengthMinutes;
  @override

  /// Number of length votes
  @JsonKey(name: 'length_votes')
  int? get lengthVotes;
  @override

  /// Description of the VN. Can include formatting codes as described in d9#3.
  String? get description;
  @override

  /// Between 0 (unpopular) and 100 (most popular).
  double? get popularity;
  @override

  /// Bayesian rating, between 1 and 10, null if nobody voted.
  double? get rating;
  @override

  /// Number of votes.
  int? get votecount;
  @override

  /// Tags associated with the VN.
  List<VisualNovelTag>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_VisualNovelCopyWith<_$_VisualNovel> get copyWith =>
      throw _privateConstructorUsedError;
}

VisualNovelTitle _$VisualNovelTitleFromJson(Map<String, dynamic> json) {
  return _VisualNovelTitle.fromJson(json);
}

/// @nodoc
mixin _$VisualNovelTitle {
  /// language of this title. Each language appears at most once in the titles list.
  String get lang => throw _privateConstructorUsedError;

  /// title in the original script
  String get title => throw _privateConstructorUsedError;

  /// romanized version of "title"
  String? get latin => throw _privateConstructorUsedError;

  /// whether this is an official title
  bool get official => throw _privateConstructorUsedError;

  /// whether this is the “main” title for the visual novel entry
  bool get main => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisualNovelTitleCopyWith<VisualNovelTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualNovelTitleCopyWith<$Res> {
  factory $VisualNovelTitleCopyWith(
          VisualNovelTitle value, $Res Function(VisualNovelTitle) then) =
      _$VisualNovelTitleCopyWithImpl<$Res, VisualNovelTitle>;
  @useResult
  $Res call(
      {String lang, String title, String? latin, bool official, bool main});
}

/// @nodoc
class _$VisualNovelTitleCopyWithImpl<$Res, $Val extends VisualNovelTitle>
    implements $VisualNovelTitleCopyWith<$Res> {
  _$VisualNovelTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? title = null,
    Object? latin = freezed,
    Object? official = null,
    Object? main = null,
  }) {
    return _then(_value.copyWith(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      latin: freezed == latin
          ? _value.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      official: null == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisualNovelTitleCopyWith<$Res>
    implements $VisualNovelTitleCopyWith<$Res> {
  factory _$$_VisualNovelTitleCopyWith(
          _$_VisualNovelTitle value, $Res Function(_$_VisualNovelTitle) then) =
      __$$_VisualNovelTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String lang, String title, String? latin, bool official, bool main});
}

/// @nodoc
class __$$_VisualNovelTitleCopyWithImpl<$Res>
    extends _$VisualNovelTitleCopyWithImpl<$Res, _$_VisualNovelTitle>
    implements _$$_VisualNovelTitleCopyWith<$Res> {
  __$$_VisualNovelTitleCopyWithImpl(
      _$_VisualNovelTitle _value, $Res Function(_$_VisualNovelTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? title = null,
    Object? latin = freezed,
    Object? official = null,
    Object? main = null,
  }) {
    return _then(_$_VisualNovelTitle(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      latin: freezed == latin
          ? _value.latin
          : latin // ignore: cast_nullable_to_non_nullable
              as String?,
      official: null == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as bool,
      main: null == main
          ? _value.main
          : main // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisualNovelTitle implements _VisualNovelTitle {
  const _$_VisualNovelTitle(
      {required this.lang,
      required this.title,
      this.latin,
      required this.official,
      required this.main});

  factory _$_VisualNovelTitle.fromJson(Map<String, dynamic> json) =>
      _$$_VisualNovelTitleFromJson(json);

  /// language of this title. Each language appears at most once in the titles list.
  @override
  final String lang;

  /// title in the original script
  @override
  final String title;

  /// romanized version of "title"
  @override
  final String? latin;

  /// whether this is an official title
  @override
  final bool official;

  /// whether this is the “main” title for the visual novel entry
  @override
  final bool main;

  @override
  String toString() {
    return 'VisualNovelTitle(lang: $lang, title: $title, latin: $latin, official: $official, main: $main)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisualNovelTitle &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.latin, latin) || other.latin == latin) &&
            (identical(other.official, official) ||
                other.official == official) &&
            (identical(other.main, main) || other.main == main));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lang, title, latin, official, main);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisualNovelTitleCopyWith<_$_VisualNovelTitle> get copyWith =>
      __$$_VisualNovelTitleCopyWithImpl<_$_VisualNovelTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisualNovelTitleToJson(
      this,
    );
  }
}

abstract class _VisualNovelTitle implements VisualNovelTitle {
  const factory _VisualNovelTitle(
      {required final String lang,
      required final String title,
      final String? latin,
      required final bool official,
      required final bool main}) = _$_VisualNovelTitle;

  factory _VisualNovelTitle.fromJson(Map<String, dynamic> json) =
      _$_VisualNovelTitle.fromJson;

  @override

  /// language of this title. Each language appears at most once in the titles list.
  String get lang;
  @override

  /// title in the original script
  String get title;
  @override

  /// romanized version of "title"
  String? get latin;
  @override

  /// whether this is an official title
  bool get official;
  @override

  /// whether this is the “main” title for the visual novel entry
  bool get main;
  @override
  @JsonKey(ignore: true)
  _$$_VisualNovelTitleCopyWith<_$_VisualNovelTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

VisualNovelImage _$VisualNovelImageFromJson(Map<String, dynamic> json) {
  return _VisualNovelImage.fromJson(json);
}

/// @nodoc
mixin _$VisualNovelImage {
  String? get id => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  /// Number between 0 and 2 (inclusive), average image flagging vote for sexual content.
  double? get sexual => throw _privateConstructorUsedError;

  /// Number between 0 and 2 (inclusive), average image flagging vote for violence.
  double? get violence => throw _privateConstructorUsedError;

  /// number of image flagging votes.
  int? get votecount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisualNovelImageCopyWith<VisualNovelImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualNovelImageCopyWith<$Res> {
  factory $VisualNovelImageCopyWith(
          VisualNovelImage value, $Res Function(VisualNovelImage) then) =
      _$VisualNovelImageCopyWithImpl<$Res, VisualNovelImage>;
  @useResult
  $Res call(
      {String? id,
      String? url,
      double? sexual,
      double? violence,
      int? votecount});
}

/// @nodoc
class _$VisualNovelImageCopyWithImpl<$Res, $Val extends VisualNovelImage>
    implements $VisualNovelImageCopyWith<$Res> {
  _$VisualNovelImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? sexual = freezed,
    Object? violence = freezed,
    Object? votecount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sexual: freezed == sexual
          ? _value.sexual
          : sexual // ignore: cast_nullable_to_non_nullable
              as double?,
      violence: freezed == violence
          ? _value.violence
          : violence // ignore: cast_nullable_to_non_nullable
              as double?,
      votecount: freezed == votecount
          ? _value.votecount
          : votecount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisualNovelImageCopyWith<$Res>
    implements $VisualNovelImageCopyWith<$Res> {
  factory _$$_VisualNovelImageCopyWith(
          _$_VisualNovelImage value, $Res Function(_$_VisualNovelImage) then) =
      __$$_VisualNovelImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? url,
      double? sexual,
      double? violence,
      int? votecount});
}

/// @nodoc
class __$$_VisualNovelImageCopyWithImpl<$Res>
    extends _$VisualNovelImageCopyWithImpl<$Res, _$_VisualNovelImage>
    implements _$$_VisualNovelImageCopyWith<$Res> {
  __$$_VisualNovelImageCopyWithImpl(
      _$_VisualNovelImage _value, $Res Function(_$_VisualNovelImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? sexual = freezed,
    Object? violence = freezed,
    Object? votecount = freezed,
  }) {
    return _then(_$_VisualNovelImage(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      sexual: freezed == sexual
          ? _value.sexual
          : sexual // ignore: cast_nullable_to_non_nullable
              as double?,
      violence: freezed == violence
          ? _value.violence
          : violence // ignore: cast_nullable_to_non_nullable
              as double?,
      votecount: freezed == votecount
          ? _value.votecount
          : votecount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisualNovelImage implements _VisualNovelImage {
  const _$_VisualNovelImage(
      {this.id, this.url, this.sexual, this.violence, this.votecount});

  factory _$_VisualNovelImage.fromJson(Map<String, dynamic> json) =>
      _$$_VisualNovelImageFromJson(json);

  @override
  final String? id;
  @override
  final String? url;

  /// Number between 0 and 2 (inclusive), average image flagging vote for sexual content.
  @override
  final double? sexual;

  /// Number between 0 and 2 (inclusive), average image flagging vote for violence.
  @override
  final double? violence;

  /// number of image flagging votes.
  @override
  final int? votecount;

  @override
  String toString() {
    return 'VisualNovelImage(id: $id, url: $url, sexual: $sexual, violence: $violence, votecount: $votecount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisualNovelImage &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.sexual, sexual) || other.sexual == sexual) &&
            (identical(other.violence, violence) ||
                other.violence == violence) &&
            (identical(other.votecount, votecount) ||
                other.votecount == votecount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, url, sexual, violence, votecount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisualNovelImageCopyWith<_$_VisualNovelImage> get copyWith =>
      __$$_VisualNovelImageCopyWithImpl<_$_VisualNovelImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisualNovelImageToJson(
      this,
    );
  }
}

abstract class _VisualNovelImage implements VisualNovelImage {
  const factory _VisualNovelImage(
      {final String? id,
      final String? url,
      final double? sexual,
      final double? violence,
      final int? votecount}) = _$_VisualNovelImage;

  factory _VisualNovelImage.fromJson(Map<String, dynamic> json) =
      _$_VisualNovelImage.fromJson;

  @override
  String? get id;
  @override
  String? get url;
  @override

  /// Number between 0 and 2 (inclusive), average image flagging vote for sexual content.
  double? get sexual;
  @override

  /// Number between 0 and 2 (inclusive), average image flagging vote for violence.
  double? get violence;
  @override

  /// number of image flagging votes.
  int? get votecount;
  @override
  @JsonKey(ignore: true)
  _$$_VisualNovelImageCopyWith<_$_VisualNovelImage> get copyWith =>
      throw _privateConstructorUsedError;
}

VisualNovelTag _$VisualNovelTagFromJson(Map<String, dynamic> json) {
  return _VisualNovelTag.fromJson(json);
}

/// @nodoc
mixin _$VisualNovelTag {
  String get id => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  int get spoiler => throw _privateConstructorUsedError;
  bool get lie => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisualNovelTagCopyWith<VisualNovelTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisualNovelTagCopyWith<$Res> {
  factory $VisualNovelTagCopyWith(
          VisualNovelTag value, $Res Function(VisualNovelTag) then) =
      _$VisualNovelTagCopyWithImpl<$Res, VisualNovelTag>;
  @useResult
  $Res call(
      {String id,
      double rating,
      int spoiler,
      bool lie,
      String name,
      String category});
}

/// @nodoc
class _$VisualNovelTagCopyWithImpl<$Res, $Val extends VisualNovelTag>
    implements $VisualNovelTagCopyWith<$Res> {
  _$VisualNovelTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? spoiler = null,
    Object? lie = null,
    Object? name = null,
    Object? category = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      spoiler: null == spoiler
          ? _value.spoiler
          : spoiler // ignore: cast_nullable_to_non_nullable
              as int,
      lie: null == lie
          ? _value.lie
          : lie // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisualNovelTagCopyWith<$Res>
    implements $VisualNovelTagCopyWith<$Res> {
  factory _$$_VisualNovelTagCopyWith(
          _$_VisualNovelTag value, $Res Function(_$_VisualNovelTag) then) =
      __$$_VisualNovelTagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double rating,
      int spoiler,
      bool lie,
      String name,
      String category});
}

/// @nodoc
class __$$_VisualNovelTagCopyWithImpl<$Res>
    extends _$VisualNovelTagCopyWithImpl<$Res, _$_VisualNovelTag>
    implements _$$_VisualNovelTagCopyWith<$Res> {
  __$$_VisualNovelTagCopyWithImpl(
      _$_VisualNovelTag _value, $Res Function(_$_VisualNovelTag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? rating = null,
    Object? spoiler = null,
    Object? lie = null,
    Object? name = null,
    Object? category = null,
  }) {
    return _then(_$_VisualNovelTag(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      spoiler: null == spoiler
          ? _value.spoiler
          : spoiler // ignore: cast_nullable_to_non_nullable
              as int,
      lie: null == lie
          ? _value.lie
          : lie // ignore: cast_nullable_to_non_nullable
              as bool,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VisualNovelTag implements _VisualNovelTag {
  const _$_VisualNovelTag(
      {required this.id,
      required this.rating,
      required this.spoiler,
      required this.lie,
      required this.name,
      required this.category});

  factory _$_VisualNovelTag.fromJson(Map<String, dynamic> json) =>
      _$$_VisualNovelTagFromJson(json);

  @override
  final String id;
  @override
  final double rating;
  @override
  final int spoiler;
  @override
  final bool lie;
  @override
  final String name;
  @override
  final String category;

  @override
  String toString() {
    return 'VisualNovelTag(id: $id, rating: $rating, spoiler: $spoiler, lie: $lie, name: $name, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisualNovelTag &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.spoiler, spoiler) || other.spoiler == spoiler) &&
            (identical(other.lie, lie) || other.lie == lie) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, rating, spoiler, lie, name, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisualNovelTagCopyWith<_$_VisualNovelTag> get copyWith =>
      __$$_VisualNovelTagCopyWithImpl<_$_VisualNovelTag>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisualNovelTagToJson(
      this,
    );
  }
}

abstract class _VisualNovelTag implements VisualNovelTag {
  const factory _VisualNovelTag(
      {required final String id,
      required final double rating,
      required final int spoiler,
      required final bool lie,
      required final String name,
      required final String category}) = _$_VisualNovelTag;

  factory _VisualNovelTag.fromJson(Map<String, dynamic> json) =
      _$_VisualNovelTag.fromJson;

  @override
  String get id;
  @override
  double get rating;
  @override
  int get spoiler;
  @override
  bool get lie;
  @override
  String get name;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$$_VisualNovelTagCopyWith<_$_VisualNovelTag> get copyWith =>
      throw _privateConstructorUsedError;
}
