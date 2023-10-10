// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_external_link_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaExternalLinkModel _$MediaExternalLinkModelFromJson(
    Map<String, dynamic> json) {
  return _MediaExternalLinkModel.fromJson(json);
}

/// @nodoc
mixin _$MediaExternalLinkModel {
  String get url => throw _privateConstructorUsedError;
  String get site => throw _privateConstructorUsedError;
  MediaExternalLinkType get type => throw _privateConstructorUsedError;
  int get siteId => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaExternalLinkModelCopyWith<MediaExternalLinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaExternalLinkModelCopyWith<$Res> {
  factory $MediaExternalLinkModelCopyWith(MediaExternalLinkModel value,
          $Res Function(MediaExternalLinkModel) then) =
      _$MediaExternalLinkModelCopyWithImpl<$Res, MediaExternalLinkModel>;
  @useResult
  $Res call(
      {String url,
      String site,
      MediaExternalLinkType type,
      int siteId,
      String icon});
}

/// @nodoc
class _$MediaExternalLinkModelCopyWithImpl<$Res,
        $Val extends MediaExternalLinkModel>
    implements $MediaExternalLinkModelCopyWith<$Res> {
  _$MediaExternalLinkModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? site = null,
    Object? type = null,
    Object? siteId = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaExternalLinkType,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MediaExternalLinkModelCopyWith<$Res>
    implements $MediaExternalLinkModelCopyWith<$Res> {
  factory _$$_MediaExternalLinkModelCopyWith(_$_MediaExternalLinkModel value,
          $Res Function(_$_MediaExternalLinkModel) then) =
      __$$_MediaExternalLinkModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      String site,
      MediaExternalLinkType type,
      int siteId,
      String icon});
}

/// @nodoc
class __$$_MediaExternalLinkModelCopyWithImpl<$Res>
    extends _$MediaExternalLinkModelCopyWithImpl<$Res,
        _$_MediaExternalLinkModel>
    implements _$$_MediaExternalLinkModelCopyWith<$Res> {
  __$$_MediaExternalLinkModelCopyWithImpl(_$_MediaExternalLinkModel _value,
      $Res Function(_$_MediaExternalLinkModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? site = null,
    Object? type = null,
    Object? siteId = null,
    Object? icon = null,
  }) {
    return _then(_$_MediaExternalLinkModel(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MediaExternalLinkType,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MediaExternalLinkModel implements _MediaExternalLinkModel {
  _$_MediaExternalLinkModel(
      {this.url = '',
      this.site = '',
      this.type = MediaExternalLinkType.info,
      this.siteId = -1,
      this.icon = ''});

  factory _$_MediaExternalLinkModel.fromJson(Map<String, dynamic> json) =>
      _$$_MediaExternalLinkModelFromJson(json);

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String site;
  @override
  @JsonKey()
  final MediaExternalLinkType type;
  @override
  @JsonKey()
  final int siteId;
  @override
  @JsonKey()
  final String icon;

  @override
  String toString() {
    return 'MediaExternalLinkModel(url: $url, site: $site, type: $type, siteId: $siteId, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MediaExternalLinkModel &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.site, site) || other.site == site) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, site, type, siteId, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MediaExternalLinkModelCopyWith<_$_MediaExternalLinkModel> get copyWith =>
      __$$_MediaExternalLinkModelCopyWithImpl<_$_MediaExternalLinkModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MediaExternalLinkModelToJson(
      this,
    );
  }
}

abstract class _MediaExternalLinkModel implements MediaExternalLinkModel {
  factory _MediaExternalLinkModel(
      {final String url,
      final String site,
      final MediaExternalLinkType type,
      final int siteId,
      final String icon}) = _$_MediaExternalLinkModel;

  factory _MediaExternalLinkModel.fromJson(Map<String, dynamic> json) =
      _$_MediaExternalLinkModel.fromJson;

  @override
  String get url;
  @override
  String get site;
  @override
  MediaExternalLinkType get type;
  @override
  int get siteId;
  @override
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$_MediaExternalLinkModelCopyWith<_$_MediaExternalLinkModel> get copyWith =>
      throw _privateConstructorUsedError;
}
