// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'anime_rank.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AnimeRank _$AnimeRankFromJson(Map<String, dynamic> json) {
  return _AnimeRank.fromJson(json);
}

/// @nodoc
mixin _$AnimeRank {
  @JsonKey(name: 'rank')
  int? get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'allTime')
  bool? get allTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnimeRankCopyWith<AnimeRank> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimeRankCopyWith<$Res> {
  factory $AnimeRankCopyWith(AnimeRank value, $Res Function(AnimeRank) then) =
      _$AnimeRankCopyWithImpl<$Res, AnimeRank>;
  @useResult
  $Res call(
      {@JsonKey(name: 'rank') int? rank,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'allTime') bool? allTime});
}

/// @nodoc
class _$AnimeRankCopyWithImpl<$Res, $Val extends AnimeRank>
    implements $AnimeRankCopyWith<$Res> {
  _$AnimeRankCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = freezed,
    Object? type = freezed,
    Object? allTime = freezed,
  }) {
    return _then(_value.copyWith(
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      allTime: freezed == allTime
          ? _value.allTime
          : allTime // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AnimeRankCopyWith<$Res> implements $AnimeRankCopyWith<$Res> {
  factory _$$_AnimeRankCopyWith(
          _$_AnimeRank value, $Res Function(_$_AnimeRank) then) =
      __$$_AnimeRankCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rank') int? rank,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'allTime') bool? allTime});
}

/// @nodoc
class __$$_AnimeRankCopyWithImpl<$Res>
    extends _$AnimeRankCopyWithImpl<$Res, _$_AnimeRank>
    implements _$$_AnimeRankCopyWith<$Res> {
  __$$_AnimeRankCopyWithImpl(
      _$_AnimeRank _value, $Res Function(_$_AnimeRank) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = freezed,
    Object? type = freezed,
    Object? allTime = freezed,
  }) {
    return _then(_$_AnimeRank(
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      allTime: freezed == allTime
          ? _value.allTime
          : allTime // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AnimeRank implements _AnimeRank {
  _$_AnimeRank(
      {@JsonKey(name: 'rank') this.rank,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'allTime') this.allTime});

  factory _$_AnimeRank.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeRankFromJson(json);

  @override
  @JsonKey(name: 'rank')
  final int? rank;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'allTime')
  final bool? allTime;

  @override
  String toString() {
    return 'AnimeRank(rank: $rank, type: $type, allTime: $allTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnimeRank &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.allTime, allTime) || other.allTime == allTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rank, type, allTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AnimeRankCopyWith<_$_AnimeRank> get copyWith =>
      __$$_AnimeRankCopyWithImpl<_$_AnimeRank>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AnimeRankToJson(
      this,
    );
  }
}

abstract class _AnimeRank implements AnimeRank {
  factory _AnimeRank(
      {@JsonKey(name: 'rank') final int? rank,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'allTime') final bool? allTime}) = _$_AnimeRank;

  factory _AnimeRank.fromJson(Map<String, dynamic> json) =
      _$_AnimeRank.fromJson;

  @override
  @JsonKey(name: 'rank')
  int? get rank;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'allTime')
  bool? get allTime;
  @override
  @JsonKey(ignore: true)
  _$$_AnimeRankCopyWith<_$_AnimeRank> get copyWith =>
      throw _privateConstructorUsedError;
}
