// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_title_modle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaTitle _$MediaTitleFromJson(Map<String, dynamic> json) {
  return _MediaTitle.fromJson(json);
}

/// @nodoc
mixin _$MediaTitle {
  @JsonKey(name: 'romaji')
  String get romaji => throw _privateConstructorUsedError;
  @JsonKey(name: 'english')
  String get english => throw _privateConstructorUsedError;
  @JsonKey(name: 'native')
  String get native => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaTitleCopyWith<MediaTitle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaTitleCopyWith<$Res> {
  factory $MediaTitleCopyWith(
          MediaTitle value, $Res Function(MediaTitle) then) =
      _$MediaTitleCopyWithImpl<$Res, MediaTitle>;
  @useResult
  $Res call(
      {@JsonKey(name: 'romaji') String romaji,
      @JsonKey(name: 'english') String english,
      @JsonKey(name: 'native') String native});
}

/// @nodoc
class _$MediaTitleCopyWithImpl<$Res, $Val extends MediaTitle>
    implements $MediaTitleCopyWith<$Res> {
  _$MediaTitleCopyWithImpl(this._value, this._then);

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
abstract class _$$_MediaTitleCopyWith<$Res>
    implements $MediaTitleCopyWith<$Res> {
  factory _$$_MediaTitleCopyWith(
          _$_MediaTitle value, $Res Function(_$_MediaTitle) then) =
      __$$_MediaTitleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'romaji') String romaji,
      @JsonKey(name: 'english') String english,
      @JsonKey(name: 'native') String native});
}

/// @nodoc
class __$$_MediaTitleCopyWithImpl<$Res>
    extends _$MediaTitleCopyWithImpl<$Res, _$_MediaTitle>
    implements _$$_MediaTitleCopyWith<$Res> {
  __$$_MediaTitleCopyWithImpl(
      _$_MediaTitle _value, $Res Function(_$_MediaTitle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? romaji = null,
    Object? english = null,
    Object? native = null,
  }) {
    return _then(_$_MediaTitle(
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
class _$_MediaTitle implements _MediaTitle {
  _$_MediaTitle(
      {@JsonKey(name: 'romaji') this.romaji = '',
      @JsonKey(name: 'english') this.english = '',
      @JsonKey(name: 'native') this.native = ''});

  factory _$_MediaTitle.fromJson(Map<String, dynamic> json) =>
      _$$_MediaTitleFromJson(json);

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
    return 'MediaTitle(romaji: $romaji, english: $english, native: $native)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaTitle &&
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
  _$$_MediaTitleCopyWith<_$_MediaTitle> get copyWith =>
      __$$_MediaTitleCopyWithImpl<_$_MediaTitle>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaTitleToJson(
      this,
    );
  }
}

abstract class _MediaTitle implements MediaTitle {
  factory _MediaTitle(
      {@JsonKey(name: 'romaji') final String romaji,
      @JsonKey(name: 'english') final String english,
      @JsonKey(name: 'native') final String native}) = _$_MediaTitle;

  factory _MediaTitle.fromJson(Map<String, dynamic> json) =
      _$_MediaTitle.fromJson;

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
  _$$_MediaTitleCopyWith<_$_MediaTitle> get copyWith =>
      throw _privateConstructorUsedError;
}
