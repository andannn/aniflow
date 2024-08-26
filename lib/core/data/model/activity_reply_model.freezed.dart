// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivityReplyModel {
  String get id => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  UserModel? get user => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of ActivityReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityReplyModelCopyWith<ActivityReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityReplyModelCopyWith<$Res> {
  factory $ActivityReplyModelCopyWith(
          ActivityReplyModel value, $Res Function(ActivityReplyModel) then) =
      _$ActivityReplyModelCopyWithImpl<$Res, ActivityReplyModel>;
  @useResult
  $Res call(
      {String id,
      int likeCount,
      String text,
      UserModel? user,
      bool isLiked,
      int? createdAt});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$ActivityReplyModelCopyWithImpl<$Res, $Val extends ActivityReplyModel>
    implements $ActivityReplyModelCopyWith<$Res> {
  _$ActivityReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? likeCount = null,
    Object? text = null,
    Object? user = freezed,
    Object? isLiked = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ActivityReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityReplyModelImplCopyWith<$Res>
    implements $ActivityReplyModelCopyWith<$Res> {
  factory _$$ActivityReplyModelImplCopyWith(_$ActivityReplyModelImpl value,
          $Res Function(_$ActivityReplyModelImpl) then) =
      __$$ActivityReplyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int likeCount,
      String text,
      UserModel? user,
      bool isLiked,
      int? createdAt});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$ActivityReplyModelImplCopyWithImpl<$Res>
    extends _$ActivityReplyModelCopyWithImpl<$Res, _$ActivityReplyModelImpl>
    implements _$$ActivityReplyModelImplCopyWith<$Res> {
  __$$ActivityReplyModelImplCopyWithImpl(_$ActivityReplyModelImpl _value,
      $Res Function(_$ActivityReplyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? likeCount = null,
    Object? text = null,
    Object? user = freezed,
    Object? isLiked = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ActivityReplyModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ActivityReplyModelImpl implements _ActivityReplyModel {
  const _$ActivityReplyModelImpl(
      {this.id = "",
      this.likeCount = 0,
      this.text = "",
      this.user,
      this.isLiked = false,
      this.createdAt});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final String text;
  @override
  final UserModel? user;
  @override
  @JsonKey()
  final bool isLiked;
  @override
  final int? createdAt;

  @override
  String toString() {
    return 'ActivityReplyModel(id: $id, likeCount: $likeCount, text: $text, user: $user, isLiked: $isLiked, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityReplyModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, likeCount, text, user, isLiked, createdAt);

  /// Create a copy of ActivityReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityReplyModelImplCopyWith<_$ActivityReplyModelImpl> get copyWith =>
      __$$ActivityReplyModelImplCopyWithImpl<_$ActivityReplyModelImpl>(
          this, _$identity);
}

abstract class _ActivityReplyModel implements ActivityReplyModel {
  const factory _ActivityReplyModel(
      {final String id,
      final int likeCount,
      final String text,
      final UserModel? user,
      final bool isLiked,
      final int? createdAt}) = _$ActivityReplyModelImpl;

  @override
  String get id;
  @override
  int get likeCount;
  @override
  String get text;
  @override
  UserModel? get user;
  @override
  bool get isLiked;
  @override
  int? get createdAt;

  /// Create a copy of ActivityReplyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityReplyModelImplCopyWith<_$ActivityReplyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
