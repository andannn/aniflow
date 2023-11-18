// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_page_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharacterPageState {
  StaffLanguage get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterPageStateCopyWith<CharacterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterPageStateCopyWith<$Res> {
  factory $CharacterPageStateCopyWith(
          CharacterPageState value, $Res Function(CharacterPageState) then) =
      _$CharacterPageStateCopyWithImpl<$Res, CharacterPageState>;
  @useResult
  $Res call({StaffLanguage language});
}

/// @nodoc
class _$CharacterPageStateCopyWithImpl<$Res, $Val extends CharacterPageState>
    implements $CharacterPageStateCopyWith<$Res> {
  _$CharacterPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as StaffLanguage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CharacterPageStateImplCopyWith<$Res>
    implements $CharacterPageStateCopyWith<$Res> {
  factory _$$CharacterPageStateImplCopyWith(_$CharacterPageStateImpl value,
          $Res Function(_$CharacterPageStateImpl) then) =
      __$$CharacterPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StaffLanguage language});
}

/// @nodoc
class __$$CharacterPageStateImplCopyWithImpl<$Res>
    extends _$CharacterPageStateCopyWithImpl<$Res, _$CharacterPageStateImpl>
    implements _$$CharacterPageStateImplCopyWith<$Res> {
  __$$CharacterPageStateImplCopyWithImpl(_$CharacterPageStateImpl _value,
      $Res Function(_$CharacterPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_$CharacterPageStateImpl(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as StaffLanguage,
    ));
  }
}

/// @nodoc

class _$CharacterPageStateImpl implements _CharacterPageState {
  _$CharacterPageStateImpl({this.language = StaffLanguage.japanese});

  @override
  @JsonKey()
  final StaffLanguage language;

  @override
  String toString() {
    return 'CharacterPageState(language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterPageStateImpl &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterPageStateImplCopyWith<_$CharacterPageStateImpl> get copyWith =>
      __$$CharacterPageStateImplCopyWithImpl<_$CharacterPageStateImpl>(
          this, _$identity);
}

abstract class _CharacterPageState implements CharacterPageState {
  factory _CharacterPageState({final StaffLanguage language}) =
      _$CharacterPageStateImpl;

  @override
  StaffLanguage get language;
  @override
  @JsonKey(ignore: true)
  _$$CharacterPageStateImplCopyWith<_$CharacterPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
