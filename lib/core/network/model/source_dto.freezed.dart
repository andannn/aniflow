// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'source_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SourceDto _$SourceDtoFromJson(Map<String, dynamic> json) {
  return _SourceDto.fromJson(json);
}

/// @nodoc
mixin _$SourceDto {
  String get sources => throw _privateConstructorUsedError;
  String? get sourcesBackup => throw _privateConstructorUsedError;
  List<TrackDto> get tracks => throw _privateConstructorUsedError;
  int? get server => throw _privateConstructorUsedError;

  /// Serializes this SourceDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SourceDtoCopyWith<SourceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SourceDtoCopyWith<$Res> {
  factory $SourceDtoCopyWith(SourceDto value, $Res Function(SourceDto) then) =
      _$SourceDtoCopyWithImpl<$Res, SourceDto>;
  @useResult
  $Res call(
      {String sources,
      String? sourcesBackup,
      List<TrackDto> tracks,
      int? server});
}

/// @nodoc
class _$SourceDtoCopyWithImpl<$Res, $Val extends SourceDto>
    implements $SourceDtoCopyWith<$Res> {
  _$SourceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? sourcesBackup = freezed,
    Object? tracks = null,
    Object? server = freezed,
  }) {
    return _then(_value.copyWith(
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as String,
      sourcesBackup: freezed == sourcesBackup
          ? _value.sourcesBackup
          : sourcesBackup // ignore: cast_nullable_to_non_nullable
              as String?,
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<TrackDto>,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SourceDtoImplCopyWith<$Res>
    implements $SourceDtoCopyWith<$Res> {
  factory _$$SourceDtoImplCopyWith(
          _$SourceDtoImpl value, $Res Function(_$SourceDtoImpl) then) =
      __$$SourceDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sources,
      String? sourcesBackup,
      List<TrackDto> tracks,
      int? server});
}

/// @nodoc
class __$$SourceDtoImplCopyWithImpl<$Res>
    extends _$SourceDtoCopyWithImpl<$Res, _$SourceDtoImpl>
    implements _$$SourceDtoImplCopyWith<$Res> {
  __$$SourceDtoImplCopyWithImpl(
      _$SourceDtoImpl _value, $Res Function(_$SourceDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SourceDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sources = null,
    Object? sourcesBackup = freezed,
    Object? tracks = null,
    Object? server = freezed,
  }) {
    return _then(_$SourceDtoImpl(
      sources: null == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as String,
      sourcesBackup: freezed == sourcesBackup
          ? _value.sourcesBackup
          : sourcesBackup // ignore: cast_nullable_to_non_nullable
              as String?,
      tracks: null == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<TrackDto>,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SourceDtoImpl implements _SourceDto {
  const _$SourceDtoImpl(
      {required this.sources,
      this.sourcesBackup,
      final List<TrackDto> tracks = const [],
      this.server})
      : _tracks = tracks;

  factory _$SourceDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SourceDtoImplFromJson(json);

  @override
  final String sources;
  @override
  final String? sourcesBackup;
  final List<TrackDto> _tracks;
  @override
  @JsonKey()
  List<TrackDto> get tracks {
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tracks);
  }

  @override
  final int? server;

  @override
  String toString() {
    return 'SourceDto(sources: $sources, sourcesBackup: $sourcesBackup, tracks: $tracks, server: $server)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SourceDtoImpl &&
            (identical(other.sources, sources) || other.sources == sources) &&
            (identical(other.sourcesBackup, sourcesBackup) ||
                other.sourcesBackup == sourcesBackup) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            (identical(other.server, server) || other.server == server));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, sources, sourcesBackup,
      const DeepCollectionEquality().hash(_tracks), server);

  /// Create a copy of SourceDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SourceDtoImplCopyWith<_$SourceDtoImpl> get copyWith =>
      __$$SourceDtoImplCopyWithImpl<_$SourceDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SourceDtoImplToJson(
      this,
    );
  }
}

abstract class _SourceDto implements SourceDto {
  const factory _SourceDto(
      {required final String sources,
      final String? sourcesBackup,
      final List<TrackDto> tracks,
      final int? server}) = _$SourceDtoImpl;

  factory _SourceDto.fromJson(Map<String, dynamic> json) =
      _$SourceDtoImpl.fromJson;

  @override
  String get sources;
  @override
  String? get sourcesBackup;
  @override
  List<TrackDto> get tracks;
  @override
  int? get server;

  /// Create a copy of SourceDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SourceDtoImplCopyWith<_$SourceDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
