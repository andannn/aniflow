// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_tag_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaTagModel {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get rank => throw _privateConstructorUsedError;

  /// Create a copy of MediaTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaTagModelCopyWith<MediaTagModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaTagModelCopyWith<$Res> {
  factory $MediaTagModelCopyWith(
          MediaTagModel value, $Res Function(MediaTagModel) then) =
      _$MediaTagModelCopyWithImpl<$Res, MediaTagModel>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String? description,
      String? category,
      String? rank});
}

/// @nodoc
class _$MediaTagModelCopyWithImpl<$Res, $Val extends MediaTagModel>
    implements $MediaTagModelCopyWith<$Res> {
  _$MediaTagModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$MediaTagModelImplCopyWith<$Res>
    implements $MediaTagModelCopyWith<$Res> {
  factory _$$MediaTagModelImplCopyWith(
          _$MediaTagModelImpl value, $Res Function(_$MediaTagModelImpl) then) =
      __$$MediaTagModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String? description,
      String? category,
      String? rank});
}

/// @nodoc
class __$$MediaTagModelImplCopyWithImpl<$Res>
    extends _$MediaTagModelCopyWithImpl<$Res, _$MediaTagModelImpl>
    implements _$$MediaTagModelImplCopyWith<$Res> {
  __$$MediaTagModelImplCopyWithImpl(
      _$MediaTagModelImpl _value, $Res Function(_$MediaTagModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaTagModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? category = freezed,
    Object? rank = freezed,
  }) {
    return _then(_$MediaTagModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$MediaTagModelImpl implements _MediaTagModel {
  const _$MediaTagModelImpl(
      {this.id = '', this.name, this.description, this.category, this.rank});

  @override
  @JsonKey()
  final String id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? category;
  @override
  final String? rank;

  @override
  String toString() {
    return 'MediaTagModel(id: $id, name: $name, description: $description, category: $category, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaTagModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, category, rank);

  /// Create a copy of MediaTagModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaTagModelImplCopyWith<_$MediaTagModelImpl> get copyWith =>
      __$$MediaTagModelImplCopyWithImpl<_$MediaTagModelImpl>(this, _$identity);
}

abstract class _MediaTagModel implements MediaTagModel {
  const factory _MediaTagModel(
      {final String id,
      final String? name,
      final String? description,
      final String? category,
      final String? rank}) = _$MediaTagModelImpl;

  @override
  String get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get category;
  @override
  String? get rank;

  /// Create a copy of MediaTagModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaTagModelImplCopyWith<_$MediaTagModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
