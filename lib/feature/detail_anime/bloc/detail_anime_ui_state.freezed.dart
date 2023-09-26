// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_anime_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailAnimeUiState {
  dynamic get isLoading => throw _privateConstructorUsedError;
  AnimeModel? get detailAnimeModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailAnimeUiStateCopyWith<DetailAnimeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailAnimeUiStateCopyWith<$Res> {
  factory $DetailAnimeUiStateCopyWith(
          DetailAnimeUiState value, $Res Function(DetailAnimeUiState) then) =
      _$DetailAnimeUiStateCopyWithImpl<$Res, DetailAnimeUiState>;
  @useResult
  $Res call({dynamic isLoading, AnimeModel? detailAnimeModel});

  $AnimeModelCopyWith<$Res>? get detailAnimeModel;
}

/// @nodoc
class _$DetailAnimeUiStateCopyWithImpl<$Res, $Val extends DetailAnimeUiState>
    implements $DetailAnimeUiStateCopyWith<$Res> {
  _$DetailAnimeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? detailAnimeModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      detailAnimeModel: freezed == detailAnimeModel
          ? _value.detailAnimeModel
          : detailAnimeModel // ignore: cast_nullable_to_non_nullable
              as AnimeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnimeModelCopyWith<$Res>? get detailAnimeModel {
    if (_value.detailAnimeModel == null) {
      return null;
    }

    return $AnimeModelCopyWith<$Res>(_value.detailAnimeModel!, (value) {
      return _then(_value.copyWith(detailAnimeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DetailAnimeUiStateCopyWith<$Res>
    implements $DetailAnimeUiStateCopyWith<$Res> {
  factory _$$_DetailAnimeUiStateCopyWith(_$_DetailAnimeUiState value,
          $Res Function(_$_DetailAnimeUiState) then) =
      __$$_DetailAnimeUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic isLoading, AnimeModel? detailAnimeModel});

  @override
  $AnimeModelCopyWith<$Res>? get detailAnimeModel;
}

/// @nodoc
class __$$_DetailAnimeUiStateCopyWithImpl<$Res>
    extends _$DetailAnimeUiStateCopyWithImpl<$Res, _$_DetailAnimeUiState>
    implements _$$_DetailAnimeUiStateCopyWith<$Res> {
  __$$_DetailAnimeUiStateCopyWithImpl(
      _$_DetailAnimeUiState _value, $Res Function(_$_DetailAnimeUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? detailAnimeModel = freezed,
  }) {
    return _then(_$_DetailAnimeUiState(
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
      detailAnimeModel: freezed == detailAnimeModel
          ? _value.detailAnimeModel
          : detailAnimeModel // ignore: cast_nullable_to_non_nullable
              as AnimeModel?,
    ));
  }
}

/// @nodoc

class _$_DetailAnimeUiState implements _DetailAnimeUiState {
  _$_DetailAnimeUiState({this.isLoading = false, this.detailAnimeModel});

  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  final AnimeModel? detailAnimeModel;

  @override
  String toString() {
    return 'DetailAnimeUiState(isLoading: $isLoading, detailAnimeModel: $detailAnimeModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DetailAnimeUiState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            (identical(other.detailAnimeModel, detailAnimeModel) ||
                other.detailAnimeModel == detailAnimeModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(isLoading), detailAnimeModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DetailAnimeUiStateCopyWith<_$_DetailAnimeUiState> get copyWith =>
      __$$_DetailAnimeUiStateCopyWithImpl<_$_DetailAnimeUiState>(
          this, _$identity);
}

abstract class _DetailAnimeUiState implements DetailAnimeUiState {
  factory _DetailAnimeUiState(
      {final dynamic isLoading,
      final AnimeModel? detailAnimeModel}) = _$_DetailAnimeUiState;

  @override
  dynamic get isLoading;
  @override
  AnimeModel? get detailAnimeModel;
  @override
  @JsonKey(ignore: true)
  _$$_DetailAnimeUiStateCopyWith<_$_DetailAnimeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
