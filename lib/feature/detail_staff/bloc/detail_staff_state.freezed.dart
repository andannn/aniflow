// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DetailStaffState {
  bool get isLoading => throw _privateConstructorUsedError;
  MediaSort get mediaSort => throw _privateConstructorUsedError;
  UserStaffNameLanguage get userStaffNameLanguage =>
      throw _privateConstructorUsedError;
  UserTitleLanguage get userTitleLanguage => throw _privateConstructorUsedError;
  StaffModel? get staffModel => throw _privateConstructorUsedError;

  /// Create a copy of DetailStaffState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailStaffStateCopyWith<DetailStaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStaffStateCopyWith<$Res> {
  factory $DetailStaffStateCopyWith(
          DetailStaffState value, $Res Function(DetailStaffState) then) =
      _$DetailStaffStateCopyWithImpl<$Res, DetailStaffState>;
  @useResult
  $Res call(
      {bool isLoading,
      MediaSort mediaSort,
      UserStaffNameLanguage userStaffNameLanguage,
      UserTitleLanguage userTitleLanguage,
      StaffModel? staffModel});

  $StaffModelCopyWith<$Res>? get staffModel;
}

/// @nodoc
class _$DetailStaffStateCopyWithImpl<$Res, $Val extends DetailStaffState>
    implements $DetailStaffStateCopyWith<$Res> {
  _$DetailStaffStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailStaffState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? mediaSort = null,
    Object? userStaffNameLanguage = null,
    Object? userTitleLanguage = null,
    Object? staffModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaSort: null == mediaSort
          ? _value.mediaSort
          : mediaSort // ignore: cast_nullable_to_non_nullable
              as MediaSort,
      userStaffNameLanguage: null == userStaffNameLanguage
          ? _value.userStaffNameLanguage
          : userStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
      staffModel: freezed == staffModel
          ? _value.staffModel
          : staffModel // ignore: cast_nullable_to_non_nullable
              as StaffModel?,
    ) as $Val);
  }

  /// Create a copy of DetailStaffState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StaffModelCopyWith<$Res>? get staffModel {
    if (_value.staffModel == null) {
      return null;
    }

    return $StaffModelCopyWith<$Res>(_value.staffModel!, (value) {
      return _then(_value.copyWith(staffModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailCharacterStateImplCopyWith<$Res>
    implements $DetailStaffStateCopyWith<$Res> {
  factory _$$DetailCharacterStateImplCopyWith(_$DetailCharacterStateImpl value,
          $Res Function(_$DetailCharacterStateImpl) then) =
      __$$DetailCharacterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      MediaSort mediaSort,
      UserStaffNameLanguage userStaffNameLanguage,
      UserTitleLanguage userTitleLanguage,
      StaffModel? staffModel});

  @override
  $StaffModelCopyWith<$Res>? get staffModel;
}

/// @nodoc
class __$$DetailCharacterStateImplCopyWithImpl<$Res>
    extends _$DetailStaffStateCopyWithImpl<$Res, _$DetailCharacterStateImpl>
    implements _$$DetailCharacterStateImplCopyWith<$Res> {
  __$$DetailCharacterStateImplCopyWithImpl(_$DetailCharacterStateImpl _value,
      $Res Function(_$DetailCharacterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailStaffState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? mediaSort = null,
    Object? userStaffNameLanguage = null,
    Object? userTitleLanguage = null,
    Object? staffModel = freezed,
  }) {
    return _then(_$DetailCharacterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaSort: null == mediaSort
          ? _value.mediaSort
          : mediaSort // ignore: cast_nullable_to_non_nullable
              as MediaSort,
      userStaffNameLanguage: null == userStaffNameLanguage
          ? _value.userStaffNameLanguage
          : userStaffNameLanguage // ignore: cast_nullable_to_non_nullable
              as UserStaffNameLanguage,
      userTitleLanguage: null == userTitleLanguage
          ? _value.userTitleLanguage
          : userTitleLanguage // ignore: cast_nullable_to_non_nullable
              as UserTitleLanguage,
      staffModel: freezed == staffModel
          ? _value.staffModel
          : staffModel // ignore: cast_nullable_to_non_nullable
              as StaffModel?,
    ));
  }
}

/// @nodoc

class _$DetailCharacterStateImpl implements _DetailCharacterState {
  _$DetailCharacterStateImpl(
      {this.isLoading = false,
      this.mediaSort = MediaSort.newest,
      this.userStaffNameLanguage = UserStaffNameLanguage.native,
      this.userTitleLanguage = UserTitleLanguage.native,
      this.staffModel});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final MediaSort mediaSort;
  @override
  @JsonKey()
  final UserStaffNameLanguage userStaffNameLanguage;
  @override
  @JsonKey()
  final UserTitleLanguage userTitleLanguage;
  @override
  final StaffModel? staffModel;

  @override
  String toString() {
    return 'DetailStaffState(isLoading: $isLoading, mediaSort: $mediaSort, userStaffNameLanguage: $userStaffNameLanguage, userTitleLanguage: $userTitleLanguage, staffModel: $staffModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCharacterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.mediaSort, mediaSort) ||
                other.mediaSort == mediaSort) &&
            (identical(other.userStaffNameLanguage, userStaffNameLanguage) ||
                other.userStaffNameLanguage == userStaffNameLanguage) &&
            (identical(other.userTitleLanguage, userTitleLanguage) ||
                other.userTitleLanguage == userTitleLanguage) &&
            (identical(other.staffModel, staffModel) ||
                other.staffModel == staffModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, mediaSort,
      userStaffNameLanguage, userTitleLanguage, staffModel);

  /// Create a copy of DetailStaffState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailCharacterStateImplCopyWith<_$DetailCharacterStateImpl>
      get copyWith =>
          __$$DetailCharacterStateImplCopyWithImpl<_$DetailCharacterStateImpl>(
              this, _$identity);
}

abstract class _DetailCharacterState implements DetailStaffState {
  factory _DetailCharacterState(
      {final bool isLoading,
      final MediaSort mediaSort,
      final UserStaffNameLanguage userStaffNameLanguage,
      final UserTitleLanguage userTitleLanguage,
      final StaffModel? staffModel}) = _$DetailCharacterStateImpl;

  @override
  bool get isLoading;
  @override
  MediaSort get mediaSort;
  @override
  UserStaffNameLanguage get userStaffNameLanguage;
  @override
  UserTitleLanguage get userTitleLanguage;
  @override
  StaffModel? get staffModel;

  /// Create a copy of DetailStaffState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailCharacterStateImplCopyWith<_$DetailCharacterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
