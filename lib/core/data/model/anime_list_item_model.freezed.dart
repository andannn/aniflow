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
mixin _$AnimeListItemModel {
  String get id => throw _privateConstructorUsedError;
  AnimeListStatus? get status => throw _privateConstructorUsedError;
  int? get score => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  ShortAnimeModel? get animeModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeListItemModelCopyWith<AnimeListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeListItemModelCopyWith<$Res> {
  factory $AnimeListItemModelCopyWith(
          AnimeListItemModel value, $Res Function(AnimeListItemModel) then) =
      _$AnimeListItemModelCopyWithImpl<$Res, AnimeListItemModel>;
  @useResult
  $Res call(
      {String id,
      AnimeListStatus? status,
      int? score,
      int? updatedAt,
      ShortAnimeModel? animeModel});

  $ShortAnimeModelCopyWith<$Res>? get animeModel;
}

/// @nodoc
class _$AnimeListItemModelCopyWithImpl<$Res, $Val extends AnimeListItemModel>
    implements $AnimeListItemModelCopyWith<$Res> {
  _$AnimeListItemModelCopyWithImpl(this._value, this._then);

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
              as AnimeListStatus?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      animeModel: freezed == animeModel
          ? _value.animeModel
          : animeModel // ignore: cast_nullable_to_non_nullable
              as ShortAnimeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ShortAnimeModelCopyWith<$Res>? get animeModel {
    if (_value.animeModel == null) {
      return null;
    }

    return $ShortAnimeModelCopyWith<$Res>(_value.animeModel!, (value) {
      return _then(_value.copyWith(animeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AnimeListItemModelCopyWith<$Res>
    implements $AnimeListItemModelCopyWith<$Res> {
  factory _$$_AnimeListItemModelCopyWith(_$_AnimeListItemModel value,
          $Res Function(_$_AnimeListItemModel) then) =
      __$$_AnimeListItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      AnimeListStatus? status,
      int? score,
      int? updatedAt,
      ShortAnimeModel? animeModel});

  @override
  $ShortAnimeModelCopyWith<$Res>? get animeModel;
}

/// @nodoc
class __$$_AnimeListItemModelCopyWithImpl<$Res>
    extends _$AnimeListItemModelCopyWithImpl<$Res, _$_AnimeListItemModel>
    implements _$$_AnimeListItemModelCopyWith<$Res> {
  __$$_AnimeListItemModelCopyWithImpl(
      _$_AnimeListItemModel _value, $Res Function(_$_AnimeListItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? score = freezed,
    Object? updatedAt = freezed,
    Object? animeModel = freezed,
  }) {
    return _then(_$_AnimeListItemModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AnimeListStatus?,
      score: freezed == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      animeModel: freezed == animeModel
          ? _value.animeModel
          : animeModel // ignore: cast_nullable_to_non_nullable
              as ShortAnimeModel?,
    ));
  }
}

/// @nodoc

class _$_AnimeListItemModel implements _AnimeListItemModel {
  _$_AnimeListItemModel(
      {this.id = '', this.status, this.score, this.updatedAt, this.animeModel});

  @override
  @JsonKey()
  final String id;
  @override
  final AnimeListStatus? status;
  @override
  final int? score;
  @override
  final int? updatedAt;
  @override
  final ShortAnimeModel? animeModel;

  @override
  String toString() {
    return 'AnimeListItemModel(id: $id, status: $status, score: $score, updatedAt: $updatedAt, animeModel: $animeModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeListItemModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.animeModel, animeModel) ||
                other.animeModel == animeModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, status, score, updatedAt, animeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeListItemModelCopyWith<_$_AnimeListItemModel> get copyWith =>
      __$$_AnimeListItemModelCopyWithImpl<_$_AnimeListItemModel>(
          this, _$identity);
}

abstract class _AnimeListItemModel implements AnimeListItemModel {
  factory _AnimeListItemModel(
      {final String id,
      final AnimeListStatus? status,
      final int? score,
      final int? updatedAt,
      final ShortAnimeModel? animeModel}) = _$_AnimeListItemModel;

  @override
  String get id;
  @override
  AnimeListStatus? get status;
  @override
  int? get score;
  @override
  int? get updatedAt;
  @override
  ShortAnimeModel? get animeModel;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeListItemModelCopyWith<_$_AnimeListItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
