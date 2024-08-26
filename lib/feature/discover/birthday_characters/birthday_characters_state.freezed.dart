// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'birthday_characters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BirthdayCharactersState {
  List<CharacterModel> get data => throw _privateConstructorUsedError;

  /// Create a copy of BirthdayCharactersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BirthdayCharactersStateCopyWith<BirthdayCharactersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BirthdayCharactersStateCopyWith<$Res> {
  factory $BirthdayCharactersStateCopyWith(BirthdayCharactersState value,
          $Res Function(BirthdayCharactersState) then) =
      _$BirthdayCharactersStateCopyWithImpl<$Res, BirthdayCharactersState>;
  @useResult
  $Res call({List<CharacterModel> data});
}

/// @nodoc
class _$BirthdayCharactersStateCopyWithImpl<$Res,
        $Val extends BirthdayCharactersState>
    implements $BirthdayCharactersStateCopyWith<$Res> {
  _$BirthdayCharactersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BirthdayCharactersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BirthdayCharactersStateImplCopyWith<$Res>
    implements $BirthdayCharactersStateCopyWith<$Res> {
  factory _$$BirthdayCharactersStateImplCopyWith(
          _$BirthdayCharactersStateImpl value,
          $Res Function(_$BirthdayCharactersStateImpl) then) =
      __$$BirthdayCharactersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CharacterModel> data});
}

/// @nodoc
class __$$BirthdayCharactersStateImplCopyWithImpl<$Res>
    extends _$BirthdayCharactersStateCopyWithImpl<$Res,
        _$BirthdayCharactersStateImpl>
    implements _$$BirthdayCharactersStateImplCopyWith<$Res> {
  __$$BirthdayCharactersStateImplCopyWithImpl(
      _$BirthdayCharactersStateImpl _value,
      $Res Function(_$BirthdayCharactersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BirthdayCharactersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BirthdayCharactersStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CharacterModel>,
    ));
  }
}

/// @nodoc

class _$BirthdayCharactersStateImpl implements _BirthdayCharactersState {
  const _$BirthdayCharactersStateImpl(
      {final List<CharacterModel> data = const []})
      : _data = data;

  final List<CharacterModel> _data;
  @override
  @JsonKey()
  List<CharacterModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BirthdayCharactersState(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BirthdayCharactersStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BirthdayCharactersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BirthdayCharactersStateImplCopyWith<_$BirthdayCharactersStateImpl>
      get copyWith => __$$BirthdayCharactersStateImplCopyWithImpl<
          _$BirthdayCharactersStateImpl>(this, _$identity);
}

abstract class _BirthdayCharactersState implements BirthdayCharactersState {
  const factory _BirthdayCharactersState({final List<CharacterModel> data}) =
      _$BirthdayCharactersStateImpl;

  @override
  List<CharacterModel> get data;

  /// Create a copy of BirthdayCharactersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BirthdayCharactersStateImplCopyWith<_$BirthdayCharactersStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
