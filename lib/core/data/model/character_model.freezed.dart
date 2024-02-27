// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharacterModel {
  String get id => throw _privateConstructorUsedError;
  String get largeImage => throw _privateConstructorUsedError;
  String get mediumImage => throw _privateConstructorUsedError;
  StaffCharacterName? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get age => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;
  String? get siteUrl => throw _privateConstructorUsedError;
  int? get favourites => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  List<MediaModel> get relatedMedias => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharacterModelCopyWith<CharacterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterModelCopyWith<$Res> {
  factory $CharacterModelCopyWith(
          CharacterModel value, $Res Function(CharacterModel) then) =
      _$CharacterModelCopyWithImpl<$Res, CharacterModel>;
  @useResult
  $Res call(
      {String id,
      String largeImage,
      String mediumImage,
      StaffCharacterName? name,
      String? description,
      String? gender,
      DateTime? dateOfBirth,
      String? age,
      String? bloodType,
      String? siteUrl,
      int? favourites,
      bool isFavourite,
      List<MediaModel> relatedMedias});

  $StaffCharacterNameCopyWith<$Res>? get name;
}

/// @nodoc
class _$CharacterModelCopyWithImpl<$Res, $Val extends CharacterModel>
    implements $CharacterModelCopyWith<$Res> {
  _$CharacterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? largeImage = null,
    Object? mediumImage = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? siteUrl = freezed,
    Object? favourites = freezed,
    Object? isFavourite = null,
    Object? relatedMedias = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      largeImage: null == largeImage
          ? _value.largeImage
          : largeImage // ignore: cast_nullable_to_non_nullable
              as String,
      mediumImage: null == mediumImage
          ? _value.mediumImage
          : mediumImage // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StaffCharacterName?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedMedias: null == relatedMedias
          ? _value.relatedMedias
          : relatedMedias // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StaffCharacterNameCopyWith<$Res>? get name {
    if (_value.name == null) {
      return null;
    }

    return $StaffCharacterNameCopyWith<$Res>(_value.name!, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterModelImplCopyWith<$Res>
    implements $CharacterModelCopyWith<$Res> {
  factory _$$CharacterModelImplCopyWith(_$CharacterModelImpl value,
          $Res Function(_$CharacterModelImpl) then) =
      __$$CharacterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String largeImage,
      String mediumImage,
      StaffCharacterName? name,
      String? description,
      String? gender,
      DateTime? dateOfBirth,
      String? age,
      String? bloodType,
      String? siteUrl,
      int? favourites,
      bool isFavourite,
      List<MediaModel> relatedMedias});

  @override
  $StaffCharacterNameCopyWith<$Res>? get name;
}

/// @nodoc
class __$$CharacterModelImplCopyWithImpl<$Res>
    extends _$CharacterModelCopyWithImpl<$Res, _$CharacterModelImpl>
    implements _$$CharacterModelImplCopyWith<$Res> {
  __$$CharacterModelImplCopyWithImpl(
      _$CharacterModelImpl _value, $Res Function(_$CharacterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? largeImage = null,
    Object? mediumImage = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? siteUrl = freezed,
    Object? favourites = freezed,
    Object? isFavourite = null,
    Object? relatedMedias = null,
  }) {
    return _then(_$CharacterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      largeImage: null == largeImage
          ? _value.largeImage
          : largeImage // ignore: cast_nullable_to_non_nullable
              as String,
      mediumImage: null == mediumImage
          ? _value.mediumImage
          : mediumImage // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as StaffCharacterName?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      favourites: freezed == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      relatedMedias: null == relatedMedias
          ? _value._relatedMedias
          : relatedMedias // ignore: cast_nullable_to_non_nullable
              as List<MediaModel>,
    ));
  }
}

/// @nodoc

class _$CharacterModelImpl implements _CharacterModel {
  _$CharacterModelImpl(
      {this.id = '',
      this.largeImage = '',
      this.mediumImage = '',
      this.name,
      this.description,
      this.gender,
      this.dateOfBirth,
      this.age,
      this.bloodType,
      this.siteUrl,
      this.favourites,
      this.isFavourite = false,
      final List<MediaModel> relatedMedias = const []})
      : _relatedMedias = relatedMedias;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String largeImage;
  @override
  @JsonKey()
  final String mediumImage;
  @override
  final StaffCharacterName? name;
  @override
  final String? description;
  @override
  final String? gender;
  @override
  final DateTime? dateOfBirth;
  @override
  final String? age;
  @override
  final String? bloodType;
  @override
  final String? siteUrl;
  @override
  final int? favourites;
  @override
  @JsonKey()
  final bool isFavourite;
  final List<MediaModel> _relatedMedias;
  @override
  @JsonKey()
  List<MediaModel> get relatedMedias {
    if (_relatedMedias is EqualUnmodifiableListView) return _relatedMedias;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_relatedMedias);
  }

  @override
  String toString() {
    return 'CharacterModel(id: $id, largeImage: $largeImage, mediumImage: $mediumImage, name: $name, description: $description, gender: $gender, dateOfBirth: $dateOfBirth, age: $age, bloodType: $bloodType, siteUrl: $siteUrl, favourites: $favourites, isFavourite: $isFavourite, relatedMedias: $relatedMedias)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.largeImage, largeImage) ||
                other.largeImage == largeImage) &&
            (identical(other.mediumImage, mediumImage) ||
                other.mediumImage == mediumImage) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.favourites, favourites) ||
                other.favourites == favourites) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            const DeepCollectionEquality()
                .equals(other._relatedMedias, _relatedMedias));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      largeImage,
      mediumImage,
      name,
      description,
      gender,
      dateOfBirth,
      age,
      bloodType,
      siteUrl,
      favourites,
      isFavourite,
      const DeepCollectionEquality().hash(_relatedMedias));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      __$$CharacterModelImplCopyWithImpl<_$CharacterModelImpl>(
          this, _$identity);
}

abstract class _CharacterModel implements CharacterModel {
  factory _CharacterModel(
      {final String id,
      final String largeImage,
      final String mediumImage,
      final StaffCharacterName? name,
      final String? description,
      final String? gender,
      final DateTime? dateOfBirth,
      final String? age,
      final String? bloodType,
      final String? siteUrl,
      final int? favourites,
      final bool isFavourite,
      final List<MediaModel> relatedMedias}) = _$CharacterModelImpl;

  @override
  String get id;
  @override
  String get largeImage;
  @override
  String get mediumImage;
  @override
  StaffCharacterName? get name;
  @override
  String? get description;
  @override
  String? get gender;
  @override
  DateTime? get dateOfBirth;
  @override
  String? get age;
  @override
  String? get bloodType;
  @override
  String? get siteUrl;
  @override
  int? get favourites;
  @override
  bool get isFavourite;
  @override
  List<MediaModel> get relatedMedias;
  @override
  @JsonKey(ignore: true)
  _$$CharacterModelImplCopyWith<_$CharacterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
