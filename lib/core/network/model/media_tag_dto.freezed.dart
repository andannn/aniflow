// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_tag_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MediaTagDto _$MediaTagDtoFromJson(Map<String, dynamic> json) {
  return _MediaTagDto.fromJson(json);
}

/// @nodoc
mixin _$MediaTagDto {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'rank')
  String? get rank => throw _privateConstructorUsedError;

  /// Serializes this MediaTagDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MediaTagDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaTagDtoCopyWith<MediaTagDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaTagDtoCopyWith<$Res> {
  factory $MediaTagDtoCopyWith(
          MediaTagDto value, $Res Function(MediaTagDto) then) =
      _$MediaTagDtoCopyWithImpl<$Res, MediaTagDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'rank') String? rank});
}

/// @nodoc
class _$MediaTagDtoCopyWithImpl<$Res, $Val extends MediaTagDto>
    implements $MediaTagDtoCopyWith<$Res> {
  _$MediaTagDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaTagDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaTagDtoImplCopyWith<$Res>
    implements $MediaTagDtoCopyWith<$Res> {
  factory _$$MediaTagDtoImplCopyWith(
          _$MediaTagDtoImpl value, $Res Function(_$MediaTagDtoImpl) then) =
      __$$MediaTagDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'rank') String? rank});
}

/// @nodoc
class __$$MediaTagDtoImplCopyWithImpl<$Res>
    extends _$MediaTagDtoCopyWithImpl<$Res, _$MediaTagDtoImpl>
    implements _$$MediaTagDtoImplCopyWith<$Res> {
  __$$MediaTagDtoImplCopyWithImpl(
      _$MediaTagDtoImpl _value, $Res Function(_$MediaTagDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaTagDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? rank = freezed,
  }) {
    return _then(_$MediaTagDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaTagDtoImpl implements _MediaTagDto {
  const _$MediaTagDtoImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'rank') this.rank});

  factory _$MediaTagDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaTagDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'category')
  final String? category;
  @override
  @JsonKey(name: 'rank')
  final String? rank;

  @override
  String toString() {
    return 'MediaTagDto(id: $id, name: $name, description: $description, category: $category, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaTagDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, category, rank);

  /// Create a copy of MediaTagDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaTagDtoImplCopyWith<_$MediaTagDtoImpl> get copyWith =>
      __$$MediaTagDtoImplCopyWithImpl<_$MediaTagDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaTagDtoImplToJson(
      this,
    );
  }
}

abstract class _MediaTagDto implements MediaTagDto {
  const factory _MediaTagDto(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'category') final String? category,
      @JsonKey(name: 'rank') final String? rank}) = _$MediaTagDtoImpl;

  factory _MediaTagDto.fromJson(Map<String, dynamic> json) =
      _$MediaTagDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'rank')
  String? get rank;

  /// Create a copy of MediaTagDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaTagDtoImplCopyWith<_$MediaTagDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
