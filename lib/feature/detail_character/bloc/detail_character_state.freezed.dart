// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_character_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailCharacterState {
  bool get isLoading => throw _privateConstructorUsedError;
  CharacterModel? get characterModel => throw _privateConstructorUsedError;
  UserStaffNameLanguage get userStaffNameLanguage =>
      throw _privateConstructorUsedError;
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailCharacterStateCopyWith<DetailCharacterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailCharacterStateCopyWith<$Res> {
  factory $DetailCharacterStateCopyWith(DetailCharacterState value,
          $Res Function(DetailCharacterState) then) =
      _$DetailCharacterStateCopyWithImpl<$Res, DetailCharacterState>;
  @useResult
  $Res call(
      {bool isLoading,
      CharacterModel? characterModel,
      UserStaffNameLanguage userStaffNameLanguage,
      UserTitleLanguage userTitleLanguage});

  $CharacterModelCopyWith<$Res>? get characterModel;
}

/// @nodoc
class _$DetailCharacterStateCopyWithImpl<$Res,
        $Val extends DetailCharacterState>
    implements $DetailCharacterStateCopyWith<$Res> {
  _$DetailCharacterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? characterModel = freezed,
    Object? userStaffNameLanguage = null,
    Object? userTitleLanguage = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      characterModel: freezed == characterModel
          ? _value.characterModel
          : characterModel // ignore: cast_nullable_to_non_nullable
              as CharacterModel?,
      userStaffNameLanguage: null == userStaffNameLanguage
          ? _value.userStaffNameLanguage
          : userStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterModelCopyWith<$Res>? get characterModel {
    if (_value.characterModel == null) {
      return null;
    }

    return $CharacterModelCopyWith<$Res>(_value.characterModel!, (value) {
      return _then(_value.copyWith(characterModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCharacterStateImplCopyWith<$Res>
    implements $DetailCharacterStateCopyWith<$Res> {
  factory _$$DetailCharacterStateImplCopyWith(_$DetailCharacterStateImpl value,
          $Res Function(_$DetailCharacterStateImpl) then) =
      __$$DetailCharacterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      CharacterModel? characterModel,
      UserStaffNameLanguage userStaffNameLanguage,
      UserTitleLanguage userTitleLanguage});

  @override
  $CharacterModelCopyWith<$Res>? get characterModel;
}

/// @nodoc
class __$$DetailCharacterStateImplCopyWithImpl<$Res>
    extends _$DetailCharacterStateCopyWithImpl<$Res, _$DetailCharacterStateImpl>
    implements _$$DetailCharacterStateImplCopyWith<$Res> {
  __$$DetailCharacterStateImplCopyWithImpl(_$DetailCharacterStateImpl _value,
      $Res Function(_$DetailCharacterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? characterModel = freezed,
    Object? userStaffNameLanguage = null,
    Object? userTitleLanguage = null,
  }) {
    return _then(_$DetailCharacterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      characterModel: freezed == characterModel
          ? _value.characterModel
          : characterModel // ignore: cast_nullable_to_non_nullable
              as CharacterModel?,
      userStaffNameLanguage: null == userStaffNameLanguage
          ? _value.userStaffNameLanguage
          : userStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
    ));
  }
}

/// @nodoc

class _$DetailCharacterStateImpl implements _DetailCharacterState {
  _$DetailCharacterStateImpl(
      {this.isLoading = false,
      this.characterModel,
      this.userStaffNameLanguage = UserStaffNameLanguage.native,
      this.userTitleLanguage = UserTitleLanguage.native});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final CharacterModel? characterModel;
  @override
  @JsonKey()
  final UserStaffNameLanguage userStaffNameLanguage;
  @override
  @JsonKey()
  final UserTitleLanguage userTitleLanguage;

  @override
  String toString() {
    return 'DetailCharacterState(isLoading: $isLoading, characterModel: $characterModel, userStaffNameLanguage: $userStaffNameLanguage, userTitleLanguage: $userTitleLanguage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCharacterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.characterModel, characterModel) ||
                other.characterModel == characterModel) &&
            (identical(other.userStaffNameLanguage, userStaffNameLanguage) ||
                other.userStaffNameLanguage == userStaffNameLanguage) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, characterModel,
      userStaffNameLanguage, userTitleLanguage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCharacterStateImplCopyWith<_$DetailCharacterStateImpl>
      get copyWith =>
          __$$DetailCharacterStateImplCopyWithImpl<_$DetailCharacterStateImpl>(
              this, _$identity);
}

abstract class _DetailCharacterState implements DetailCharacterState {
  factory _DetailCharacterState(
      {final bool isLoading,
      final CharacterModel? characterModel,
      final UserStaffNameLanguage userStaffNameLanguage,
      final UserTitleLanguage userTitleLanguage}) = _$DetailCharacterStateImpl;

  @override
  bool get isLoading;
  @override
  CharacterModel? get characterModel;
  @override
  UserStaffNameLanguage get userStaffNameLanguage;
  @override
  UserTitleLanguage get userTitleLanguage;
  @override
  @JsonKey(ignore: true)
  _$$DetailCharacterStateImplCopyWith<_$DetailCharacterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
