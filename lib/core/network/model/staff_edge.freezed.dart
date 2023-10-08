// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffEdge _$StaffEdgeFromJson(Map<String, dynamic> json) {
  return _StaffEdge.fromJson(json);
}

/// @nodoc
mixin _$StaffEdge {
  @JsonKey(name: 'role')
  String? get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  StaffDto? get staffNode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffEdgeCopyWith<StaffEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffEdgeCopyWith<$Res> {
  factory $StaffEdgeCopyWith(StaffEdge value, $Res Function(StaffEdge) then) =
      _$StaffEdgeCopyWithImpl<$Res, StaffEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'role') String? role,
      @JsonKey(name: 'node') StaffDto? staffNode});

  $StaffDtoCopyWith<$Res>? get staffNode;
}

/// @nodoc
class _$StaffEdgeCopyWithImpl<$Res, $Val extends StaffEdge>
    implements $StaffEdgeCopyWith<$Res> {
  _$StaffEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? staffNode = freezed,
  }) {
    return _then(_value.copyWith(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      staffNode: freezed == staffNode
          ? _value.staffNode
          : staffNode // ignore: cast_nullable_to_non_nullable
              as StaffDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StaffDtoCopyWith<$Res>? get staffNode {
    if (_value.staffNode == null) {
      return null;
    }

    return $StaffDtoCopyWith<$Res>(_value.staffNode!, (value) {
      return _then(_value.copyWith(staffNode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_StaffEdgeCopyWith<$Res> implements $StaffEdgeCopyWith<$Res> {
  factory _$$_StaffEdgeCopyWith(
          _$_StaffEdge value, $Res Function(_$_StaffEdge) then) =
      __$$_StaffEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'role') String? role,
      @JsonKey(name: 'node') StaffDto? staffNode});

  @override
  $StaffDtoCopyWith<$Res>? get staffNode;
}

/// @nodoc
class __$$_StaffEdgeCopyWithImpl<$Res>
    extends _$StaffEdgeCopyWithImpl<$Res, _$_StaffEdge>
    implements _$$_StaffEdgeCopyWith<$Res> {
  __$$_StaffEdgeCopyWithImpl(
      _$_StaffEdge _value, $Res Function(_$_StaffEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = freezed,
    Object? staffNode = freezed,
  }) {
    return _then(_$_StaffEdge(
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
      staffNode: freezed == staffNode
          ? _value.staffNode
          : staffNode // ignore: cast_nullable_to_non_nullable
              as StaffDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaffEdge implements _StaffEdge {
  _$_StaffEdge(
      {@JsonKey(name: 'role') this.role,
      @JsonKey(name: 'node') this.staffNode});

  factory _$_StaffEdge.fromJson(Map<String, dynamic> json) =>
      _$$_StaffEdgeFromJson(json);

  @override
  @JsonKey(name: 'role')
  final String? role;
  @override
  @JsonKey(name: 'node')
  final StaffDto? staffNode;

  @override
  String toString() {
    return 'StaffEdge(role: $role, staffNode: $staffNode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StaffEdge &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.staffNode, staffNode) ||
                other.staffNode == staffNode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, role, staffNode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StaffEdgeCopyWith<_$_StaffEdge> get copyWith =>
      __$$_StaffEdgeCopyWithImpl<_$_StaffEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StaffEdgeToJson(
      this,
    );
  }
}

abstract class _StaffEdge implements StaffEdge {
  factory _StaffEdge(
      {@JsonKey(name: 'role') final String? role,
      @JsonKey(name: 'node') final StaffDto? staffNode}) = _$_StaffEdge;

  factory _StaffEdge.fromJson(Map<String, dynamic> json) =
      _$_StaffEdge.fromJson;

  @override
  @JsonKey(name: 'role')
  String? get role;
  @override
  @JsonKey(name: 'node')
  StaffDto? get staffNode;
  @override
  @JsonKey(ignore: true)
  _$$_StaffEdgeCopyWith<_$_StaffEdge> get copyWith =>
      throw _privateConstructorUsedError;
}
