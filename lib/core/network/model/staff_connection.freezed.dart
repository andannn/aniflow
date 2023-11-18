// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffConnection _$StaffConnectionFromJson(Map<String, dynamic> json) {
  return _StaffConnection.fromJson(json);
}

/// @nodoc
mixin _$StaffConnection {
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'edges')
  List<StaffEdge> get edges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffConnectionCopyWith<StaffConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffConnectionCopyWith<$Res> {
  factory $StaffConnectionCopyWith(
          StaffConnection value, $Res Function(StaffConnection) then) =
      _$StaffConnectionCopyWithImpl<$Res, StaffConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<StaffEdge> edges});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$StaffConnectionCopyWithImpl<$Res, $Val extends StaffConnection>
    implements $StaffConnectionCopyWith<$Res> {
  _$StaffConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = null,
  }) {
    return _then(_value.copyWith(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: null == edges
          ? _value.edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<StaffEdge>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageInfoCopyWith<$Res>? get pageInfo {
    if (_value.pageInfo == null) {
      return null;
    }

    return $PageInfoCopyWith<$Res>(_value.pageInfo!, (value) {
      return _then(_value.copyWith(pageInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffConnectionImplCopyWith<$Res>
    implements $StaffConnectionCopyWith<$Res> {
  factory _$$StaffConnectionImplCopyWith(_$StaffConnectionImpl value,
          $Res Function(_$StaffConnectionImpl) then) =
      __$$StaffConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'edges') List<StaffEdge> edges});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$StaffConnectionImplCopyWithImpl<$Res>
    extends _$StaffConnectionCopyWithImpl<$Res, _$StaffConnectionImpl>
    implements _$$StaffConnectionImplCopyWith<$Res> {
  __$$StaffConnectionImplCopyWithImpl(
      _$StaffConnectionImpl _value, $Res Function(_$StaffConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? edges = null,
  }) {
    return _then(_$StaffConnectionImpl(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      edges: null == edges
          ? _value._edges
          : edges // ignore: cast_nullable_to_non_nullable
              as List<StaffEdge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffConnectionImpl implements _StaffConnection {
  _$StaffConnectionImpl(
      {@JsonKey(name: 'pageInfo') this.pageInfo,
      @JsonKey(name: 'edges') final List<StaffEdge> edges = const []})
      : _edges = edges;

  factory _$StaffConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffConnectionImplFromJson(json);

  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  final List<StaffEdge> _edges;
  @override
  @JsonKey(name: 'edges')
  List<StaffEdge> get edges {
    if (_edges is EqualUnmodifiableListView) return _edges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_edges);
  }

  @override
  String toString() {
    return 'StaffConnection(pageInfo: $pageInfo, edges: $edges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffConnectionImpl &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo) &&
            const DeepCollectionEquality().equals(other._edges, _edges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageInfo, const DeepCollectionEquality().hash(_edges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffConnectionImplCopyWith<_$StaffConnectionImpl> get copyWith =>
      __$$StaffConnectionImplCopyWithImpl<_$StaffConnectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffConnectionImplToJson(
      this,
    );
  }
}

abstract class _StaffConnection implements StaffConnection {
  factory _StaffConnection(
          {@JsonKey(name: 'pageInfo') final PageInfo? pageInfo,
          @JsonKey(name: 'edges') final List<StaffEdge> edges}) =
      _$StaffConnectionImpl;

  factory _StaffConnection.fromJson(Map<String, dynamic> json) =
      _$StaffConnectionImpl.fromJson;

  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(name: 'edges')
  List<StaffEdge> get edges;
  @override
  @JsonKey(ignore: true)
  _$$StaffConnectionImplCopyWith<_$StaffConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
