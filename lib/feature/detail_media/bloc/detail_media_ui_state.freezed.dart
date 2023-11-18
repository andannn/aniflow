// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_media_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailMediaUiState {
  dynamic get isLoading => throw _privateConstructorUsedError;
  MediaModel? get detailAnimeModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailMediaUiStateCopyWith<DetailMediaUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailMediaUiStateCopyWith<$Res> {
  factory $DetailMediaUiStateCopyWith(
          DetailMediaUiState value, $Res Function(DetailMediaUiState) then) =
      _$DetailMediaUiStateCopyWithImpl<$Res, DetailMediaUiState>;
  @useResult
  $Res call({dynamic isLoading, MediaModel? detailAnimeModel});

  $MediaModelCopyWith<$Res>? get detailAnimeModel;
}

/// @nodoc
class _$DetailMediaUiStateCopyWithImpl<$Res, $Val extends DetailMediaUiState>
    implements $DetailMediaUiStateCopyWith<$Res> {
  _$DetailMediaUiStateCopyWithImpl(this._value, this._then);

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
              as MediaModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaModelCopyWith<$Res>? get detailAnimeModel {
    if (_value.detailAnimeModel == null) {
      return null;
    }

    return $MediaModelCopyWith<$Res>(_value.detailAnimeModel!, (value) {
      return _then(_value.copyWith(detailAnimeModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailMediaUiStateImplCopyWith<$Res>
    implements $DetailMediaUiStateCopyWith<$Res> {
  factory _$$DetailMediaUiStateImplCopyWith(_$DetailMediaUiStateImpl value,
          $Res Function(_$DetailMediaUiStateImpl) then) =
      __$$DetailMediaUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic isLoading, MediaModel? detailAnimeModel});

  @override
  $MediaModelCopyWith<$Res>? get detailAnimeModel;
}

/// @nodoc
class __$$DetailMediaUiStateImplCopyWithImpl<$Res>
    extends _$DetailMediaUiStateCopyWithImpl<$Res, _$DetailMediaUiStateImpl>
    implements _$$DetailMediaUiStateImplCopyWith<$Res> {
  __$$DetailMediaUiStateImplCopyWithImpl(_$DetailMediaUiStateImpl _value,
      $Res Function(_$DetailMediaUiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? detailAnimeModel = freezed,
  }) {
    return _then(_$DetailMediaUiStateImpl(
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
      detailAnimeModel: freezed == detailAnimeModel
          ? _value.detailAnimeModel
          : detailAnimeModel // ignore: cast_nullable_to_non_nullable
              as MediaModel?,
    ));
  }
}

/// @nodoc

class _$DetailMediaUiStateImpl implements _DetailMediaUiState {
  _$DetailMediaUiStateImpl({this.isLoading = false, this.detailAnimeModel});

  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  final MediaModel? detailAnimeModel;

  @override
  String toString() {
    return 'DetailMediaUiState(isLoading: $isLoading, detailAnimeModel: $detailAnimeModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailMediaUiStateImpl &&
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
  _$$DetailMediaUiStateImplCopyWith<_$DetailMediaUiStateImpl> get copyWith =>
      __$$DetailMediaUiStateImplCopyWithImpl<_$DetailMediaUiStateImpl>(
          this, _$identity);
}

abstract class _DetailMediaUiState implements DetailMediaUiState {
  factory _DetailMediaUiState(
      {final dynamic isLoading,
      final MediaModel? detailAnimeModel}) = _$DetailMediaUiStateImpl;

  @override
  dynamic get isLoading;
  @override
  MediaModel? get detailAnimeModel;
  @override
  @JsonKey(ignore: true)
  _$$DetailMediaUiStateImplCopyWith<_$DetailMediaUiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
