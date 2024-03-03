// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CharacterDto _$CharacterDtoFromJson(Map<String, dynamic> json) {
  return _CharacterDto.fromJson(json);
}

/// @nodoc
mixin _$CharacterDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  CharacterImageDto? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  StaffCharacterName? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth')
  FuzzyDateDto? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  String? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'bloodType')
  String? get bloodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'favourites')
  int? get favourites => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavourite')
  bool get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'media')
  MediaConnection? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CharacterDtoCopyWith<CharacterDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterDtoCopyWith<$Res> {
  factory $CharacterDtoCopyWith(
          CharacterDto value, $Res Function(CharacterDto) then) =
      _$CharacterDtoCopyWithImpl<$Res, CharacterDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') CharacterImageDto? image,
      @JsonKey(name: 'name') StaffCharacterName? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'dateOfBirth') FuzzyDateDto? dateOfBirth,
      @JsonKey(name: 'age') String? age,
      @JsonKey(name: 'bloodType') String? bloodType,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'favourites') int? favourites,
      @JsonKey(name: 'isFavourite') bool isFavourite,
      @JsonKey(name: 'media') MediaConnection? media});

  $CharacterImageDtoCopyWith<$Res>? get image;
  $StaffCharacterNameCopyWith<$Res>? get name;
  $FuzzyDateDtoCopyWith<$Res>? get dateOfBirth;
  $MediaConnectionCopyWith<$Res>? get media;
}

/// @nodoc
class _$CharacterDtoCopyWithImpl<$Res, $Val extends CharacterDto>
    implements $CharacterDtoCopyWith<$Res> {
  _$CharacterDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? siteUrl = freezed,
    Object? favourites = freezed,
    Object? isFavourite = null,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CharacterImageDto?,
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
              as FuzzyDateDto?,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaConnection?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CharacterImageDtoCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $CharacterImageDtoCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
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

  @override
  @pragma('vm:prefer-inline')
  $FuzzyDateDtoCopyWith<$Res>? get dateOfBirth {
    if (_value.dateOfBirth == null) {
      return null;
    }

    return $FuzzyDateDtoCopyWith<$Res>(_value.dateOfBirth!, (value) {
      return _then(_value.copyWith(dateOfBirth: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaConnectionCopyWith<$Res>? get media {
    if (_value.media == null) {
      return null;
    }

    return $MediaConnectionCopyWith<$Res>(_value.media!, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CharacterDtoImplCopyWith<$Res>
    implements $CharacterDtoCopyWith<$Res> {
  factory _$$CharacterDtoImplCopyWith(
          _$CharacterDtoImpl value, $Res Function(_$CharacterDtoImpl) then) =
      __$$CharacterDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') CharacterImageDto? image,
      @JsonKey(name: 'name') StaffCharacterName? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'dateOfBirth') FuzzyDateDto? dateOfBirth,
      @JsonKey(name: 'age') String? age,
      @JsonKey(name: 'bloodType') String? bloodType,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'favourites') int? favourites,
      @JsonKey(name: 'isFavourite') bool isFavourite,
      @JsonKey(name: 'media') MediaConnection? media});

  @override
  $CharacterImageDtoCopyWith<$Res>? get image;
  @override
  $StaffCharacterNameCopyWith<$Res>? get name;
  @override
  $FuzzyDateDtoCopyWith<$Res>? get dateOfBirth;
  @override
  $MediaConnectionCopyWith<$Res>? get media;
}

/// @nodoc
class __$$CharacterDtoImplCopyWithImpl<$Res>
    extends _$CharacterDtoCopyWithImpl<$Res, _$CharacterDtoImpl>
    implements _$$CharacterDtoImplCopyWith<$Res> {
  __$$CharacterDtoImplCopyWithImpl(
      _$CharacterDtoImpl _value, $Res Function(_$CharacterDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? bloodType = freezed,
    Object? siteUrl = freezed,
    Object? favourites = freezed,
    Object? isFavourite = null,
    Object? media = freezed,
  }) {
    return _then(_$CharacterDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as CharacterImageDto?,
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
              as FuzzyDateDto?,
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
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as MediaConnection?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CharacterDtoImpl implements _CharacterDto {
  _$CharacterDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'image') this.image,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'dateOfBirth') this.dateOfBirth,
      @JsonKey(name: 'age') this.age,
      @JsonKey(name: 'bloodType') this.bloodType,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'favourites') this.favourites,
      @JsonKey(name: 'isFavourite') this.isFavourite = false,
      @JsonKey(name: 'media') this.media});

  factory _$CharacterDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CharacterDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'image')
  final CharacterImageDto? image;
  @override
  @JsonKey(name: 'name')
  final StaffCharacterName? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'gender')
  final String? gender;
  @override
  @JsonKey(name: 'dateOfBirth')
  final FuzzyDateDto? dateOfBirth;
  @override
  @JsonKey(name: 'age')
  final String? age;
  @override
  @JsonKey(name: 'bloodType')
  final String? bloodType;
  @override
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'favourites')
  final int? favourites;
  @override
  @JsonKey(name: 'isFavourite')
  final bool isFavourite;
  @override
  @JsonKey(name: 'media')
  final MediaConnection? media;

  @override
  String toString() {
    return 'CharacterDto(id: $id, image: $image, name: $name, description: $description, gender: $gender, dateOfBirth: $dateOfBirth, age: $age, bloodType: $bloodType, siteUrl: $siteUrl, favourites: $favourites, isFavourite: $isFavourite, media: $media)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
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
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      image,
      name,
      description,
      gender,
      dateOfBirth,
      age,
      bloodType,
      siteUrl,
      favourites,
      isFavourite,
      media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterDtoImplCopyWith<_$CharacterDtoImpl> get copyWith =>
      __$$CharacterDtoImplCopyWithImpl<_$CharacterDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CharacterDtoImplToJson(
      this,
    );
  }
}

abstract class _CharacterDto implements CharacterDto {
  factory _CharacterDto(
          {@JsonKey(name: 'id') final int id,
          @JsonKey(name: 'image') final CharacterImageDto? image,
          @JsonKey(name: 'name') final StaffCharacterName? name,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'gender') final String? gender,
          @JsonKey(name: 'dateOfBirth') final FuzzyDateDto? dateOfBirth,
          @JsonKey(name: 'age') final String? age,
          @JsonKey(name: 'bloodType') final String? bloodType,
          @JsonKey(name: 'siteUrl') final String? siteUrl,
          @JsonKey(name: 'favourites') final int? favourites,
          @JsonKey(name: 'isFavourite') final bool isFavourite,
          @JsonKey(name: 'media') final MediaConnection? media}) =
      _$CharacterDtoImpl;

  factory _CharacterDto.fromJson(Map<String, dynamic> json) =
      _$CharacterDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'image')
  CharacterImageDto? get image;
  @override
  @JsonKey(name: 'name')
  StaffCharacterName? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'gender')
  String? get gender;
  @override
  @JsonKey(name: 'dateOfBirth')
  FuzzyDateDto? get dateOfBirth;
  @override
  @JsonKey(name: 'age')
  String? get age;
  @override
  @JsonKey(name: 'bloodType')
  String? get bloodType;
  @override
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'favourites')
  int? get favourites;
  @override
  @JsonKey(name: 'isFavourite')
  bool get isFavourite;
  @override
  @JsonKey(name: 'media')
  MediaConnection? get media;
  @override
  @JsonKey(ignore: true)
  _$$CharacterDtoImplCopyWith<_$CharacterDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
