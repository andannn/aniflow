// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_with_episodes_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubjectWithEpisodesModel _$SubjectWithEpisodesModelFromJson(
    Map<String, dynamic> json) {
  return _SubjectWithEpisodesModel.fromJson(json);
}

/// @nodoc
mixin _$SubjectWithEpisodesModel {
  String get title => throw _privateConstructorUsedError;
  String get originalPageUrl => throw _privateConstructorUsedError;
  List<EpisodeModel> get episodes => throw _privateConstructorUsedError;

  /// Serializes this SubjectWithEpisodesModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubjectWithEpisodesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubjectWithEpisodesModelCopyWith<SubjectWithEpisodesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectWithEpisodesModelCopyWith<$Res> {
  factory $SubjectWithEpisodesModelCopyWith(SubjectWithEpisodesModel value,
          $Res Function(SubjectWithEpisodesModel) then) =
      _$SubjectWithEpisodesModelCopyWithImpl<$Res, SubjectWithEpisodesModel>;
  @useResult
  $Res call(
      {String title, String originalPageUrl, List<EpisodeModel> episodes});
}

/// @nodoc
class _$SubjectWithEpisodesModelCopyWithImpl<$Res,
        $Val extends SubjectWithEpisodesModel>
    implements $SubjectWithEpisodesModelCopyWith<$Res> {
  _$SubjectWithEpisodesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubjectWithEpisodesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? originalPageUrl = null,
    Object? episodes = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalPageUrl: null == originalPageUrl
          ? _value.originalPageUrl
          : originalPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      episodes: null == episodes
          ? _value.episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectWithEpisodesModelImplCopyWith<$Res>
    implements $SubjectWithEpisodesModelCopyWith<$Res> {
  factory _$$SubjectWithEpisodesModelImplCopyWith(
          _$SubjectWithEpisodesModelImpl value,
          $Res Function(_$SubjectWithEpisodesModelImpl) then) =
      __$$SubjectWithEpisodesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String originalPageUrl, List<EpisodeModel> episodes});
}

/// @nodoc
class __$$SubjectWithEpisodesModelImplCopyWithImpl<$Res>
    extends _$SubjectWithEpisodesModelCopyWithImpl<$Res,
        _$SubjectWithEpisodesModelImpl>
    implements _$$SubjectWithEpisodesModelImplCopyWith<$Res> {
  __$$SubjectWithEpisodesModelImplCopyWithImpl(
      _$SubjectWithEpisodesModelImpl _value,
      $Res Function(_$SubjectWithEpisodesModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubjectWithEpisodesModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? originalPageUrl = null,
    Object? episodes = null,
  }) {
    return _then(_$SubjectWithEpisodesModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      originalPageUrl: null == originalPageUrl
          ? _value.originalPageUrl
          : originalPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      episodes: null == episodes
          ? _value._episodes
          : episodes // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectWithEpisodesModelImpl implements _SubjectWithEpisodesModel {
  const _$SubjectWithEpisodesModelImpl(
      {required this.title,
      required this.originalPageUrl,
      required final List<EpisodeModel> episodes})
      : _episodes = episodes;

  factory _$SubjectWithEpisodesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectWithEpisodesModelImplFromJson(json);

  @override
  final String title;
  @override
  final String originalPageUrl;
  final List<EpisodeModel> _episodes;
  @override
  List<EpisodeModel> get episodes {
    if (_episodes is EqualUnmodifiableListView) return _episodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_episodes);
  }

  @override
  String toString() {
    return 'SubjectWithEpisodesModel(title: $title, originalPageUrl: $originalPageUrl, episodes: $episodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectWithEpisodesModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.originalPageUrl, originalPageUrl) ||
                other.originalPageUrl == originalPageUrl) &&
            const DeepCollectionEquality().equals(other._episodes, _episodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, originalPageUrl,
      const DeepCollectionEquality().hash(_episodes));

  /// Create a copy of SubjectWithEpisodesModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectWithEpisodesModelImplCopyWith<_$SubjectWithEpisodesModelImpl>
      get copyWith => __$$SubjectWithEpisodesModelImplCopyWithImpl<
          _$SubjectWithEpisodesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectWithEpisodesModelImplToJson(
      this,
    );
  }
}

abstract class _SubjectWithEpisodesModel implements SubjectWithEpisodesModel {
  const factory _SubjectWithEpisodesModel(
          {required final String title,
          required final String originalPageUrl,
          required final List<EpisodeModel> episodes}) =
      _$SubjectWithEpisodesModelImpl;

  factory _SubjectWithEpisodesModel.fromJson(Map<String, dynamic> json) =
      _$SubjectWithEpisodesModelImpl.fromJson;

  @override
  String get title;
  @override
  String get originalPageUrl;
  @override
  List<EpisodeModel> get episodes;

  /// Create a copy of SubjectWithEpisodesModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubjectWithEpisodesModelImplCopyWith<_$SubjectWithEpisodesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
