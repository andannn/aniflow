// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleCategory {
  TimeOfDay? get timeOfDayHeader => throw _privateConstructorUsedError;
  List<AiringScheduleAndAnimeModel> get schedules =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScheduleCategoryCopyWith<ScheduleCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCategoryCopyWith<$Res> {
  factory $ScheduleCategoryCopyWith(
          ScheduleCategory value, $Res Function(ScheduleCategory) then) =
      _$ScheduleCategoryCopyWithImpl<$Res, ScheduleCategory>;
  @useResult
  $Res call(
      {TimeOfDay? timeOfDayHeader,
      List<AiringScheduleAndAnimeModel> schedules});
}

/// @nodoc
class _$ScheduleCategoryCopyWithImpl<$Res, $Val extends ScheduleCategory>
    implements $ScheduleCategoryCopyWith<$Res> {
  _$ScheduleCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeOfDayHeader = freezed,
    Object? schedules = null,
  }) {
    return _then(_value.copyWith(
      timeOfDayHeader: freezed == timeOfDayHeader
          ? _value.timeOfDayHeader
          : timeOfDayHeader // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      schedules: null == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<AiringScheduleAndAnimeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ScheduleCategoryImplCopyWith<$Res>
    implements $ScheduleCategoryCopyWith<$Res> {
  factory _$$ScheduleCategoryImplCopyWith(_$ScheduleCategoryImpl value,
          $Res Function(_$ScheduleCategoryImpl) then) =
      __$$ScheduleCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TimeOfDay? timeOfDayHeader,
      List<AiringScheduleAndAnimeModel> schedules});
}

/// @nodoc
class __$$ScheduleCategoryImplCopyWithImpl<$Res>
    extends _$ScheduleCategoryCopyWithImpl<$Res, _$ScheduleCategoryImpl>
    implements _$$ScheduleCategoryImplCopyWith<$Res> {
  __$$ScheduleCategoryImplCopyWithImpl(_$ScheduleCategoryImpl _value,
      $Res Function(_$ScheduleCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeOfDayHeader = freezed,
    Object? schedules = null,
  }) {
    return _then(_$ScheduleCategoryImpl(
      timeOfDayHeader: freezed == timeOfDayHeader
          ? _value.timeOfDayHeader
          : timeOfDayHeader // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      schedules: null == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<AiringScheduleAndAnimeModel>,
    ));
  }
}

/// @nodoc

class _$ScheduleCategoryImpl implements _ScheduleCategory {
  _$ScheduleCategoryImpl(
      {this.timeOfDayHeader,
      final List<AiringScheduleAndAnimeModel> schedules = const []})
      : _schedules = schedules;

  @override
  final TimeOfDay? timeOfDayHeader;
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
    return 'ScheduleCategory(timeOfDayHeader: $timeOfDayHeader, schedules: $schedules)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleCategoryImpl &&
            (identical(other.timeOfDayHeader, timeOfDayHeader) ||
                other.timeOfDayHeader == timeOfDayHeader) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeOfDayHeader,
      const DeepCollectionEquality().hash(_schedules));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleCategoryImplCopyWith<_$ScheduleCategoryImpl> get copyWith =>
      __$$ScheduleCategoryImplCopyWithImpl<_$ScheduleCategoryImpl>(
          this, _$identity);
}

abstract class _ScheduleCategory implements ScheduleCategory {
  factory _ScheduleCategory(
          {final TimeOfDay? timeOfDayHeader,
          final List<AiringScheduleAndAnimeModel> schedules}) =
      _$ScheduleCategoryImpl;

  @override
  TimeOfDay? get timeOfDayHeader;
  @override
  List<AiringScheduleAndAnimeModel> get schedules;
  @override
  @JsonKey(ignore: true)
  _$$ScheduleCategoryImplCopyWith<_$ScheduleCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
