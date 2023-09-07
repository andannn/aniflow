// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeUiState {
  String get isShowSuggestionBoard => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeUiStateCopyWith<HomeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeUiStateCopyWith<$Res> {
  factory $HomeUiStateCopyWith(
          HomeUiState value, $Res Function(HomeUiState) then) =
      _$HomeUiStateCopyWithImpl<$Res, HomeUiState>;
  @useResult
  $Res call({String isShowSuggestionBoard});
}

/// @nodoc
class _$HomeUiStateCopyWithImpl<$Res, $Val extends HomeUiState>
    implements $HomeUiStateCopyWith<$Res> {
  _$HomeUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowSuggestionBoard = null,
  }) {
    return _then(_value.copyWith(
      isShowSuggestionBoard: null == isShowSuggestionBoard
          ? _value.isShowSuggestionBoard
          : isShowSuggestionBoard // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeUiStateCopyWith<$Res>
    implements $HomeUiStateCopyWith<$Res> {
  factory _$$_HomeUiStateCopyWith(
          _$_HomeUiState value, $Res Function(_$_HomeUiState) then) =
      __$$_HomeUiStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String isShowSuggestionBoard});
}

/// @nodoc
class __$$_HomeUiStateCopyWithImpl<$Res>
    extends _$HomeUiStateCopyWithImpl<$Res, _$_HomeUiState>
    implements _$$_HomeUiStateCopyWith<$Res> {
  __$$_HomeUiStateCopyWithImpl(
      _$_HomeUiState _value, $Res Function(_$_HomeUiState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isShowSuggestionBoard = null,
  }) {
    return _then(_$_HomeUiState(
      isShowSuggestionBoard: null == isShowSuggestionBoard
          ? _value.isShowSuggestionBoard
          : isShowSuggestionBoard // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_HomeUiState implements _HomeUiState {
  _$_HomeUiState({this.isShowSuggestionBoard = ''});

  @override
  @JsonKey()
  final String isShowSuggestionBoard;

  @override
  String toString() {
    return 'HomeUiState(isShowSuggestionBoard: $isShowSuggestionBoard)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeUiState &&
            (identical(other.isShowSuggestionBoard, isShowSuggestionBoard) ||
                other.isShowSuggestionBoard == isShowSuggestionBoard));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isShowSuggestionBoard);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeUiStateCopyWith<_$_HomeUiState> get copyWith =>
      __$$_HomeUiStateCopyWithImpl<_$_HomeUiState>(this, _$identity);
}

abstract class _HomeUiState implements HomeUiState {
  factory _HomeUiState({final String isShowSuggestionBoard}) = _$_HomeUiState;

  @override
  String get isShowSuggestionBoard;
  @override
  @JsonKey(ignore: true)
  _$$_HomeUiStateCopyWith<_$_HomeUiState> get copyWith =>
      throw _privateConstructorUsedError;
}
