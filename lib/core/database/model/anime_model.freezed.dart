// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) {
  return _AnimeModel.fromJson(json);
}

/// @nodoc
mixin _$AnimeModel {
  @JsonKey(name: AnimeTableColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.englishTitle)
  String get englishTitle => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.romajiTitle)
  String get romajiTitle => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.nativeTitle)
  String get nativeTitle => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.coverImage)
  String get coverImage => throw _privateConstructorUsedError;
  @JsonKey(name: AnimeTableColumns.coverImageColor)
  String get coverImageColor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeModelCopyWith<AnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeModelCopyWith<$Res> {
  factory $AnimeModelCopyWith(
          AnimeModel value, $Res Function(AnimeModel) then) =
      _$AnimeModelCopyWithImpl<$Res, AnimeModel>;
  @useResult
  $Res call(
      {@JsonKey(name: AnimeTableColumns.id) String id,
      @JsonKey(name: AnimeTableColumns.englishTitle) String englishTitle,
      @JsonKey(name: AnimeTableColumns.romajiTitle) String romajiTitle,
      @JsonKey(name: AnimeTableColumns.nativeTitle) String nativeTitle,
      @JsonKey(name: AnimeTableColumns.coverImage) String coverImage,
      @JsonKey(name: AnimeTableColumns.coverImageColor)
      String coverImageColor});
}

/// @nodoc
class _$AnimeModelCopyWithImpl<$Res, $Val extends AnimeModel>
    implements $AnimeModelCopyWith<$Res> {
  _$AnimeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? englishTitle = null,
    Object? romajiTitle = null,
    Object? nativeTitle = null,
    Object? coverImage = null,
    Object? coverImageColor = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      englishTitle: null == englishTitle
          ? _value.englishTitle
          : englishTitle // ignore: cast_nullable_to_non_nullable
              as String,
      romajiTitle: null == romajiTitle
          ? _value.romajiTitle
          : romajiTitle // ignore: cast_nullable_to_non_nullable
              as String,
      nativeTitle: null == nativeTitle
          ? _value.nativeTitle
          : nativeTitle // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$_AnimeModelCopyWith<$Res>
    implements $AnimeModelCopyWith<$Res> {
  factory _$$_AnimeModelCopyWith(
          _$_AnimeModel value, $Res Function(_$_AnimeModel) then) =
      __$$_AnimeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: AnimeTableColumns.id) String id,
      @JsonKey(name: AnimeTableColumns.englishTitle) String englishTitle,
      @JsonKey(name: AnimeTableColumns.romajiTitle) String romajiTitle,
      @JsonKey(name: AnimeTableColumns.nativeTitle) String nativeTitle,
      @JsonKey(name: AnimeTableColumns.coverImage) String coverImage,
      @JsonKey(name: AnimeTableColumns.coverImageColor)
      String coverImageColor});
}

/// @nodoc
class __$$_AnimeModelCopyWithImpl<$Res>
    extends _$AnimeModelCopyWithImpl<$Res, _$_AnimeModel>
    implements _$$_AnimeModelCopyWith<$Res> {
  __$$_AnimeModelCopyWithImpl(
      _$_AnimeModel _value, $Res Function(_$_AnimeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? englishTitle = null,
    Object? romajiTitle = null,
    Object? nativeTitle = null,
    Object? coverImage = null,
    Object? coverImageColor = null,
  }) {
    return _then(_$_AnimeModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      englishTitle: null == englishTitle
          ? _value.englishTitle
          : englishTitle // ignore: cast_nullable_to_non_nullable
              as String,
      romajiTitle: null == romajiTitle
          ? _value.romajiTitle
          : romajiTitle // ignore: cast_nullable_to_non_nullable
              as String,
      nativeTitle: null == nativeTitle
          ? _value.nativeTitle
          : nativeTitle // ignore: cast_nullable_to_non_nullable
              as String,
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
@JsonSerializable()
class _$_AnimeModel implements _AnimeModel {
  _$_AnimeModel(
      {@JsonKey(name: AnimeTableColumns.id) this.id = '',
      @JsonKey(name: AnimeTableColumns.englishTitle) this.englishTitle = '',
      @JsonKey(name: AnimeTableColumns.romajiTitle) this.romajiTitle = '',
      @JsonKey(name: AnimeTableColumns.nativeTitle) this.nativeTitle = '',
      @JsonKey(name: AnimeTableColumns.coverImage) this.coverImage = '',
      @JsonKey(name: AnimeTableColumns.coverImageColor)
      this.coverImageColor = ''});

  factory _$_AnimeModel.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeModelFromJson(json);

  @override
  @JsonKey(name: AnimeTableColumns.id)
  final String id;
  @override
  @JsonKey(name: AnimeTableColumns.englishTitle)
  final String englishTitle;
  @override
  @JsonKey(name: AnimeTableColumns.romajiTitle)
  final String romajiTitle;
  @override
  @JsonKey(name: AnimeTableColumns.nativeTitle)
  final String nativeTitle;
  @override
  @JsonKey(name: AnimeTableColumns.coverImage)
  final String coverImage;
  @override
  @JsonKey(name: AnimeTableColumns.coverImageColor)
  final String coverImageColor;

  @override
  String toString() {
    return 'AnimeModel(id: $id, englishTitle: $englishTitle, romajiTitle: $romajiTitle, nativeTitle: $nativeTitle, coverImage: $coverImage, coverImageColor: $coverImageColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.englishTitle, englishTitle) ||
                other.englishTitle == englishTitle) &&
            (identical(other.romajiTitle, romajiTitle) ||
                other.romajiTitle == romajiTitle) &&
            (identical(other.nativeTitle, nativeTitle) ||
                other.nativeTitle == nativeTitle) &&
            (identical(other.coverImage, coverImage) ||
                other.coverImage == coverImage) &&
            (identical(other.coverImageColor, coverImageColor) ||
                other.coverImageColor == coverImageColor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, englishTitle, romajiTitle,
      nativeTitle, coverImage, coverImageColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeModelCopyWith<_$_AnimeModel> get copyWith =>
      __$$_AnimeModelCopyWithImpl<_$_AnimeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimeModelToJson(
      this,
    );
  }
}

abstract class _AnimeModel implements AnimeModel {
  factory _AnimeModel(
      {@JsonKey(name: AnimeTableColumns.id) final String id,
      @JsonKey(name: AnimeTableColumns.englishTitle) final String englishTitle,
      @JsonKey(name: AnimeTableColumns.romajiTitle) final String romajiTitle,
      @JsonKey(name: AnimeTableColumns.nativeTitle) final String nativeTitle,
      @JsonKey(name: AnimeTableColumns.coverImage) final String coverImage,
      @JsonKey(name: AnimeTableColumns.coverImageColor)
      final String coverImageColor}) = _$_AnimeModel;

  factory _AnimeModel.fromJson(Map<String, dynamic> json) =
      _$_AnimeModel.fromJson;

  @override
  @JsonKey(name: AnimeTableColumns.id)
  String get id;
  @override
  @JsonKey(name: AnimeTableColumns.englishTitle)
  String get englishTitle;
  @override
  @JsonKey(name: AnimeTableColumns.romajiTitle)
  String get romajiTitle;
  @override
  @JsonKey(name: AnimeTableColumns.nativeTitle)
  String get nativeTitle;
  @override
  @JsonKey(name: AnimeTableColumns.coverImage)
  String get coverImage;
  @override
  @JsonKey(name: AnimeTableColumns.coverImageColor)
  String get coverImageColor;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeModelCopyWith<_$_AnimeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
