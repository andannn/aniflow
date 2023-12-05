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
  @JsonKey(name: 'characters')
  List<CharacterDto> get characters => throw _privateConstructorUsedError;
  @JsonKey(name: 'characterRole')
  CharacterRole get characterRole => throw _privateConstructorUsedError;
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
      @JsonKey(name: 'characters') List<CharacterDto> characters,
      @JsonKey(name: 'characterRole') CharacterRole characterRole,
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
    Object? characters = null,
    Object? characterRole = null,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      relationType: null == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as MediaRelation,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<CharacterDto>,
      characterRole: null == characterRole
          ? _value.characterRole
          : characterRole // ignore: cast_nullable_to_non_nullable
              as CharacterRole,
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
abstract class _$$MediaEdgeImplCopyWith<$Res>
    implements $MediaEdgeCopyWith<$Res> {
  factory _$$MediaEdgeImplCopyWith(
          _$MediaEdgeImpl value, $Res Function(_$MediaEdgeImpl) then) =
      __$$MediaEdgeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'relationType') MediaRelation relationType,
      @JsonKey(name: 'characters') List<CharacterDto> characters,
      @JsonKey(name: 'characterRole') CharacterRole characterRole,
      @JsonKey(name: 'node') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$MediaEdgeImplCopyWithImpl<$Res>
    extends _$MediaEdgeCopyWithImpl<$Res, _$MediaEdgeImpl>
    implements _$$MediaEdgeImplCopyWith<$Res> {
  __$$MediaEdgeImplCopyWithImpl(
      _$MediaEdgeImpl _value, $Res Function(_$MediaEdgeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? relationType = null,
    Object? characters = null,
    Object? characterRole = null,
    Object? media = freezed,
  }) {
    return _then(_$MediaEdgeImpl(
      relationType: null == relationType
          ? _value.relationType
          : relationType // ignore: cast_nullable_to_non_nullable
              as MediaRelation,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<CharacterDto>,
      characterRole: null == characterRole
          ? _value.characterRole
          : characterRole // ignore: cast_nullable_to_non_nullable
              as CharacterRole,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaEdgeImpl implements _MediaEdge {
  _$MediaEdgeImpl(
      {@JsonKey(name: 'relationType') this.relationType = MediaRelation.other,
      @JsonKey(name: 'characters')
      final List<CharacterDto> characters = const [],
      @JsonKey(name: 'characterRole')
      this.characterRole = CharacterRole.supporting,
      @JsonKey(name: 'node') this.media})
      : _characters = characters;

  factory _$MediaEdgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaEdgeImplFromJson(json);

  @override
  @JsonKey(name: 'relationType')
  final MediaRelation relationType;
  final List<CharacterDto> _characters;
  @override
  @JsonKey(name: 'characters')
  List<CharacterDto> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  @JsonKey(name: 'characterRole')
  final CharacterRole characterRole;
  @override
  @JsonKey(name: 'node')
  final MediaDto? media;

  @override
  String toString() {
    return 'MediaEdge(relationType: $relationType, characters: $characters, characterRole: $characterRole, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaEdgeImpl &&
            (identical(other.relationType, relationType) ||
                other.relationType == relationType) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            (identical(other.characterRole, characterRole) ||
                other.characterRole == characterRole) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, relationType,
      const DeepCollectionEquality().hash(_characters), characterRole, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaEdgeImplCopyWith<_$MediaEdgeImpl> get copyWith =>
      __$$MediaEdgeImplCopyWithImpl<_$MediaEdgeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaEdgeImplToJson(
      this,
    );
  }
}

abstract class _MediaEdge implements MediaEdge {
  factory _MediaEdge(
      {@JsonKey(name: 'relationType') final MediaRelation relationType,
      @JsonKey(name: 'characters') final List<CharacterDto> characters,
      @JsonKey(name: 'characterRole') final CharacterRole characterRole,
      @JsonKey(name: 'node') final MediaDto? media}) = _$MediaEdgeImpl;

  factory _MediaEdge.fromJson(Map<String, dynamic> json) =
      _$MediaEdgeImpl.fromJson;

  @override
  @JsonKey(name: 'relationType')
  MediaRelation get relationType;
  @override
  @JsonKey(name: 'characters')
  List<CharacterDto> get characters;
  @override
  @JsonKey(name: 'characterRole')
  CharacterRole get characterRole;
  @override
  @JsonKey(name: 'node')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$MediaEdgeImplCopyWith<_$MediaEdgeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
