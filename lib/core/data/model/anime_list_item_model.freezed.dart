// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_list_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MediaListItemModel {
  String get id => throw _privateConstructorUsedError;
  MediaListStatus? get status => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  int? get progress => throw _privateConstructorUsedError;
  MediaModel? get animeModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MediaListItemModelCopyWith<MediaListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaListItemModelCopyWith<$Res> {
  factory $MediaListItemModelCopyWith(
          MediaListItemModel value, $Res Function(MediaListItemModel) then) =
      _$MediaListItemModelCopyWithImpl<$Res, MediaListItemModel>;
  @useResult
  $Res call(
      {String id,
      MediaListStatus? status,
      int? score,
      int? updatedAt,
      int? progress,
      MediaModel? animeModel});

  $MediaModelCopyWith<$Res>? get animeModel;
}

/// @nodoc
class _$MediaListItemModelCopyWithImpl<$Res, $Val extends MediaListItemModel>
    implements $MediaListItemModelCopyWith<$Res> {
  _$MediaListItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
    Object? progress = freezed,
    Object? animeModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      animeModel: freezed == animeModel
          ? _value.animeModel
          : animeModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaModelCopyWith<$Res>? get animeModel {
    if (_value.animeModel == null) {
      return null;
    }

    return $MediaModelCopyWith<$Res>(_value.animeModel!, (value) {
      return _then(_value.copyWith(animeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MediaListItemModelCopyWith<$Res>
    implements $MediaListItemModelCopyWith<$Res> {
  factory _$$_MediaListItemModelCopyWith(_$_MediaListItemModel value,
          $Res Function(_$_MediaListItemModel) then) =
      __$$_MediaListItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      MediaListStatus? status,
      int? score,
      int? updatedAt,
      int? progress,
      MediaModel? animeModel});

  @override
  $MediaModelCopyWith<$Res>? get animeModel;
}

/// @nodoc
class __$$_MediaListItemModelCopyWithImpl<$Res>
    extends _$MediaListItemModelCopyWithImpl<$Res, _$_MediaListItemModel>
    implements _$$_MediaListItemModelCopyWith<$Res> {
  __$$_MediaListItemModelCopyWithImpl(
      _$_MediaListItemModel _value, $Res Function(_$_MediaListItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
    Object? progress = freezed,
    Object? animeModel = freezed,
  }) {
    return _then(_$_MediaListItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MediaListStatus?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as int?,
      animeModel: freezed == animeModel
          ? _value.animeModel
          : animeModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
    ));
  }
}

/// @nodoc

class _$_MediaListItemModel implements _MediaListItemModel {
  _$_MediaListItemModel(
      {this.id = '',
      this.status,
      this.score,
      this.updatedAt,
      this.progress,
      this.animeModel});

  @override
  @JsonKey()
  final String id;
  @override
  final MediaListStatus? status;
  @override
  final int? score;
  @override
  final int? updatedAt;
  @override
  final int? progress;
  @override
  final MediaModel? animeModel;

  @override
  String toString() {
    return 'MediaListItemModel(id: $id, status: $status, score: $score, updatedAt: $updatedAt, progress: $progress, animeModel: $animeModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaListItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.animeModel, animeModel) ||
                other.animeModel == animeModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, status, score, updatedAt, progress, animeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaListItemModelCopyWith<_$_MediaListItemModel> get copyWith =>
      __$$_MediaListItemModelCopyWithImpl<_$_MediaListItemModel>(
          this, _$identity);
}

abstract class _MediaListItemModel implements MediaListItemModel {
  factory _MediaListItemModel(
      {final String id,
      final MediaListStatus? status,
      final int? score,
      final int? updatedAt,
      final int? progress,
      final MediaModel? animeModel}) = _$_MediaListItemModel;

  @override
  String get id;
  @override
  MediaListStatus? get status;
  @override
  int? get score;
  @override
  int? get updatedAt;
  @override
  int? get progress;
  @override
  MediaModel? get animeModel;
  @override
  @JsonKey(ignore: true)
  _$$_MediaListItemModelCopyWith<_$_MediaListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
