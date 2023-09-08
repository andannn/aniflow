// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscoverUiState {
  String get isShowSuggestionBoard => throw _privateConstructorUsedError;
  PagingState<List<ShortcutAnimeModel>> get currentSeasonAnimePagingState =>
      throw _privateConstructorUsedError;
  PagingState<List<ShortcutAnimeModel>> get nextSeasonAnimePagingState =>
      throw _privateConstructorUsedError;
  PagingState<List<ShortcutAnimeModel>> get trendingAnimePagingState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverUiStateCopyWith<DiscoverUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverUiStateCopyWith<$Res> {
  factory $DiscoverUiStateCopyWith(
          DiscoverUiState value, $Res Function(DiscoverUiState) then) =
      _$DiscoverUiStateCopyWithImpl<$Res, DiscoverUiState>;
  @useResult
  $Res call(
      {String isShowSuggestionBoard,
      PagingState<List<ShortcutAnimeModel>> currentSeasonAnimePagingState,
      PagingState<List<ShortcutAnimeModel>> nextSeasonAnimePagingState,
      PagingState<List<ShortcutAnimeModel>> trendingAnimePagingState});
}

/// @nodoc
class _$DiscoverUiStateCopyWithImpl<$Res, $Val extends DiscoverUiState>
    implements $DiscoverUiStateCopyWith<$Res> {
  _$DiscoverUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowSuggestionBoard = null,
    Object? currentSeasonAnimePagingState = null,
    Object? nextSeasonAnimePagingState = null,
    Object? trendingAnimePagingState = null,
  }) {
    return _then(_value.copyWith(
      isShowSuggestionBoard: null == isShowSuggestionBoard
          ? _value.isShowSuggestionBoard
          : isShowSuggestionBoard // ignore: cast_nullable_to_non_nullable
              as String,
      currentSeasonAnimePagingState: null == currentSeasonAnimePagingState
          ? _value.currentSeasonAnimePagingState
          : currentSeasonAnimePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortcutAnimeModel>>,
      nextSeasonAnimePagingState: null == nextSeasonAnimePagingState
          ? _value.nextSeasonAnimePagingState
          : nextSeasonAnimePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortcutAnimeModel>>,
      trendingAnimePagingState: null == trendingAnimePagingState
          ? _value.trendingAnimePagingState
          : trendingAnimePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortcutAnimeModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscoverUiStateCopyWith<$Res>
    implements $DiscoverUiStateCopyWith<$Res> {
  factory _$$_DiscoverUiStateCopyWith(
          _$_DiscoverUiState value, $Res Function(_$_DiscoverUiState) then) =
      __$$_DiscoverUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String isShowSuggestionBoard,
      PagingState<List<ShortcutAnimeModel>> currentSeasonAnimePagingState,
      PagingState<List<ShortcutAnimeModel>> nextSeasonAnimePagingState,
      PagingState<List<ShortcutAnimeModel>> trendingAnimePagingState});
}

/// @nodoc
class __$$_DiscoverUiStateCopyWithImpl<$Res>
    extends _$DiscoverUiStateCopyWithImpl<$Res, _$_DiscoverUiState>
    implements _$$_DiscoverUiStateCopyWith<$Res> {
  __$$_DiscoverUiStateCopyWithImpl(
      _$_DiscoverUiState _value, $Res Function(_$_DiscoverUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowSuggestionBoard = null,
    Object? currentSeasonAnimePagingState = null,
    Object? nextSeasonAnimePagingState = null,
    Object? trendingAnimePagingState = null,
  }) {
    return _then(_$_DiscoverUiState(
      isShowSuggestionBoard: null == isShowSuggestionBoard
          ? _value.isShowSuggestionBoard
          : isShowSuggestionBoard // ignore: cast_nullable_to_non_nullable
              as String,
      currentSeasonAnimePagingState: null == currentSeasonAnimePagingState
          ? _value.currentSeasonAnimePagingState
          : currentSeasonAnimePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortcutAnimeModel>>,
      nextSeasonAnimePagingState: null == nextSeasonAnimePagingState
          ? _value.nextSeasonAnimePagingState
          : nextSeasonAnimePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortcutAnimeModel>>,
      trendingAnimePagingState: null == trendingAnimePagingState
          ? _value.trendingAnimePagingState
          : trendingAnimePagingState // ignore: cast_nullable_to_non_nullable
              as PagingState<List<ShortcutAnimeModel>>,
    ));
  }
}

/// @nodoc

class _$_DiscoverUiState implements _DiscoverUiState {
  _$_DiscoverUiState(
      {this.isShowSuggestionBoard = '',
      this.currentSeasonAnimePagingState = const PageLoading(data: [], page: 1),
      this.nextSeasonAnimePagingState = const PageLoading(data: [], page: 1),
      this.trendingAnimePagingState = const PageLoading(data: [], page: 1)});

  @override
  @JsonKey()
  final String isShowSuggestionBoard;
  @override
  @JsonKey()
  final PagingState<List<ShortcutAnimeModel>> currentSeasonAnimePagingState;
  @override
  @JsonKey()
  final PagingState<List<ShortcutAnimeModel>> nextSeasonAnimePagingState;
  @override
  @JsonKey()
  final PagingState<List<ShortcutAnimeModel>> trendingAnimePagingState;

  @override
  String toString() {
    return 'DiscoverUiState(isShowSuggestionBoard: $isShowSuggestionBoard, currentSeasonAnimePagingState: $currentSeasonAnimePagingState, nextSeasonAnimePagingState: $nextSeasonAnimePagingState, trendingAnimePagingState: $trendingAnimePagingState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscoverUiState &&
            (identical(other.isShowSuggestionBoard, isShowSuggestionBoard) ||
                other.isShowSuggestionBoard == isShowSuggestionBoard) &&
            (identical(other.currentSeasonAnimePagingState,
                    currentSeasonAnimePagingState) ||
                other.currentSeasonAnimePagingState ==
                    currentSeasonAnimePagingState) &&
            (identical(other.nextSeasonAnimePagingState,
                    nextSeasonAnimePagingState) ||
                other.nextSeasonAnimePagingState ==
                    nextSeasonAnimePagingState) &&
            (identical(
                    other.trendingAnimePagingState, trendingAnimePagingState) ||
                other.trendingAnimePagingState == trendingAnimePagingState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isShowSuggestionBoard,
      currentSeasonAnimePagingState,
      nextSeasonAnimePagingState,
      trendingAnimePagingState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscoverUiStateCopyWith<_$_DiscoverUiState> get copyWith =>
      __$$_DiscoverUiStateCopyWithImpl<_$_DiscoverUiState>(this, _$identity);
}

abstract class _DiscoverUiState implements DiscoverUiState {
  factory _DiscoverUiState(
      {final String isShowSuggestionBoard,
      final PagingState<List<ShortcutAnimeModel>> currentSeasonAnimePagingState,
      final PagingState<List<ShortcutAnimeModel>> nextSeasonAnimePagingState,
      final PagingState<List<ShortcutAnimeModel>>
          trendingAnimePagingState}) = _$_DiscoverUiState;

  @override
  String get isShowSuggestionBoard;
  @override
  PagingState<List<ShortcutAnimeModel>> get currentSeasonAnimePagingState;
  @override
  PagingState<List<ShortcutAnimeModel>> get nextSeasonAnimePagingState;
  @override
  PagingState<List<ShortcutAnimeModel>> get trendingAnimePagingState;
  @override
  @JsonKey(ignore: true)
  _$$_DiscoverUiStateCopyWith<_$_DiscoverUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
