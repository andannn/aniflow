// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'short_network_anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShortNetworkAnime _$ShortNetworkAnimeFromJson(Map<String, dynamic> json) {
  return _ShortNetworkAnime.fromJson(json);
}

/// @nodoc
mixin _$ShortNetworkAnime {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  AnimeTitle? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'coverImage')
  Map<String, String> get coverImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortNetworkAnimeCopyWith<ShortNetworkAnime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortNetworkAnimeCopyWith<$Res> {
  factory $ShortNetworkAnimeCopyWith(
          ShortNetworkAnime value, $Res Function(ShortNetworkAnime) then) =
      _$ShortNetworkAnimeCopyWithImpl<$Res, ShortNetworkAnime>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') AnimeTitle? title,
      @JsonKey(name: 'coverImage') Map<String, String> coverImage});

  $AnimeTitleCopyWith<$Res>? get title;
}

/// @nodoc
class _$ShortNetworkAnimeCopyWithImpl<$Res, $Val extends ShortNetworkAnime>
    implements $ShortNetworkAnimeCopyWith<$Res> {
  _$ShortNetworkAnimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? coverImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeTitleCopyWith<$Res>? get title {
    if (_value.title == null) {
      return null;
    }

    return $AnimeTitleCopyWith<$Res>(_value.title!, (value) {
      return _then(_value.copyWith(title: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ShortNetworkAnimeCopyWith<$Res>
    implements $ShortNetworkAnimeCopyWith<$Res> {
  factory _$$_ShortNetworkAnimeCopyWith(_$_ShortNetworkAnime value,
          $Res Function(_$_ShortNetworkAnime) then) =
      __$$_ShortNetworkAnimeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') AnimeTitle? title,
      @JsonKey(name: 'coverImage') Map<String, String> coverImage});

  @override
  $AnimeTitleCopyWith<$Res>? get title;
}

/// @nodoc
class __$$_ShortNetworkAnimeCopyWithImpl<$Res>
    extends _$ShortNetworkAnimeCopyWithImpl<$Res, _$_ShortNetworkAnime>
    implements _$$_ShortNetworkAnimeCopyWith<$Res> {
  __$$_ShortNetworkAnimeCopyWithImpl(
      _$_ShortNetworkAnime _value, $Res Function(_$_ShortNetworkAnime) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? coverImage = null,
  }) {
    return _then(_$_ShortNetworkAnime(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
      coverImage: null == coverImage
          ? _value._coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortNetworkAnime implements _ShortNetworkAnime {
  _$_ShortNetworkAnime(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'coverImage')
      final Map<String, String> coverImage = const {}})
      : _coverImage = coverImage;

  factory _$_ShortNetworkAnime.fromJson(Map<String, dynamic> json) =>
      _$$_ShortNetworkAnimeFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final AnimeTitle? title;
  final Map<String, String> _coverImage;
  @override
  @JsonKey(name: 'coverImage')
  Map<String, String> get coverImage {
    if (_coverImage is EqualUnmodifiableMapView) return _coverImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_coverImage);
  }

  @override
  String toString() {
    return 'ShortNetworkAnime(id: $id, title: $title, coverImage: $coverImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortNetworkAnime &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._coverImage, _coverImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, const DeepCollectionEquality().hash(_coverImage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortNetworkAnimeCopyWith<_$_ShortNetworkAnime> get copyWith =>
      __$$_ShortNetworkAnimeCopyWithImpl<_$_ShortNetworkAnime>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortNetworkAnimeToJson(
      this,
    );
  }
}

abstract class _ShortNetworkAnime implements ShortNetworkAnime {
  factory _ShortNetworkAnime(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'title') final AnimeTitle? title,
          @JsonKey(name: 'coverImage') final Map<String, String> coverImage}) =
      _$_ShortNetworkAnime;

  factory _ShortNetworkAnime.fromJson(Map<String, dynamic> json) =
      _$_ShortNetworkAnime.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  AnimeTitle? get title;
  @override
  @JsonKey(name: 'coverImage')
  Map<String, String> get coverImage;
  @override
  @JsonKey(ignore: true)
  _$$_ShortNetworkAnimeCopyWith<_$_ShortNetworkAnime> get copyWith =>
      throw _privateConstructorUsedError;
}
