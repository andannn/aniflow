// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_with_episodes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubjectWithEpisodes {
  SearchedSubjectInfo get subject => throw _privateConstructorUsedError;
  List<EpisodeInfo> get episodes => throw _privateConstructorUsedError;

  /// Create a copy of SubjectWithEpisodes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectWithEpisodesCopyWith<SubjectWithEpisodes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectWithEpisodesCopyWith<$Res> {
  factory $SubjectWithEpisodesCopyWith(
          SubjectWithEpisodes value, $Res Function(SubjectWithEpisodes) then) =
      _$SubjectWithEpisodesCopyWithImpl<$Res, SubjectWithEpisodes>;
  @useResult
  $Res call({SearchedSubjectInfo subject, List<EpisodeInfo> episodes});
}

/// @nodoc
class _$SubjectWithEpisodesCopyWithImpl<$Res, $Val extends SubjectWithEpisodes>
    implements $SubjectWithEpisodesCopyWith<$Res> {
  _$SubjectWithEpisodesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectWithEpisodes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? episodes = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SearchedSubjectInfo,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectWithEpisodesImplCopyWith<$Res>
    implements $SubjectWithEpisodesCopyWith<$Res> {
  factory _$$SubjectWithEpisodesImplCopyWith(_$SubjectWithEpisodesImpl value,
          $Res Function(_$SubjectWithEpisodesImpl) then) =
      __$$SubjectWithEpisodesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SearchedSubjectInfo subject, List<EpisodeInfo> episodes});
}

/// @nodoc
class __$$SubjectWithEpisodesImplCopyWithImpl<$Res>
    extends _$SubjectWithEpisodesCopyWithImpl<$Res, _$SubjectWithEpisodesImpl>
    implements _$$SubjectWithEpisodesImplCopyWith<$Res> {
  __$$SubjectWithEpisodesImplCopyWithImpl(_$SubjectWithEpisodesImpl _value,
      $Res Function(_$SubjectWithEpisodesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectWithEpisodes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? episodes = null,
  }) {
    return _then(_$SubjectWithEpisodesImpl(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SearchedSubjectInfo,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeInfo>,
    ));
  }
}

/// @nodoc

class _$SubjectWithEpisodesImpl implements _SubjectWithEpisodes {
  const _$SubjectWithEpisodesImpl(
      {required this.subject, final List<EpisodeInfo> episodes = const []})
      : _episodes = episodes;

  @override
  final SearchedSubjectInfo subject;
  final List<EpisodeInfo> _episodes;
  @override
  @JsonKey()
  List<EpisodeInfo> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  String toString() {
    return 'SubjectWithEpisodes(subject: $subject, episodes: $episodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectWithEpisodesImpl &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, subject, const DeepCollectionEquality().hash(_episodes));

  /// Create a copy of SubjectWithEpisodes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectWithEpisodesImplCopyWith<_$SubjectWithEpisodesImpl> get copyWith =>
      __$$SubjectWithEpisodesImplCopyWithImpl<_$SubjectWithEpisodesImpl>(
          this, _$identity);
}

abstract class _SubjectWithEpisodes implements SubjectWithEpisodes {
  const factory _SubjectWithEpisodes(
      {required final SearchedSubjectInfo subject,
      final List<EpisodeInfo> episodes}) = _$SubjectWithEpisodesImpl;

  @override
  SearchedSubjectInfo get subject;
  @override
  List<EpisodeInfo> get episodes;

  /// Create a copy of SubjectWithEpisodes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectWithEpisodesImplCopyWith<_$SubjectWithEpisodesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
