// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'studio_connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StudioConnection _$StudioConnectionFromJson(Map<String, dynamic> json) {
  return _StudioConnection.fromJson(json);
}

/// @nodoc
mixin _$StudioConnection {
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'nodes')
  List<StudioDto> get nodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudioConnectionCopyWith<StudioConnection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudioConnectionCopyWith<$Res> {
  factory $StudioConnectionCopyWith(
          StudioConnection value, $Res Function(StudioConnection) then) =
      _$StudioConnectionCopyWithImpl<$Res, StudioConnection>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'nodes') List<StudioDto> nodes});

  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class _$StudioConnectionCopyWithImpl<$Res, $Val extends StudioConnection>
    implements $StudioConnectionCopyWith<$Res> {
  _$StudioConnectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? nodes = null,
  }) {
    return _then(_value.copyWith(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      nodes: null == nodes
          ? _value.nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<StudioDto>,
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
abstract class _$$StudioConnectionImplCopyWith<$Res>
    implements $StudioConnectionCopyWith<$Res> {
  factory _$$StudioConnectionImplCopyWith(_$StudioConnectionImpl value,
          $Res Function(_$StudioConnectionImpl) then) =
      __$$StudioConnectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pageInfo') PageInfo? pageInfo,
      @JsonKey(name: 'nodes') List<StudioDto> nodes});

  @override
  $PageInfoCopyWith<$Res>? get pageInfo;
}

/// @nodoc
class __$$StudioConnectionImplCopyWithImpl<$Res>
    extends _$StudioConnectionCopyWithImpl<$Res, _$StudioConnectionImpl>
    implements _$$StudioConnectionImplCopyWith<$Res> {
  __$$StudioConnectionImplCopyWithImpl(_$StudioConnectionImpl _value,
      $Res Function(_$StudioConnectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageInfo = freezed,
    Object? nodes = null,
  }) {
    return _then(_$StudioConnectionImpl(
      pageInfo: freezed == pageInfo
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo?,
      nodes: null == nodes
          ? _value._nodes
          : nodes // ignore: cast_nullable_to_non_nullable
              as List<StudioDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudioConnectionImpl implements _StudioConnection {
  _$StudioConnectionImpl(
      {@JsonKey(name: 'pageInfo') this.pageInfo,
      @JsonKey(name: 'nodes') final List<StudioDto> nodes = const []})
      : _nodes = nodes;

  factory _$StudioConnectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudioConnectionImplFromJson(json);

  @override
  @JsonKey(name: 'pageInfo')
  final PageInfo? pageInfo;
  final List<StudioDto> _nodes;
  @override
  @JsonKey(name: 'nodes')
  List<StudioDto> get nodes {
    if (_nodes is EqualUnmodifiableListView) return _nodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nodes);
  }

  @override
  String toString() {
    return 'StudioConnection(pageInfo: $pageInfo, nodes: $nodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudioConnectionImpl &&
            (identical(other.pageInfo, pageInfo) ||
                other.pageInfo == pageInfo) &&
            const DeepCollectionEquality().equals(other._nodes, _nodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, pageInfo, const DeepCollectionEquality().hash(_nodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudioConnectionImplCopyWith<_$StudioConnectionImpl> get copyWith =>
      __$$StudioConnectionImplCopyWithImpl<_$StudioConnectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudioConnectionImplToJson(
      this,
    );
  }
}

abstract class _StudioConnection implements StudioConnection {
  factory _StudioConnection(
          {@JsonKey(name: 'pageInfo') final PageInfo? pageInfo,
          @JsonKey(name: 'nodes') final List<StudioDto> nodes}) =
      _$StudioConnectionImpl;

  factory _StudioConnection.fromJson(Map<String, dynamic> json) =
      _$StudioConnectionImpl.fromJson;

  @override
  @JsonKey(name: 'pageInfo')
  PageInfo? get pageInfo;
  @override
  @JsonKey(name: 'nodes')
  List<StudioDto> get nodes;
  @override
  @JsonKey(ignore: true)
  _$$StudioConnectionImplCopyWith<_$StudioConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
