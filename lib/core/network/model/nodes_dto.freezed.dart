// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nodes_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NodesDto<T> _$NodesDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _NodesDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$NodesDto<T> {
  @JsonKey(name: 'nodes')
  List<T> get nodes => throw _privateConstructorUsedError;

  /// Serializes this NodesDto to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of NodesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NodesDtoCopyWith<T, NodesDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodesDtoCopyWith<T, $Res> {
  factory $NodesDtoCopyWith(
          NodesDto<T> value, $Res Function(NodesDto<T>) then) =
      _$NodesDtoCopyWithImpl<T, $Res, NodesDto<T>>;
  @useResult
  $Res call({@JsonKey(name: 'nodes') List<T> nodes});
}

/// @nodoc
class _$NodesDtoCopyWithImpl<T, $Res, $Val extends NodesDto<T>>
    implements $NodesDtoCopyWith<T, $Res> {
  _$NodesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NodesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NodesDtoImplCopyWith<T, $Res>
    implements $NodesDtoCopyWith<T, $Res> {
  factory _$$NodesDtoImplCopyWith(
          _$NodesDtoImpl<T> value, $Res Function(_$NodesDtoImpl<T>) then) =
      __$$NodesDtoImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'nodes') List<T> nodes});
}

/// @nodoc
class __$$NodesDtoImplCopyWithImpl<T, $Res>
    extends _$NodesDtoCopyWithImpl<T, $Res, _$NodesDtoImpl<T>>
    implements _$$NodesDtoImplCopyWith<T, $Res> {
  __$$NodesDtoImplCopyWithImpl(
      _$NodesDtoImpl<T> _value, $Res Function(_$NodesDtoImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of NodesDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nodes = null,
  }) {
    return _then(_$NodesDtoImpl<T>(
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$NodesDtoImpl<T> implements _NodesDto<T> {
  const _$NodesDtoImpl({@JsonKey(name: 'nodes') final List<T> nodes = const []})
      : _nodes = nodes;

  factory _$NodesDtoImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$NodesDtoImplFromJson(json, fromJsonT);

  final List<T> _nodes;
  @override
  @JsonKey(name: 'nodes')
  List<T> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'NodesDto<$T>(nodes: $nodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NodesDtoImpl<T> &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_nodes));

  /// Create a copy of NodesDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NodesDtoImplCopyWith<T, _$NodesDtoImpl<T>> get copyWith =>
      __$$NodesDtoImplCopyWithImpl<T, _$NodesDtoImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$NodesDtoImplToJson<T>(this, toJsonT);
  }
}

abstract class _NodesDto<T> implements NodesDto<T> {
  const factory _NodesDto({@JsonKey(name: 'nodes') final List<T> nodes}) =
      _$NodesDtoImpl<T>;

  factory _NodesDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$NodesDtoImpl<T>.fromJson;

  @override
  @JsonKey(name: 'nodes')
  List<T> get nodes;

  /// Create a copy of NodesDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NodesDtoImplCopyWith<T, _$NodesDtoImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
