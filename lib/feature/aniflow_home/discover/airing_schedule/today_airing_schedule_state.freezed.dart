// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_airing_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TodayAiringScheduleState {
  List<AiringScheduleAndAnimeModel> get schedules =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodayAiringScheduleStateCopyWith<TodayAiringScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayAiringScheduleStateCopyWith<$Res> {
  factory $TodayAiringScheduleStateCopyWith(TodayAiringScheduleState value,
          $Res Function(TodayAiringScheduleState) then) =
      _$TodayAiringScheduleStateCopyWithImpl<$Res, TodayAiringScheduleState>;
  @useResult
  $Res call({List<AiringScheduleAndAnimeModel> schedules});
}

/// @nodoc
class _$TodayAiringScheduleStateCopyWithImpl<$Res,
        $Val extends TodayAiringScheduleState>
    implements $TodayAiringScheduleStateCopyWith<$Res> {
  _$TodayAiringScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<AiringScheduleAndAnimeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodayAiringScheduleStateImplCopyWith<$Res>
    implements $TodayAiringScheduleStateCopyWith<$Res> {
  factory _$$TodayAiringScheduleStateImplCopyWith(
          _$TodayAiringScheduleStateImpl value,
          $Res Function(_$TodayAiringScheduleStateImpl) then) =
      __$$TodayAiringScheduleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AiringScheduleAndAnimeModel> schedules});
}

/// @nodoc
class __$$TodayAiringScheduleStateImplCopyWithImpl<$Res>
    extends _$TodayAiringScheduleStateCopyWithImpl<$Res,
        _$TodayAiringScheduleStateImpl>
    implements _$$TodayAiringScheduleStateImplCopyWith<$Res> {
  __$$TodayAiringScheduleStateImplCopyWithImpl(
      _$TodayAiringScheduleStateImpl _value,
      $Res Function(_$TodayAiringScheduleStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedules = null,
  }) {
    return _then(_$TodayAiringScheduleStateImpl(
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<AiringScheduleAndAnimeModel>,
    ));
  }
}

/// @nodoc

class _$TodayAiringScheduleStateImpl implements _TodayAiringScheduleState {
  const _$TodayAiringScheduleStateImpl(
      {final List<AiringScheduleAndAnimeModel> schedules = const []})
      : _schedules = schedules;

  final List<AiringScheduleAndAnimeModel> _schedules;
  @override
  @JsonKey()
  List<AiringScheduleAndAnimeModel> get schedules {
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_schedules);
  }

  @override
  String toString() {
    return 'TodayAiringScheduleState(schedules: $schedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayAiringScheduleStateImpl &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayAiringScheduleStateImplCopyWith<_$TodayAiringScheduleStateImpl>
      get copyWith => __$$TodayAiringScheduleStateImplCopyWithImpl<
          _$TodayAiringScheduleStateImpl>(this, _$identity);
}

abstract class _TodayAiringScheduleState implements TodayAiringScheduleState {
  const factory _TodayAiringScheduleState(
          {final List<AiringScheduleAndAnimeModel> schedules}) =
      _$TodayAiringScheduleStateImpl;

  @override
  List<AiringScheduleAndAnimeModel> get schedules;
  @override
  @JsonKey(ignore: true)
  _$$TodayAiringScheduleStateImplCopyWith<_$TodayAiringScheduleStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
