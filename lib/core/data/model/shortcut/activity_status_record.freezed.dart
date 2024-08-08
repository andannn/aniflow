// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_status_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ActivityStatusRecord {
  int get likeCount => throw _privateConstructorUsedError;
  int get replyCount => throw _privateConstructorUsedError;
  bool get isLiked => throw _privateConstructorUsedError;

  /// Create a copy of ActivityStatusRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityStatusRecordCopyWith<ActivityStatusRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityStatusRecordCopyWith<$Res> {
  factory $ActivityStatusRecordCopyWith(ActivityStatusRecord value,
          $Res Function(ActivityStatusRecord) then) =
      _$ActivityStatusRecordCopyWithImpl<$Res, ActivityStatusRecord>;
  @useResult
  $Res call({int likeCount, int replyCount, bool isLiked});
}

/// @nodoc
class _$ActivityStatusRecordCopyWithImpl<$Res,
        $Val extends ActivityStatusRecord>
    implements $ActivityStatusRecordCopyWith<$Res> {
  _$ActivityStatusRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityStatusRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likeCount = null,
    Object? replyCount = null,
    Object? isLiked = null,
  }) {
    return _then(_value.copyWith(
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityStatusRecordImplCopyWith<$Res>
    implements $ActivityStatusRecordCopyWith<$Res> {
  factory _$$ActivityStatusRecordImplCopyWith(_$ActivityStatusRecordImpl value,
          $Res Function(_$ActivityStatusRecordImpl) then) =
      __$$ActivityStatusRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int likeCount, int replyCount, bool isLiked});
}

/// @nodoc
class __$$ActivityStatusRecordImplCopyWithImpl<$Res>
    extends _$ActivityStatusRecordCopyWithImpl<$Res, _$ActivityStatusRecordImpl>
    implements _$$ActivityStatusRecordImplCopyWith<$Res> {
  __$$ActivityStatusRecordImplCopyWithImpl(_$ActivityStatusRecordImpl _value,
      $Res Function(_$ActivityStatusRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityStatusRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? likeCount = null,
    Object? replyCount = null,
    Object? isLiked = null,
  }) {
    return _then(_$ActivityStatusRecordImpl(
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      replyCount: null == replyCount
          ? _value.replyCount
          : replyCount // ignore: cast_nullable_to_non_nullable
              as int,
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ActivityStatusRecordImpl implements _ActivityStatusRecord {
  _$ActivityStatusRecordImpl(
      {this.likeCount = 0, this.replyCount = 0, this.isLiked = false});

  @override
  @JsonKey()
  final int likeCount;
  @override
  @JsonKey()
  final int replyCount;
  @override
  @JsonKey()
  final bool isLiked;

  @override
  String toString() {
    return 'ActivityStatusRecord(likeCount: $likeCount, replyCount: $replyCount, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityStatusRecordImpl &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.replyCount, replyCount) ||
                other.replyCount == replyCount) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, likeCount, replyCount, isLiked);

  /// Create a copy of ActivityStatusRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityStatusRecordImplCopyWith<_$ActivityStatusRecordImpl>
      get copyWith =>
          __$$ActivityStatusRecordImplCopyWithImpl<_$ActivityStatusRecordImpl>(
              this, _$identity);
}

abstract class _ActivityStatusRecord implements ActivityStatusRecord {
  factory _ActivityStatusRecord(
      {final int likeCount,
      final int replyCount,
      final bool isLiked}) = _$ActivityStatusRecordImpl;

  @override
  int get likeCount;
  @override
  int get replyCount;
  @override
  bool get isLiked;

  /// Create a copy of ActivityStatusRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityStatusRecordImplCopyWith<_$ActivityStatusRecordImpl>
      get copyWith => throw _privateConstructorUsedError;
}
