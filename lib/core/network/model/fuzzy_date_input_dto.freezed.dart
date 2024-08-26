// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuzzy_date_input_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FuzzyDateInputDto _$FuzzyDateInputDtoFromJson(Map<String, dynamic> json) {
  return _FuzzyDateInputDto.fromJson(json);
}

/// @nodoc
mixin _$FuzzyDateInputDto {
  @JsonKey(name: 'year')
  int? get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'month')
  int? get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'day')
  int? get day => throw _privateConstructorUsedError;

  /// Serializes this FuzzyDateInputDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FuzzyDateInputDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FuzzyDateInputDtoCopyWith<FuzzyDateInputDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuzzyDateInputDtoCopyWith<$Res> {
  factory $FuzzyDateInputDtoCopyWith(
          FuzzyDateInputDto value, $Res Function(FuzzyDateInputDto) then) =
      _$FuzzyDateInputDtoCopyWithImpl<$Res, FuzzyDateInputDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') int? month,
      @JsonKey(name: 'day') int? day});
}

/// @nodoc
class _$FuzzyDateInputDtoCopyWithImpl<$Res, $Val extends FuzzyDateInputDto>
    implements $FuzzyDateInputDtoCopyWith<$Res> {
  _$FuzzyDateInputDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FuzzyDateInputDto
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
abstract class _$$FuzzyDateInputDtoImplCopyWith<$Res>
    implements $FuzzyDateInputDtoCopyWith<$Res> {
  factory _$$FuzzyDateInputDtoImplCopyWith(_$FuzzyDateInputDtoImpl value,
          $Res Function(_$FuzzyDateInputDtoImpl) then) =
      __$$FuzzyDateInputDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int? year,
      @JsonKey(name: 'month') int? month,
      @JsonKey(name: 'day') int? day});
}

/// @nodoc
class __$$FuzzyDateInputDtoImplCopyWithImpl<$Res>
    extends _$FuzzyDateInputDtoCopyWithImpl<$Res, _$FuzzyDateInputDtoImpl>
    implements _$$FuzzyDateInputDtoImplCopyWith<$Res> {
  __$$FuzzyDateInputDtoImplCopyWithImpl(_$FuzzyDateInputDtoImpl _value,
      $Res Function(_$FuzzyDateInputDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FuzzyDateInputDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? month = freezed,
    Object? day = freezed,
  }) {
    return _then(_$FuzzyDateInputDtoImpl(
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
class _$FuzzyDateInputDtoImpl implements _FuzzyDateInputDto {
  _$FuzzyDateInputDtoImpl(
      {@JsonKey(name: 'year') this.year,
      @JsonKey(name: 'month') this.month,
      @JsonKey(name: 'day') this.day});

  factory _$FuzzyDateInputDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuzzyDateInputDtoImplFromJson(json);

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
    return 'FuzzyDateInputDto(year: $year, month: $month, day: $day)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuzzyDateInputDtoImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.day, day) || other.day == day));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, year, month, day);

  /// Create a copy of FuzzyDateInputDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FuzzyDateInputDtoImplCopyWith<_$FuzzyDateInputDtoImpl> get copyWith =>
      __$$FuzzyDateInputDtoImplCopyWithImpl<_$FuzzyDateInputDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FuzzyDateInputDtoImplToJson(
      this,
    );
  }
}

abstract class _FuzzyDateInputDto implements FuzzyDateInputDto {
  factory _FuzzyDateInputDto(
      {@JsonKey(name: 'year') final int? year,
      @JsonKey(name: 'month') final int? month,
      @JsonKey(name: 'day') final int? day}) = _$FuzzyDateInputDtoImpl;

  factory _FuzzyDateInputDto.fromJson(Map<String, dynamic> json) =
      _$FuzzyDateInputDtoImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  int? get year;
  @override
  @JsonKey(name: 'month')
  int? get month;
  @override
  @JsonKey(name: 'day')
  int? get day;

  /// Create a copy of FuzzyDateInputDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FuzzyDateInputDtoImplCopyWith<_$FuzzyDateInputDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
