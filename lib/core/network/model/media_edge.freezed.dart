// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_edge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaEdge _$MediaEdgeFromJson(Map<String, dynamic> json) {
  return _MediaEdge.fromJson(json);
}

/// @nodoc
mixin _$MediaEdge {
  @JsonKey(name: 'relationType')
  MediaRelation get relationType => throw _privateConstructorUsedError;
  @JsonKey(name: 'node')
  MediaDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaEdgeCopyWith<MediaEdge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaEdgeCopyWith<$Res> {
  factory $MediaEdgeCopyWith(MediaEdge value, $Res Function(MediaEdge) then) =
      _$MediaEdgeCopyWithImpl<$Res, MediaEdge>;
  @useResult
  $Res call(
      {@JsonKey(name: 'relationType') MediaRelation relationType,
      @JsonKey(name: 'node') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$MediaEdgeCopyWithImpl<$Res, $Val extends MediaEdge>
    implements $MediaEdgeCopyWith<$Res> {
  _$MediaEdgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationType = null,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      relationType: null == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as MediaRelation,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaDtoCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaDtoCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MediaEdgeCopyWith<$Res> implements $MediaEdgeCopyWith<$Res> {
  factory _$$_MediaEdgeCopyWith(
          _$_MediaEdge value, $Res Function(_$_MediaEdge) then) =
      __$$_MediaEdgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'relationType') MediaRelation relationType,
      @JsonKey(name: 'node') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_MediaEdgeCopyWithImpl<$Res>
    extends _$MediaEdgeCopyWithImpl<$Res, _$_MediaEdge>
    implements _$$_MediaEdgeCopyWith<$Res> {
  __$$_MediaEdgeCopyWithImpl(
      _$_MediaEdge _value, $Res Function(_$_MediaEdge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationType = null,
    Object? media = freezed,
  }) {
    return _then(_$_MediaEdge(
      relationType: null == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as MediaRelation,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaEdge implements _MediaEdge {
  _$_MediaEdge(
      {@JsonKey(name: 'relationType') this.relationType = MediaRelation.other,
      @JsonKey(name: 'node') this.media});

  factory _$_MediaEdge.fromJson(Map<String, dynamic> json) =>
      _$$_MediaEdgeFromJson(json);

  @override
  @JsonKey(name: 'relationType')
  final MediaRelation relationType;
  @override
  @JsonKey(name: 'node')
  final MediaDto? media;

  @override
  String toString() {
    return 'MediaEdge(relationType: $relationType, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaEdge &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, relationType, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaEdgeCopyWith<_$_MediaEdge> get copyWith =>
      __$$_MediaEdgeCopyWithImpl<_$_MediaEdge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaEdgeToJson(
      this,
    );
  }
}

abstract class _MediaEdge implements MediaEdge {
  factory _MediaEdge(
      {@JsonKey(name: 'relationType') final MediaRelation relationType,
      @JsonKey(name: 'node') final MediaDto? media}) = _$_MediaEdge;

  factory _MediaEdge.fromJson(Map<String, dynamic> json) =
      _$_MediaEdge.fromJson;

  @override
  @JsonKey(name: 'relationType')
  MediaRelation get relationType;
  @override
  @JsonKey(name: 'node')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_MediaEdgeCopyWith<_$_MediaEdge> get copyWith =>
      throw _privateConstructorUsedError;
}
