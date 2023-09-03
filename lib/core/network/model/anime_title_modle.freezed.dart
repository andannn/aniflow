// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_title_modle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimeTitle _$AnimeTitleFromJson(Map<String, dynamic> json) {
  return _AnimeTitle.fromJson(json);
}

/// @nodoc
mixin _$AnimeTitle {
  @JsonKey(name: 'romaji')
  String get romaji => throw _privateConstructorUsedError;
  @JsonKey(name: 'english')
  String get english => throw _privateConstructorUsedError;
  @JsonKey(name: 'native')
  String get native => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeTitleCopyWith<AnimeTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeTitleCopyWith<$Res> {
  factory $AnimeTitleCopyWith(
          AnimeTitle value, $Res Function(AnimeTitle) then) =
      _$AnimeTitleCopyWithImpl<$Res, AnimeTitle>;
  @useResult
  $Res call(
      {@JsonKey(name: 'romaji') String romaji,
      @JsonKey(name: 'english') String english,
      @JsonKey(name: 'native') String native});
}

/// @nodoc
class _$AnimeTitleCopyWithImpl<$Res, $Val extends AnimeTitle>
    implements $AnimeTitleCopyWith<$Res> {
  _$AnimeTitleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = null,
    Object? native = null,
  }) {
    return _then(_value.copyWith(
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      native: null == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimeTitleCopyWith<$Res>
    implements $AnimeTitleCopyWith<$Res> {
  factory _$$_AnimeTitleCopyWith(
          _$_AnimeTitle value, $Res Function(_$_AnimeTitle) then) =
      __$$_AnimeTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'romaji') String romaji,
      @JsonKey(name: 'english') String english,
      @JsonKey(name: 'native') String native});
}

/// @nodoc
class __$$_AnimeTitleCopyWithImpl<$Res>
    extends _$AnimeTitleCopyWithImpl<$Res, _$_AnimeTitle>
    implements _$$_AnimeTitleCopyWith<$Res> {
  __$$_AnimeTitleCopyWithImpl(
      _$_AnimeTitle _value, $Res Function(_$_AnimeTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = null,
    Object? native = null,
  }) {
    return _then(_$_AnimeTitle(
      romaji: null == romaji
          ? _value.romaji
          : romaji // ignore: cast_nullable_to_non_nullable
              as String,
      english: null == english
          ? _value.english
          : english // ignore: cast_nullable_to_non_nullable
              as String,
      native: null == native
          ? _value.native
          : native // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnimeTitle implements _AnimeTitle {
  _$_AnimeTitle(
      {@JsonKey(name: 'romaji') this.romaji = '',
      @JsonKey(name: 'english') this.english = '',
      @JsonKey(name: 'native') this.native = ''});

  factory _$_AnimeTitle.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeTitleFromJson(json);

  @override
  @JsonKey(name: 'romaji')
  final String romaji;
  @override
  @JsonKey(name: 'english')
  final String english;
  @override
  @JsonKey(name: 'native')
  final String native;

  @override
  String toString() {
    return 'AnimeTitle(romaji: $romaji, english: $english, native: $native)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeTitle &&
            (identical(other.romaji, romaji) || other.romaji == romaji) &&
            (identical(other.english, english) || other.english == english) &&
            (identical(other.native, native) || other.native == native));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, romaji, english, native);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeTitleCopyWith<_$_AnimeTitle> get copyWith =>
      __$$_AnimeTitleCopyWithImpl<_$_AnimeTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimeTitleToJson(
      this,
    );
  }
}

abstract class _AnimeTitle implements AnimeTitle {
  factory _AnimeTitle(
      {@JsonKey(name: 'romaji') final String romaji,
      @JsonKey(name: 'english') final String english,
      @JsonKey(name: 'native') final String native}) = _$_AnimeTitle;

  factory _AnimeTitle.fromJson(Map<String, dynamic> json) =
      _$_AnimeTitle.fromJson;

  @override
  @JsonKey(name: 'romaji')
  String get romaji;
  @override
  @JsonKey(name: 'english')
  String get english;
  @override
  @JsonKey(name: 'native')
  String get native;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeTitleCopyWith<_$_AnimeTitle> get copyWith =>
      throw _privateConstructorUsedError;
}
