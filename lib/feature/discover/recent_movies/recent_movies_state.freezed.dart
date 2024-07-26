// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecentMoviesState {
  List<MediaModel> get movies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentMoviesStateCopyWith<RecentMoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentMoviesStateCopyWith<$Res> {
  factory $RecentMoviesStateCopyWith(
          RecentMoviesState value, $Res Function(RecentMoviesState) then) =
      _$RecentMoviesStateCopyWithImpl<$Res, RecentMoviesState>;
  @useResult
  $Res call({List<MediaModel> movies});
}

/// @nodoc
class _$RecentMoviesStateCopyWithImpl<$Res, $Val extends RecentMoviesState>
    implements $RecentMoviesStateCopyWith<$Res> {
  _$RecentMoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_value.copyWith(
      movies: null == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentMoviesStateImplCopyWith<$Res>
    implements $RecentMoviesStateCopyWith<$Res> {
  factory _$$RecentMoviesStateImplCopyWith(_$RecentMoviesStateImpl value,
          $Res Function(_$RecentMoviesStateImpl) then) =
      __$$RecentMoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MediaModel> movies});
}

/// @nodoc
class __$$RecentMoviesStateImplCopyWithImpl<$Res>
    extends _$RecentMoviesStateCopyWithImpl<$Res, _$RecentMoviesStateImpl>
    implements _$$RecentMoviesStateImplCopyWith<$Res> {
  __$$RecentMoviesStateImplCopyWithImpl(_$RecentMoviesStateImpl _value,
      $Res Function(_$RecentMoviesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
  }) {
    return _then(_$RecentMoviesStateImpl(
      movies: null == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
    ));
  }
}

/// @nodoc

class _$RecentMoviesStateImpl implements _RecentMoviesState {
  const _$RecentMoviesStateImpl({final List<MediaModel> movies = const []})
      : _movies = movies;

  final List<MediaModel> _movies;
  @override
  @JsonKey()
  List<MediaModel> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  String toString() {
    return 'RecentMoviesState(movies: $movies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentMoviesStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_movies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentMoviesStateImplCopyWith<_$RecentMoviesStateImpl> get copyWith =>
      __$$RecentMoviesStateImplCopyWithImpl<_$RecentMoviesStateImpl>(
          this, _$identity);
}

abstract class _RecentMoviesState implements RecentMoviesState {
  const factory _RecentMoviesState({final List<MediaModel> movies}) =
      _$RecentMoviesStateImpl;

  @override
  List<MediaModel> get movies;
  @override
  @JsonKey(ignore: true)
  _$$RecentMoviesStateImplCopyWith<_$RecentMoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
