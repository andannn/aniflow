// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trailter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrailerModel {
  String? get id => throw _privateConstructorUsedError;
  String? get site => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrailerModelCopyWith<TrailerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrailerModelCopyWith<$Res> {
  factory $TrailerModelCopyWith(
          TrailerModel value, $Res Function(TrailerModel) then) =
      _$TrailerModelCopyWithImpl<$Res, TrailerModel>;
  @useResult
  $Res call({String? id, String? site, String? thumbnail});
}

/// @nodoc
class _$TrailerModelCopyWithImpl<$Res, $Val extends TrailerModel>
    implements $TrailerModelCopyWith<$Res> {
  _$TrailerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? site = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TrailerModelCopyWith<$Res>
    implements $TrailerModelCopyWith<$Res> {
  factory _$$_TrailerModelCopyWith(
          _$_TrailerModel value, $Res Function(_$_TrailerModel) then) =
      __$$_TrailerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? site, String? thumbnail});
}

/// @nodoc
class __$$_TrailerModelCopyWithImpl<$Res>
    extends _$TrailerModelCopyWithImpl<$Res, _$_TrailerModel>
    implements _$$_TrailerModelCopyWith<$Res> {
  __$$_TrailerModelCopyWithImpl(
      _$_TrailerModel _value, $Res Function(_$_TrailerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? site = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_TrailerModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      site: freezed == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_TrailerModel implements _TrailerModel {
  _$_TrailerModel({this.id = '', this.site = '', this.thumbnail = ''});

  @override
  @JsonKey()
  final String? id;
  @override
  @JsonKey()
  final String? site;
  @override
  @JsonKey()
  final String? thumbnail;

  @override
  String toString() {
    return 'TrailerModel(id: $id, site: $site, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TrailerModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, site, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TrailerModelCopyWith<_$_TrailerModel> get copyWith =>
      __$$_TrailerModelCopyWithImpl<_$_TrailerModel>(this, _$identity);
}

abstract class _TrailerModel implements TrailerModel {
  factory _TrailerModel(
      {final String? id,
      final String? site,
      final String? thumbnail}) = _$_TrailerModel;

  @override
  String? get id;
  @override
  String? get site;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_TrailerModelCopyWith<_$_TrailerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
