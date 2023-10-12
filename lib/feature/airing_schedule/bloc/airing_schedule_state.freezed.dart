// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'airing_schedule_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AiringScheduleState {
  List<SchedulePageKey> get scheduleKeys => throw _privateConstructorUsedError;
  Map<SchedulePageKey, SchedulePageState> get schedulePageMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AiringScheduleStateCopyWith<AiringScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AiringScheduleStateCopyWith<$Res> {
  factory $AiringScheduleStateCopyWith(
          AiringScheduleState value, $Res Function(AiringScheduleState) then) =
      _$AiringScheduleStateCopyWithImpl<$Res, AiringScheduleState>;
  @useResult
  $Res call(
      {List<SchedulePageKey> scheduleKeys,
      Map<SchedulePageKey, SchedulePageState> schedulePageMap});
}

/// @nodoc
class _$AiringScheduleStateCopyWithImpl<$Res, $Val extends AiringScheduleState>
    implements $AiringScheduleStateCopyWith<$Res> {
  _$AiringScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleKeys = null,
    Object? schedulePageMap = null,
  }) {
    return _then(_value.copyWith(
      scheduleKeys: null == scheduleKeys
          ? _value.scheduleKeys
          : scheduleKeys // ignore: cast_nullable_to_non_nullable
              as List<SchedulePageKey>,
      schedulePageMap: null == schedulePageMap
          ? _value.schedulePageMap
          : schedulePageMap // ignore: cast_nullable_to_non_nullable
              as Map<SchedulePageKey, SchedulePageState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AiringScheduleStateCopyWith<$Res>
    implements $AiringScheduleStateCopyWith<$Res> {
  factory _$$_AiringScheduleStateCopyWith(_$_AiringScheduleState value,
          $Res Function(_$_AiringScheduleState) then) =
      __$$_AiringScheduleStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SchedulePageKey> scheduleKeys,
      Map<SchedulePageKey, SchedulePageState> schedulePageMap});
}

/// @nodoc
class __$$_AiringScheduleStateCopyWithImpl<$Res>
    extends _$AiringScheduleStateCopyWithImpl<$Res, _$_AiringScheduleState>
    implements _$$_AiringScheduleStateCopyWith<$Res> {
  __$$_AiringScheduleStateCopyWithImpl(_$_AiringScheduleState _value,
      $Res Function(_$_AiringScheduleState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleKeys = null,
    Object? schedulePageMap = null,
  }) {
    return _then(_$_AiringScheduleState(
      scheduleKeys: null == scheduleKeys
          ? _value._scheduleKeys
          : scheduleKeys // ignore: cast_nullable_to_non_nullable
              as List<SchedulePageKey>,
      schedulePageMap: null == schedulePageMap
          ? _value._schedulePageMap
          : schedulePageMap // ignore: cast_nullable_to_non_nullable
              as Map<SchedulePageKey, SchedulePageState>,
    ));
  }
}

/// @nodoc

class _$_AiringScheduleState implements _AiringScheduleState {
  _$_AiringScheduleState(
      {final List<SchedulePageKey> scheduleKeys = const [],
      final Map<SchedulePageKey, SchedulePageState> schedulePageMap = const {}})
      : _scheduleKeys = scheduleKeys,
        _schedulePageMap = schedulePageMap;

  final List<SchedulePageKey> _scheduleKeys;
  @override
  @JsonKey()
  List<SchedulePageKey> get scheduleKeys {
    if (_scheduleKeys is EqualUnmodifiableListView) return _scheduleKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_scheduleKeys);
  }

  final Map<SchedulePageKey, SchedulePageState> _schedulePageMap;
  @override
  @JsonKey()
  Map<SchedulePageKey, SchedulePageState> get schedulePageMap {
    if (_schedulePageMap is EqualUnmodifiableMapView) return _schedulePageMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_schedulePageMap);
  }

  @override
  String toString() {
    return 'AiringScheduleState(scheduleKeys: $scheduleKeys, schedulePageMap: $schedulePageMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AiringScheduleState &&
            const DeepCollectionEquality()
                .equals(other._scheduleKeys, _scheduleKeys) &&
            const DeepCollectionEquality()
                .equals(other._schedulePageMap, _schedulePageMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_scheduleKeys),
      const DeepCollectionEquality().hash(_schedulePageMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AiringScheduleStateCopyWith<_$_AiringScheduleState> get copyWith =>
      __$$_AiringScheduleStateCopyWithImpl<_$_AiringScheduleState>(
          this, _$identity);
}

abstract class _AiringScheduleState implements AiringScheduleState {
  factory _AiringScheduleState(
          {final List<SchedulePageKey> scheduleKeys,
          final Map<SchedulePageKey, SchedulePageState> schedulePageMap}) =
      _$_AiringScheduleState;

  @override
  List<SchedulePageKey> get scheduleKeys;
  @override
  Map<SchedulePageKey, SchedulePageState> get schedulePageMap;
  @override
  @JsonKey(ignore: true)
  _$$_AiringScheduleStateCopyWith<_$_AiringScheduleState> get copyWith =>
      throw _privateConstructorUsedError;
}
