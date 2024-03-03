// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_replies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivityRepliesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ActivityReplyModel> get replies => throw _privateConstructorUsedError;
  ActivityModel? get activityModel => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActivityRepliesStateCopyWith<ActivityRepliesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityRepliesStateCopyWith<$Res> {
  factory $ActivityRepliesStateCopyWith(ActivityRepliesState value,
          $Res Function(ActivityRepliesState) then) =
      _$ActivityRepliesStateCopyWithImpl<$Res, ActivityRepliesState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<ActivityReplyModel> replies,
      ActivityModel? activityModel});
}

/// @nodoc
class _$ActivityRepliesStateCopyWithImpl<$Res,
        $Val extends ActivityRepliesState>
    implements $ActivityRepliesStateCopyWith<$Res> {
  _$ActivityRepliesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? replies = null,
    Object? activityModel = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ActivityReplyModel>,
      activityModel: freezed == activityModel
          ? _value.activityModel
          : activityModel // ignore: cast_nullable_to_non_nullable
              as ActivityModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityRepliesStateImplCopyWith<$Res>
    implements $ActivityRepliesStateCopyWith<$Res> {
  factory _$$ActivityRepliesStateImplCopyWith(_$ActivityRepliesStateImpl value,
          $Res Function(_$ActivityRepliesStateImpl) then) =
      __$$ActivityRepliesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<ActivityReplyModel> replies,
      ActivityModel? activityModel});
}

/// @nodoc
class __$$ActivityRepliesStateImplCopyWithImpl<$Res>
    extends _$ActivityRepliesStateCopyWithImpl<$Res, _$ActivityRepliesStateImpl>
    implements _$$ActivityRepliesStateImplCopyWith<$Res> {
  __$$ActivityRepliesStateImplCopyWithImpl(_$ActivityRepliesStateImpl _value,
      $Res Function(_$ActivityRepliesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? replies = null,
    Object? activityModel = freezed,
  }) {
    return _then(_$ActivityRepliesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<ActivityReplyModel>,
      activityModel: freezed == activityModel
          ? _value.activityModel
          : activityModel // ignore: cast_nullable_to_non_nullable
              as ActivityModel?,
    ));
  }
}

/// @nodoc

class _$ActivityRepliesStateImpl implements _ActivityRepliesState {
  const _$ActivityRepliesStateImpl(
      {this.isLoading = false,
      final List<ActivityReplyModel> replies = const [],
      this.activityModel})
      : _replies = replies;

  @override
  @JsonKey()
  final bool isLoading;
  final List<ActivityReplyModel> _replies;
  @override
  @JsonKey()
  List<ActivityReplyModel> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  final ActivityModel? activityModel;

  @override
  String toString() {
    return 'ActivityRepliesState(isLoading: $isLoading, replies: $replies, activityModel: $activityModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityRepliesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._replies, _replies) &&
            (identical(other.activityModel, activityModel) ||
                other.activityModel == activityModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading,
      const DeepCollectionEquality().hash(_replies), activityModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityRepliesStateImplCopyWith<_$ActivityRepliesStateImpl>
      get copyWith =>
          __$$ActivityRepliesStateImplCopyWithImpl<_$ActivityRepliesStateImpl>(
              this, _$identity);
}

abstract class _ActivityRepliesState implements ActivityRepliesState {
  const factory _ActivityRepliesState(
      {final bool isLoading,
      final List<ActivityReplyModel> replies,
      final ActivityModel? activityModel}) = _$ActivityRepliesStateImpl;

  @override
  bool get isLoading;
  @override
  List<ActivityReplyModel> get replies;
  @override
  ActivityModel? get activityModel;
  @override
  @JsonKey(ignore: true)
  _$$ActivityRepliesStateImplCopyWith<_$ActivityRepliesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
