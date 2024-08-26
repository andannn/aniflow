// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivityState {
  bool get isLoading => throw _privateConstructorUsedError;
  ActivityFilterType? get filterType => throw _privateConstructorUsedError;
  ActivityScopeCategory? get scopeCategory =>
      throw _privateConstructorUsedError;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityStateCopyWith<ActivityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityStateCopyWith<$Res> {
  factory $ActivityStateCopyWith(
          ActivityState value, $Res Function(ActivityState) then) =
      _$ActivityStateCopyWithImpl<$Res, ActivityState>;
  @useResult
  $Res call(
      {bool isLoading,
      ActivityFilterType? filterType,
      ActivityScopeCategory? scopeCategory});
}

/// @nodoc
class _$ActivityStateCopyWithImpl<$Res, $Val extends ActivityState>
    implements $ActivityStateCopyWith<$Res> {
  _$ActivityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? filterType = freezed,
    Object? scopeCategory = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as ActivityFilterType?,
      scopeCategory: freezed == scopeCategory
          ? _value.scopeCategory
          : scopeCategory // ignore: cast_nullable_to_non_nullable
              as ActivityScopeCategory?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityStateImplCopyWith<$Res>
    implements $ActivityStateCopyWith<$Res> {
  factory _$$ActivityStateImplCopyWith(
          _$ActivityStateImpl value, $Res Function(_$ActivityStateImpl) then) =
      __$$ActivityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      ActivityFilterType? filterType,
      ActivityScopeCategory? scopeCategory});
}

/// @nodoc
class __$$ActivityStateImplCopyWithImpl<$Res>
    extends _$ActivityStateCopyWithImpl<$Res, _$ActivityStateImpl>
    implements _$$ActivityStateImplCopyWith<$Res> {
  __$$ActivityStateImplCopyWithImpl(
      _$ActivityStateImpl _value, $Res Function(_$ActivityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? filterType = freezed,
    Object? scopeCategory = freezed,
  }) {
    return _then(_$ActivityStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      filterType: freezed == filterType
          ? _value.filterType
          : filterType // ignore: cast_nullable_to_non_nullable
              as ActivityFilterType?,
      scopeCategory: freezed == scopeCategory
          ? _value.scopeCategory
          : scopeCategory // ignore: cast_nullable_to_non_nullable
              as ActivityScopeCategory?,
    ));
  }
}

/// @nodoc

class _$ActivityStateImpl implements _ActivityState {
  _$ActivityStateImpl(
      {this.isLoading = true, this.filterType, this.scopeCategory});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final ActivityFilterType? filterType;
  @override
  final ActivityScopeCategory? scopeCategory;

  @override
  String toString() {
    return 'ActivityState(isLoading: $isLoading, filterType: $filterType, scopeCategory: $scopeCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.filterType, filterType) ||
                other.filterType == filterType) &&
            (identical(other.scopeCategory, scopeCategory) ||
                other.scopeCategory == scopeCategory));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, filterType, scopeCategory);

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityStateImplCopyWith<_$ActivityStateImpl> get copyWith =>
      __$$ActivityStateImplCopyWithImpl<_$ActivityStateImpl>(this, _$identity);
}

abstract class _ActivityState implements ActivityState {
  factory _ActivityState(
      {final bool isLoading,
      final ActivityFilterType? filterType,
      final ActivityScopeCategory? scopeCategory}) = _$ActivityStateImpl;

  @override
  bool get isLoading;
  @override
  ActivityFilterType? get filterType;
  @override
  ActivityScopeCategory? get scopeCategory;

  /// Create a copy of ActivityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityStateImplCopyWith<_$ActivityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
