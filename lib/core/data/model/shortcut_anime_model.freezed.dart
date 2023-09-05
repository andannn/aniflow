// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shortcut_anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShortcutAnimeModel {
  String get id => throw _privateConstructorUsedError;
  AnimeTitle? get title => throw _privateConstructorUsedError;
  String get coverImage => throw _privateConstructorUsedError;
  String get coverImageColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShortcutAnimeModelCopyWith<ShortcutAnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortcutAnimeModelCopyWith<$Res> {
  factory $ShortcutAnimeModelCopyWith(
          ShortcutAnimeModel value, $Res Function(ShortcutAnimeModel) then) =
      _$ShortcutAnimeModelCopyWithImpl<$Res, ShortcutAnimeModel>;
  @useResult
  $Res call(
      {String id,
      AnimeTitle? title,
      String coverImage,
      String coverImageColor});

  $AnimeTitleCopyWith<$Res>? get title;
}

/// @nodoc
class _$ShortcutAnimeModelCopyWithImpl<$Res, $Val extends ShortcutAnimeModel>
    implements $ShortcutAnimeModelCopyWith<$Res> {
  _$ShortcutAnimeModelCopyWithImpl(this._value, this._then);

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
    Object? coverImageColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageColor: null == coverImageColor
          ? _value.coverImageColor
          : coverImageColor // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_ShortcutAnimeModelCopyWith<$Res>
    implements $ShortcutAnimeModelCopyWith<$Res> {
  factory _$$_ShortcutAnimeModelCopyWith(_$_ShortcutAnimeModel value,
          $Res Function(_$_ShortcutAnimeModel) then) =
      __$$_ShortcutAnimeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnimeTitle? title,
      String coverImage,
      String coverImageColor});

  @override
  $AnimeTitleCopyWith<$Res>? get title;
}

/// @nodoc
class __$$_ShortcutAnimeModelCopyWithImpl<$Res>
    extends _$ShortcutAnimeModelCopyWithImpl<$Res, _$_ShortcutAnimeModel>
    implements _$$_ShortcutAnimeModelCopyWith<$Res> {
  __$$_ShortcutAnimeModelCopyWithImpl(
      _$_ShortcutAnimeModel _value, $Res Function(_$_ShortcutAnimeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = freezed,
    Object? coverImage = null,
    Object? coverImageColor = null,
  }) {
    return _then(_$_ShortcutAnimeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as AnimeTitle?,
      coverImage: null == coverImage
          ? _value.coverImage
          : coverImage // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageColor: null == coverImageColor
          ? _value.coverImageColor
          : coverImageColor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ShortcutAnimeModel implements _ShortcutAnimeModel {
  _$_ShortcutAnimeModel(
      {this.id = '',
      this.title,
      this.coverImage = '',
      this.coverImageColor = ''});

  @override
  @JsonKey()
  final String id;
  @override
  final AnimeTitle? title;
  @override
  @JsonKey()
  final String coverImage;
  @override
  @JsonKey()
  final String coverImageColor;

  @override
  String toString() {
    return 'ShortcutAnimeModel(id: $id, title: $title, coverImage: $coverImage, coverImageColor: $coverImageColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortcutAnimeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.coverImageColor, coverImageColor) ||
                other.coverImageColor == coverImageColor));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, coverImage, coverImageColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortcutAnimeModelCopyWith<_$_ShortcutAnimeModel> get copyWith =>
      __$$_ShortcutAnimeModelCopyWithImpl<_$_ShortcutAnimeModel>(
          this, _$identity);
}

abstract class _ShortcutAnimeModel implements ShortcutAnimeModel {
  factory _ShortcutAnimeModel(
      {final String id,
      final AnimeTitle? title,
      final String coverImage,
      final String coverImageColor}) = _$_ShortcutAnimeModel;

  @override
  String get id;
  @override
  AnimeTitle? get title;
  @override
  String get coverImage;
  @override
  String get coverImageColor;
  @override
  @JsonKey(ignore: true)
  _$$_ShortcutAnimeModelCopyWith<_$_ShortcutAnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
