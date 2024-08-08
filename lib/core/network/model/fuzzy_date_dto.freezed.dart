// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuzzy_date_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FuzzyDateDto _$FuzzyDateDtoFromJson(Map<String, dynamic> json) {
  return _FuzzyDateDto.fromJson(json);
}

/// @nodoc
mixin _$FuzzyDateDto {
  @JsonKey(name: 'year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'day')
  int? get day => throw _privateConstructorUsedError;

  /// Serializes this FuzzyDateDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FuzzyDateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FuzzyDateDtoCopyWith<FuzzyDateDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuzzyDateDtoCopyWith<$Res> {
  factory $FuzzyDateDtoCopyWith(
          FuzzyDateDto value, $Res Function(FuzzyDateDto) then) =
      _$FuzzyDateDtoCopyWithImpl<$Res, FuzzyDateDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') int? month,
      @JsonKey(name: 'day') int? day});
}

/// @nodoc
class _$FuzzyDateDtoCopyWithImpl<$Res, $Val extends FuzzyDateDto>
    implements $FuzzyDateDtoCopyWith<$Res> {
  _$FuzzyDateDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FuzzyDateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_value.copyWith(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FuzzyDateDtoImplCopyWith<$Res>
    implements $FuzzyDateDtoCopyWith<$Res> {
  factory _$$FuzzyDateDtoImplCopyWith(
          _$FuzzyDateDtoImpl value, $Res Function(_$FuzzyDateDtoImpl) then) =
      __$$FuzzyDateDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') int? month,
      @JsonKey(name: 'day') int? day});
}

/// @nodoc
class __$$FuzzyDateDtoImplCopyWithImpl<$Res>
    extends _$FuzzyDateDtoCopyWithImpl<$Res, _$FuzzyDateDtoImpl>
    implements _$$FuzzyDateDtoImplCopyWith<$Res> {
  __$$FuzzyDateDtoImplCopyWithImpl(
      _$FuzzyDateDtoImpl _value, $Res Function(_$FuzzyDateDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FuzzyDateDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_$FuzzyDateDtoImpl(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int?,
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FuzzyDateDtoImpl implements _FuzzyDateDto {
  _$FuzzyDateDtoImpl(
      {@JsonKey(name: 'year') this.year,
      @JsonKey(name: 'month') this.month,
      @JsonKey(name: 'day') this.day});

  factory _$FuzzyDateDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuzzyDateDtoImplFromJson(json);

  @override
  @JsonKey(name: 'year')
  final int? year;
  @override
  @JsonKey(name: 'month')
  final int? month;
  @override
  @JsonKey(name: 'day')
  final int? day;

  @override
  String toString() {
    return 'FuzzyDateDto(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuzzyDateDtoImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  /// Create a copy of FuzzyDateDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FuzzyDateDtoImplCopyWith<_$FuzzyDateDtoImpl> get copyWith =>
      __$$FuzzyDateDtoImplCopyWithImpl<_$FuzzyDateDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FuzzyDateDtoImplToJson(
      this,
    );
  }
}

abstract class _FuzzyDateDto implements FuzzyDateDto {
  factory _FuzzyDateDto(
      {@JsonKey(name: 'year') final int? year,
      @JsonKey(name: 'month') final int? month,
      @JsonKey(name: 'day') final int? day}) = _$FuzzyDateDtoImpl;

  factory _FuzzyDateDto.fromJson(Map<String, dynamic> json) =
      _$FuzzyDateDtoImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  int? get year;
  @override
  @JsonKey(name: 'month')
  int? get month;
  @override
  @JsonKey(name: 'day')
  int? get day;

  /// Create a copy of FuzzyDateDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FuzzyDateDtoImplCopyWith<_$FuzzyDateDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
