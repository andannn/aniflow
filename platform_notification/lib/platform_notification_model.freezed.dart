// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlatformNotificationModel _$PlatformNotificationModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$PlatformNotificationModel {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "body")
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: "notification_channel")
  PlatformNotificationChannelModel? get notificationChannel =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlatformNotificationModelCopyWith<PlatformNotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformNotificationModelCopyWith<$Res> {
  factory $PlatformNotificationModelCopyWith(PlatformNotificationModel value,
          $Res Function(PlatformNotificationModel) then) =
      _$PlatformNotificationModelCopyWithImpl<$Res, PlatformNotificationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "notification_channel")
      PlatformNotificationChannelModel? notificationChannel});

  $PlatformNotificationChannelModelCopyWith<$Res>? get notificationChannel;
}

/// @nodoc
class _$PlatformNotificationModelCopyWithImpl<$Res,
        $Val extends PlatformNotificationModel>
    implements $PlatformNotificationModelCopyWith<$Res> {
  _$PlatformNotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? notificationChannel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationChannel: freezed == notificationChannel
          ? _value.notificationChannel
          : notificationChannel // ignore: cast_nullable_to_non_nullable
              as PlatformNotificationChannelModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PlatformNotificationChannelModelCopyWith<$Res>? get notificationChannel {
    if (_value.notificationChannel == null) {
      return null;
    }

    return $PlatformNotificationChannelModelCopyWith<$Res>(
        _value.notificationChannel!, (value) {
      return _then(_value.copyWith(notificationChannel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $PlatformNotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "body") String? body,
      @JsonKey(name: "notification_channel")
      PlatformNotificationChannelModel? notificationChannel});

  @override
  $PlatformNotificationChannelModelCopyWith<$Res>? get notificationChannel;
}

/// @nodoc
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$PlatformNotificationModelCopyWithImpl<$Res,
        _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? notificationChannel = freezed,
  }) {
    return _then(_$NotificationModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      notificationChannel: freezed == notificationChannel
          ? _value.notificationChannel
          : notificationChannel // ignore: cast_nullable_to_non_nullable
              as PlatformNotificationChannelModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  const _$NotificationModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "body") this.body,
      @JsonKey(name: "notification_channel") this.notificationChannel});

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "body")
  final String? body;
  @override
  @JsonKey(name: "notification_channel")
  final PlatformNotificationChannelModel? notificationChannel;

  @override
  String toString() {
    return 'PlatformNotificationModel(id: $id, title: $title, body: $body, notificationChannel: $notificationChannel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.notificationChannel, notificationChannel) ||
                other.notificationChannel == notificationChannel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, body, notificationChannel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements PlatformNotificationModel {
  const factory _NotificationModel(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "body") final String? body,
          @JsonKey(name: "notification_channel")
          final PlatformNotificationChannelModel? notificationChannel}) =
      _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "body")
  String? get body;
  @override
  @JsonKey(name: "notification_channel")
  PlatformNotificationChannelModel? get notificationChannel;
  @override
  @JsonKey(ignore: true)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
