// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AnimeListState {
  PagingState<List<ShortAnimeModel>> get animePagingState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimeListStateCopyWith<AnimeListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeListStateCopyWith<$Res> {
  factory $AnimeListStateCopyWith(
          AnimeListState value, $Res Function(AnimeListState) then) =
      _$AnimeListStateCopyWithImpl<$Res, AnimeListState>;
  @useResult
  $Res call({PagingState<List<ShortAnimeModel>> animePagingState});
}

/// @nodoc
class _$AnimeListStateCopyWithImpl<$Res, $Val extends AnimeListState>
    implements $AnimeListStateCopyWith<$Res> {
  _$AnimeListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animePagingState = null,
  }) {
    return _then(_value.copyWith(
      animePagingState: null == animePagingState
          ? _value.animePagingState
          : animePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortAnimeModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimeListStateCopyWith<$Res>
    implements $AnimeListStateCopyWith<$Res> {
  factory _$$_AnimeListStateCopyWith(
          _$_AnimeListState value, $Res Function(_$_AnimeListState) then) =
      __$$_AnimeListStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PagingState<List<ShortAnimeModel>> animePagingState});
}

/// @nodoc
class __$$_AnimeListStateCopyWithImpl<$Res>
    extends _$AnimeListStateCopyWithImpl<$Res, _$_AnimeListState>
    implements _$$_AnimeListStateCopyWith<$Res> {
  __$$_AnimeListStateCopyWithImpl(
      _$_AnimeListState _value, $Res Function(_$_AnimeListState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? animePagingState = null,
  }) {
    return _then(_$_AnimeListState(
      animePagingState: null == animePagingState
          ? _value.animePagingState
          : animePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortAnimeModel>>,
    ));
  }
}

/// @nodoc

class _$_AnimeListState implements _AnimeListState {
  _$_AnimeListState(
      {this.animePagingState = const PageLoading(data: [], page: 1)});

  @override
  @JsonKey()
  final PagingState<List<ShortAnimeModel>> animePagingState;

  @override
  String toString() {
    return 'AnimeListState(animePagingState: $animePagingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeListState &&
            (identical(other.animePagingState, animePagingState) ||
                other.animePagingState == animePagingState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, animePagingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeListStateCopyWith<_$_AnimeListState> get copyWith =>
      __$$_AnimeListStateCopyWithImpl<_$_AnimeListState>(this, _$identity);
}

abstract class _AnimeListState implements AnimeListState {
  factory _AnimeListState(
          {final PagingState<List<ShortAnimeModel>> animePagingState}) =
      _$_AnimeListState;

  @override
  PagingState<List<ShortAnimeModel>> get animePagingState;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeListStateCopyWith<_$_AnimeListState> get copyWith =>
      throw _privateConstructorUsedError;
}
