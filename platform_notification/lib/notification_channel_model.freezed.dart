// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_channel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationChannelModel _$NotificationChannelModelFromJson(
    Map<String, dynamic> json) {
  return _NotificationChannelModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationChannelModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "importance")
  int? get importance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationChannelModelCopyWith<NotificationChannelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationChannelModelCopyWith<$Res> {
  factory $NotificationChannelModelCopyWith(NotificationChannelModel value,
          $Res Function(NotificationChannelModel) then) =
      _$NotificationChannelModelCopyWithImpl<$Res, NotificationChannelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "importance") int? importance});
}

/// @nodoc
class _$NotificationChannelModelCopyWithImpl<$Res,
        $Val extends NotificationChannelModel>
    implements $NotificationChannelModelCopyWith<$Res> {
  _$NotificationChannelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? importance = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationChannelModelImplCopyWith<$Res>
    implements $NotificationChannelModelCopyWith<$Res> {
  factory _$$NotificationChannelModelImplCopyWith(
          _$NotificationChannelModelImpl value,
          $Res Function(_$NotificationChannelModelImpl) then) =
      __$$NotificationChannelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "importance") int? importance});
}

/// @nodoc
class __$$NotificationChannelModelImplCopyWithImpl<$Res>
    extends _$NotificationChannelModelCopyWithImpl<$Res,
        _$NotificationChannelModelImpl>
    implements _$$NotificationChannelModelImplCopyWith<$Res> {
  __$$NotificationChannelModelImplCopyWithImpl(
      _$NotificationChannelModelImpl _value,
      $Res Function(_$NotificationChannelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? importance = freezed,
  }) {
    return _then(_$NotificationChannelModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      importance: freezed == importance
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationChannelModelImpl implements _NotificationChannelModel {
  const _$NotificationChannelModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "importance") this.importance});

  factory _$NotificationChannelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationChannelModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "importance")
  final int? importance;

  @override
  String toString() {
    return 'NotificationChannelModel(id: $id, name: $name, description: $description, importance: $importance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationChannelModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.importance, importance) ||
                other.importance == importance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, importance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationChannelModelImplCopyWith<_$NotificationChannelModelImpl>
      get copyWith => __$$NotificationChannelModelImplCopyWithImpl<
          _$NotificationChannelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationChannelModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationChannelModel implements NotificationChannelModel {
  const factory _NotificationChannelModel(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "name") final String? name,
          @JsonKey(name: "description") final String? description,
          @JsonKey(name: "importance") final int? importance}) =
      _$NotificationChannelModelImpl;

  factory _NotificationChannelModel.fromJson(Map<String, dynamic> json) =
      _$NotificationChannelModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "importance")
  int? get importance;
  @override
  @JsonKey(ignore: true)
  _$$NotificationChannelModelImplCopyWith<_$NotificationChannelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
