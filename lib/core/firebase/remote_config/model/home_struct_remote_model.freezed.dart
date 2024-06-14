// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_struct_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeStructRemoteModel _$HomeStructRemoteModelFromJson(
    Map<String, dynamic> json) {
  return _HomeStructRemoteModel.fromJson(json);
}

/// @nodoc
mixin _$HomeStructRemoteModel {
  @JsonKey(name: 'anime')
  List<HomeSectorCategory> get anime => throw _privateConstructorUsedError;
  @JsonKey(name: 'manga')
  List<HomeSectorCategory> get manga => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeStructRemoteModelCopyWith<HomeStructRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStructRemoteModelCopyWith<$Res> {
  factory $HomeStructRemoteModelCopyWith(HomeStructRemoteModel value,
          $Res Function(HomeStructRemoteModel) then) =
      _$HomeStructRemoteModelCopyWithImpl<$Res, HomeStructRemoteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'anime') List<HomeSectorCategory> anime,
      @JsonKey(name: 'manga') List<HomeSectorCategory> manga});
}

/// @nodoc
class _$HomeStructRemoteModelCopyWithImpl<$Res,
        $Val extends HomeStructRemoteModel>
    implements $HomeStructRemoteModelCopyWith<$Res> {
  _$HomeStructRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? manga = null,
  }) {
    return _then(_value.copyWith(
      anime: null == anime
          ? _value.anime
          : anime // ignore: cast_nullable_to_non_nullable
              as List<HomeSectorCategory>,
      manga: null == manga
          ? _value.manga
          : manga // ignore: cast_nullable_to_non_nullable
              as List<HomeSectorCategory>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStructRemoteModelImplCopyWith<$Res>
    implements $HomeStructRemoteModelCopyWith<$Res> {
  factory _$$HomeStructRemoteModelImplCopyWith(
          _$HomeStructRemoteModelImpl value,
          $Res Function(_$HomeStructRemoteModelImpl) then) =
      __$$HomeStructRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'anime') List<HomeSectorCategory> anime,
      @JsonKey(name: 'manga') List<HomeSectorCategory> manga});
}

/// @nodoc
class __$$HomeStructRemoteModelImplCopyWithImpl<$Res>
    extends _$HomeStructRemoteModelCopyWithImpl<$Res,
        _$HomeStructRemoteModelImpl>
    implements _$$HomeStructRemoteModelImplCopyWith<$Res> {
  __$$HomeStructRemoteModelImplCopyWithImpl(_$HomeStructRemoteModelImpl _value,
      $Res Function(_$HomeStructRemoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? anime = null,
    Object? manga = null,
  }) {
    return _then(_$HomeStructRemoteModelImpl(
      anime: null == anime
          ? _value._anime
          : anime // ignore: cast_nullable_to_non_nullable
              as List<HomeSectorCategory>,
      manga: null == manga
          ? _value._manga
          : manga // ignore: cast_nullable_to_non_nullable
              as List<HomeSectorCategory>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeStructRemoteModelImpl implements _HomeStructRemoteModel {
  const _$HomeStructRemoteModelImpl(
      {@JsonKey(name: 'anime') final List<HomeSectorCategory> anime = const [],
      @JsonKey(name: 'manga') final List<HomeSectorCategory> manga = const []})
      : _anime = anime,
        _manga = manga;

  factory _$HomeStructRemoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeStructRemoteModelImplFromJson(json);

  final List<HomeSectorCategory> _anime;
  @override
  @JsonKey(name: 'anime')
  List<HomeSectorCategory> get anime {
    if (_anime is EqualUnmodifiableListView) return _anime;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_anime);
  }

  final List<HomeSectorCategory> _manga;
  @override
  @JsonKey(name: 'manga')
  List<HomeSectorCategory> get manga {
    if (_manga is EqualUnmodifiableListView) return _manga;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_manga);
  }

  @override
  String toString() {
    return 'HomeStructRemoteModel(anime: $anime, manga: $manga)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStructRemoteModelImpl &&
            const DeepCollectionEquality().equals(other._anime, _anime) &&
            const DeepCollectionEquality().equals(other._manga, _manga));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_anime),
      const DeepCollectionEquality().hash(_manga));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStructRemoteModelImplCopyWith<_$HomeStructRemoteModelImpl>
      get copyWith => __$$HomeStructRemoteModelImplCopyWithImpl<
          _$HomeStructRemoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeStructRemoteModelImplToJson(
      this,
    );
  }
}

abstract class _HomeStructRemoteModel implements HomeStructRemoteModel {
  const factory _HomeStructRemoteModel(
          {@JsonKey(name: 'anime') final List<HomeSectorCategory> anime,
          @JsonKey(name: 'manga') final List<HomeSectorCategory> manga}) =
      _$HomeStructRemoteModelImpl;

  factory _HomeStructRemoteModel.fromJson(Map<String, dynamic> json) =
      _$HomeStructRemoteModelImpl.fromJson;

  @override
  @JsonKey(name: 'anime')
  List<HomeSectorCategory> get anime;
  @override
  @JsonKey(name: 'manga')
  List<HomeSectorCategory> get manga;
  @override
  @JsonKey(ignore: true)
  _$$HomeStructRemoteModelImplCopyWith<_$HomeStructRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
