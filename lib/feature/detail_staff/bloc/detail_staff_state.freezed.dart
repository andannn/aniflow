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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DetailStaffState {
  bool get isLoading => throw _privateConstructorUsedError;
  StaffModel? get staffModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DetailStaffStateCopyWith<DetailStaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStaffStateCopyWith<$Res> {
  factory $DetailStaffStateCopyWith(
          DetailStaffState value, $Res Function(DetailStaffState) then) =
      _$DetailStaffStateCopyWithImpl<$Res, DetailStaffState>;
  @useResult
  $Res call({bool isLoading, StaffModel? staffModel});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? staffModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      staffModel: freezed == staffModel
          ? _value.staffModel
          : staffModel // ignore: cast_nullable_to_non_nullable
              as StaffModel?,
    ) as $Val);
  }

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
  $Res call({bool isLoading, StaffModel? staffModel});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? staffModel = freezed,
  }) {
    return _then(_$DetailCharacterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      staffModel: freezed == staffModel
          ? _value.staffModel
          : staffModel // ignore: cast_nullable_to_non_nullable
              as StaffModel?,
    ));
  }
}

/// @nodoc

class _$DetailCharacterStateImpl implements _DetailCharacterState {
  _$DetailCharacterStateImpl({this.isLoading = false, this.staffModel});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final StaffModel? staffModel;

  @override
  String toString() {
    return 'DetailStaffState(isLoading: $isLoading, staffModel: $staffModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailCharacterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.staffModel, staffModel) ||
                other.staffModel == staffModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, staffModel);

  @JsonKey(ignore: true)
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
      final StaffModel? staffModel}) = _$DetailCharacterStateImpl;

  @override
  bool get isLoading;
  @override
  StaffModel? get staffModel;
  @override
  @JsonKey(ignore: true)
  _$$DetailCharacterStateImplCopyWith<_$DetailCharacterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
