// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'related_media_addition_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RelatedMediaAdditionNotificationDto
    _$RelatedMediaAdditionNotificationDtoFromJson(Map<String, dynamic> json) {
  return _RelatedMediaAdditionNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$RelatedMediaAdditionNotificationDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'mediaId')
  int? get mediaId => throw _privateConstructorUsedError;
  @JsonKey(name: 'contexts')
  List<String> get contexts => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  int? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaDto? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RelatedMediaAdditionNotificationDtoCopyWith<
          RelatedMediaAdditionNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RelatedMediaAdditionNotificationDtoCopyWith<$Res> {
  factory $RelatedMediaAdditionNotificationDtoCopyWith(
          RelatedMediaAdditionNotificationDto value,
          $Res Function(RelatedMediaAdditionNotificationDto) then) =
      _$RelatedMediaAdditionNotificationDtoCopyWithImpl<$Res,
          RelatedMediaAdditionNotificationDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'media') MediaDto? media});

  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class _$RelatedMediaAdditionNotificationDtoCopyWithImpl<$Res,
        $Val extends RelatedMediaAdditionNotificationDto>
    implements $RelatedMediaAdditionNotificationDtoCopyWith<$Res> {
  _$RelatedMediaAdditionNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? contexts = null,
    Object? createdAt = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      contexts: null == contexts
          ? _value.contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_RelatedMediaAdditionNotificationDtoCopyWith<$Res>
    implements $RelatedMediaAdditionNotificationDtoCopyWith<$Res> {
  factory _$$_RelatedMediaAdditionNotificationDtoCopyWith(
          _$_RelatedMediaAdditionNotificationDto value,
          $Res Function(_$_RelatedMediaAdditionNotificationDto) then) =
      __$$_RelatedMediaAdditionNotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') NotificationType? type,
      @JsonKey(name: 'mediaId') int? mediaId,
      @JsonKey(name: 'contexts') List<String> contexts,
      @JsonKey(name: 'createdAt') int? createdAt,
      @JsonKey(name: 'media') MediaDto? media});

  @override
  $MediaDtoCopyWith<$Res>? get media;
}

/// @nodoc
class __$$_RelatedMediaAdditionNotificationDtoCopyWithImpl<$Res>
    extends _$RelatedMediaAdditionNotificationDtoCopyWithImpl<$Res,
        _$_RelatedMediaAdditionNotificationDto>
    implements _$$_RelatedMediaAdditionNotificationDtoCopyWith<$Res> {
  __$$_RelatedMediaAdditionNotificationDtoCopyWithImpl(
      _$_RelatedMediaAdditionNotificationDto _value,
      $Res Function(_$_RelatedMediaAdditionNotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? mediaId = freezed,
    Object? contexts = null,
    Object? createdAt = freezed,
    Object? media = freezed,
  }) {
    return _then(_$_RelatedMediaAdditionNotificationDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      mediaId: freezed == mediaId
          ? _value.mediaId
          : mediaId // ignore: cast_nullable_to_non_nullable
              as int?,
      contexts: null == contexts
          ? _value._contexts
          : contexts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaDto?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RelatedMediaAdditionNotificationDto
    implements _RelatedMediaAdditionNotificationDto {
  _$_RelatedMediaAdditionNotificationDto(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'mediaId') this.mediaId,
      @JsonKey(name: 'contexts') final List<String> contexts = const [],
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'media') this.media})
      : _contexts = contexts;

  factory _$_RelatedMediaAdditionNotificationDto.fromJson(
          Map<String, dynamic> json) =>
      _$$_RelatedMediaAdditionNotificationDtoFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final NotificationType? type;
  @override
  @JsonKey(name: 'mediaId')
  final int? mediaId;
  final List<String> _contexts;
  @override
  @JsonKey(name: 'contexts')
  List<String> get contexts {
    if (_contexts is EqualUnmodifiableListView) return _contexts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contexts);
  }

  @override
  @JsonKey(name: 'createdAt')
  final int? createdAt;
  @override
  @JsonKey(name: 'media')
  final MediaDto? media;

  @override
  String toString() {
    return 'RelatedMediaAdditionNotificationDto(id: $id, type: $type, mediaId: $mediaId, contexts: $contexts, createdAt: $createdAt, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RelatedMediaAdditionNotificationDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.mediaId, mediaId) || other.mediaId == mediaId) &&
            const DeepCollectionEquality().equals(other._contexts, _contexts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, mediaId,
      const DeepCollectionEquality().hash(_contexts), createdAt, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RelatedMediaAdditionNotificationDtoCopyWith<
          _$_RelatedMediaAdditionNotificationDto>
      get copyWith => __$$_RelatedMediaAdditionNotificationDtoCopyWithImpl<
          _$_RelatedMediaAdditionNotificationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RelatedMediaAdditionNotificationDtoToJson(
      this,
    );
  }
}

abstract class _RelatedMediaAdditionNotificationDto
    implements RelatedMediaAdditionNotificationDto {
  factory _RelatedMediaAdditionNotificationDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'type') final NotificationType? type,
          @JsonKey(name: 'mediaId') final int? mediaId,
          @JsonKey(name: 'contexts') final List<String> contexts,
          @JsonKey(name: 'createdAt') final int? createdAt,
          @JsonKey(name: 'media') final MediaDto? media}) =
      _$_RelatedMediaAdditionNotificationDto;

  factory _RelatedMediaAdditionNotificationDto.fromJson(
          Map<String, dynamic> json) =
      _$_RelatedMediaAdditionNotificationDto.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  NotificationType? get type;
  @override
  @JsonKey(name: 'mediaId')
  int? get mediaId;
  @override
  @JsonKey(name: 'contexts')
  List<String> get contexts;
  @override
  @JsonKey(name: 'createdAt')
  int? get createdAt;
  @override
  @JsonKey(name: 'media')
  MediaDto? get media;
  @override
  @JsonKey(ignore: true)
  _$$_RelatedMediaAdditionNotificationDtoCopyWith<
          _$_RelatedMediaAdditionNotificationDto>
      get copyWith => throw _privateConstructorUsedError;
}
