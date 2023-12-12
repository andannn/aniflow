// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffDto _$StaffDtoFromJson(Map<String, dynamic> json) {
  return _StaffDto.fromJson(json);
}

/// @nodoc
mixin _$StaffDto {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  Map<String, String?> get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  StaffCharacterName? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'siteUrl')
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth')
  FuzzyDateDto? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfDeath')
  FuzzyDateDto? get dateOfDeath => throw _privateConstructorUsedError;
  @JsonKey(name: 'age')
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: 'isFavourite')
  bool get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: 'yearsActive')
  List<int> get yearsActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'homeTown')
  String? get homeTown => throw _privateConstructorUsedError;
  @JsonKey(name: 'bloodType')
  String? get bloodType => throw _privateConstructorUsedError;
  @JsonKey(name: 'characterMedia')
  MediaConnection? get characterMedia => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffDtoCopyWith<StaffDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffDtoCopyWith<$Res> {
  factory $StaffDtoCopyWith(StaffDto value, $Res Function(StaffDto) then) =
      _$StaffDtoCopyWithImpl<$Res, StaffDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') Map<String, String?> image,
      @JsonKey(name: 'name') StaffCharacterName? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'dateOfBirth') FuzzyDateDto? dateOfBirth,
      @JsonKey(name: 'dateOfDeath') FuzzyDateDto? dateOfDeath,
      @JsonKey(name: 'age') int? age,
      @JsonKey(name: 'isFavourite') bool isFavourite,
      @JsonKey(name: 'yearsActive') List<int> yearsActive,
      @JsonKey(name: 'homeTown') String? homeTown,
      @JsonKey(name: 'bloodType') String? bloodType,
      @JsonKey(name: 'characterMedia') MediaConnection? characterMedia});

  $StaffCharacterNameCopyWith<$Res>? get name;
  $FuzzyDateDtoCopyWith<$Res>? get dateOfBirth;
  $FuzzyDateDtoCopyWith<$Res>? get dateOfDeath;
  $MediaConnectionCopyWith<$Res>? get characterMedia;
}

/// @nodoc
class _$StaffDtoCopyWithImpl<$Res, $Val extends StaffDto>
    implements $StaffDtoCopyWith<$Res> {
  _$StaffDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? siteUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? age = freezed,
    Object? isFavourite = null,
    Object? yearsActive = null,
    Object? homeTown = freezed,
    Object? bloodType = freezed,
    Object? characterMedia = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
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
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      yearsActive: null == yearsActive
          ? _value.yearsActive
          : yearsActive // ignore: cast_nullable_to_non_nullable
              as List<int>,
      homeTown: freezed == homeTown
          ? _value.homeTown
          : homeTown // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      characterMedia: freezed == characterMedia
          ? _value.characterMedia
          : characterMedia // ignore: cast_nullable_to_non_nullable
              as MediaConnection?,
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
  $FuzzyDateDtoCopyWith<$Res>? get dateOfDeath {
    if (_value.dateOfDeath == null) {
      return null;
    }

    return $FuzzyDateDtoCopyWith<$Res>(_value.dateOfDeath!, (value) {
      return _then(_value.copyWith(dateOfDeath: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MediaConnectionCopyWith<$Res>? get characterMedia {
    if (_value.characterMedia == null) {
      return null;
    }

    return $MediaConnectionCopyWith<$Res>(_value.characterMedia!, (value) {
      return _then(_value.copyWith(characterMedia: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StaffDtoImplCopyWith<$Res>
    implements $StaffDtoCopyWith<$Res> {
  factory _$$StaffDtoImplCopyWith(
          _$StaffDtoImpl value, $Res Function(_$StaffDtoImpl) then) =
      __$$StaffDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'image') Map<String, String?> image,
      @JsonKey(name: 'name') StaffCharacterName? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'siteUrl') String? siteUrl,
      @JsonKey(name: 'dateOfBirth') FuzzyDateDto? dateOfBirth,
      @JsonKey(name: 'dateOfDeath') FuzzyDateDto? dateOfDeath,
      @JsonKey(name: 'age') int? age,
      @JsonKey(name: 'isFavourite') bool isFavourite,
      @JsonKey(name: 'yearsActive') List<int> yearsActive,
      @JsonKey(name: 'homeTown') String? homeTown,
      @JsonKey(name: 'bloodType') String? bloodType,
      @JsonKey(name: 'characterMedia') MediaConnection? characterMedia});

  @override
  $StaffCharacterNameCopyWith<$Res>? get name;
  @override
  $FuzzyDateDtoCopyWith<$Res>? get dateOfBirth;
  @override
  $FuzzyDateDtoCopyWith<$Res>? get dateOfDeath;
  @override
  $MediaConnectionCopyWith<$Res>? get characterMedia;
}

/// @nodoc
class __$$StaffDtoImplCopyWithImpl<$Res>
    extends _$StaffDtoCopyWithImpl<$Res, _$StaffDtoImpl>
    implements _$$StaffDtoImplCopyWith<$Res> {
  __$$StaffDtoImplCopyWithImpl(
      _$StaffDtoImpl _value, $Res Function(_$StaffDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? siteUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? age = freezed,
    Object? isFavourite = null,
    Object? yearsActive = null,
    Object? homeTown = freezed,
    Object? bloodType = freezed,
    Object? characterMedia = freezed,
  }) {
    return _then(_$StaffDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value._image
          : image // ignore: cast_nullable_to_non_nullable
              as Map<String, String?>,
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
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as FuzzyDateDto?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavourite: null == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as bool,
      yearsActive: null == yearsActive
          ? _value._yearsActive
          : yearsActive // ignore: cast_nullable_to_non_nullable
              as List<int>,
      homeTown: freezed == homeTown
          ? _value.homeTown
          : homeTown // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
      characterMedia: freezed == characterMedia
          ? _value.characterMedia
          : characterMedia // ignore: cast_nullable_to_non_nullable
              as MediaConnection?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffDtoImpl implements _StaffDto {
  _$StaffDtoImpl(
      {@JsonKey(name: 'id') this.id = -1,
      @JsonKey(name: 'image') final Map<String, String?> image = const {},
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'gender') this.gender,
      @JsonKey(name: 'siteUrl') this.siteUrl,
      @JsonKey(name: 'dateOfBirth') this.dateOfBirth,
      @JsonKey(name: 'dateOfDeath') this.dateOfDeath,
      @JsonKey(name: 'age') this.age,
      @JsonKey(name: 'isFavourite') this.isFavourite = false,
      @JsonKey(name: 'yearsActive') final List<int> yearsActive = const [],
      @JsonKey(name: 'homeTown') this.homeTown,
      @JsonKey(name: 'bloodType') this.bloodType,
      @JsonKey(name: 'characterMedia') this.characterMedia})
      : _image = image,
        _yearsActive = yearsActive;

  factory _$StaffDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  final Map<String, String?> _image;
  @override
  @JsonKey(name: 'image')
  Map<String, String?> get image {
    if (_image is EqualUnmodifiableMapView) return _image;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_image);
  }

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
  @JsonKey(name: 'siteUrl')
  final String? siteUrl;
  @override
  @JsonKey(name: 'dateOfBirth')
  final FuzzyDateDto? dateOfBirth;
  @override
  @JsonKey(name: 'dateOfDeath')
  final FuzzyDateDto? dateOfDeath;
  @override
  @JsonKey(name: 'age')
  final int? age;
  @override
  @JsonKey(name: 'isFavourite')
  final bool isFavourite;
  final List<int> _yearsActive;
  @override
  @JsonKey(name: 'yearsActive')
  List<int> get yearsActive {
    if (_yearsActive is EqualUnmodifiableListView) return _yearsActive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearsActive);
  }

  @override
  @JsonKey(name: 'homeTown')
  final String? homeTown;
  @override
  @JsonKey(name: 'bloodType')
  final String? bloodType;
  @override
  @JsonKey(name: 'characterMedia')
  final MediaConnection? characterMedia;

  @override
  String toString() {
    return 'StaffDto(id: $id, image: $image, name: $name, description: $description, gender: $gender, siteUrl: $siteUrl, dateOfBirth: $dateOfBirth, dateOfDeath: $dateOfDeath, age: $age, isFavourite: $isFavourite, yearsActive: $yearsActive, homeTown: $homeTown, bloodType: $bloodType, characterMedia: $characterMedia)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._image, _image) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.siteUrl, siteUrl) || other.siteUrl == siteUrl) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.dateOfDeath, dateOfDeath) ||
                other.dateOfDeath == dateOfDeath) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.isFavourite, isFavourite) ||
                other.isFavourite == isFavourite) &&
            const DeepCollectionEquality()
                .equals(other._yearsActive, _yearsActive) &&
            (identical(other.homeTown, homeTown) ||
                other.homeTown == homeTown) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType) &&
            (identical(other.characterMedia, characterMedia) ||
                other.characterMedia == characterMedia));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_image),
      name,
      description,
      gender,
      siteUrl,
      dateOfBirth,
      dateOfDeath,
      age,
      isFavourite,
      const DeepCollectionEquality().hash(_yearsActive),
      homeTown,
      bloodType,
      characterMedia);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffDtoImplCopyWith<_$StaffDtoImpl> get copyWith =>
      __$$StaffDtoImplCopyWithImpl<_$StaffDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffDtoImplToJson(
      this,
    );
  }
}

abstract class _StaffDto implements StaffDto {
  factory _StaffDto(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'image') final Map<String, String?> image,
      @JsonKey(name: 'name') final StaffCharacterName? name,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'gender') final String? gender,
      @JsonKey(name: 'siteUrl') final String? siteUrl,
      @JsonKey(name: 'dateOfBirth') final FuzzyDateDto? dateOfBirth,
      @JsonKey(name: 'dateOfDeath') final FuzzyDateDto? dateOfDeath,
      @JsonKey(name: 'age') final int? age,
      @JsonKey(name: 'isFavourite') final bool isFavourite,
      @JsonKey(name: 'yearsActive') final List<int> yearsActive,
      @JsonKey(name: 'homeTown') final String? homeTown,
      @JsonKey(name: 'bloodType') final String? bloodType,
      @JsonKey(name: 'characterMedia')
      final MediaConnection? characterMedia}) = _$StaffDtoImpl;

  factory _StaffDto.fromJson(Map<String, dynamic> json) =
      _$StaffDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'image')
  Map<String, String?> get image;
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
  @JsonKey(name: 'siteUrl')
  String? get siteUrl;
  @override
  @JsonKey(name: 'dateOfBirth')
  FuzzyDateDto? get dateOfBirth;
  @override
  @JsonKey(name: 'dateOfDeath')
  FuzzyDateDto? get dateOfDeath;
  @override
  @JsonKey(name: 'age')
  int? get age;
  @override
  @JsonKey(name: 'isFavourite')
  bool get isFavourite;
  @override
  @JsonKey(name: 'yearsActive')
  List<int> get yearsActive;
  @override
  @JsonKey(name: 'homeTown')
  String? get homeTown;
  @override
  @JsonKey(name: 'bloodType')
  String? get bloodType;
  @override
  @JsonKey(name: 'characterMedia')
  MediaConnection? get characterMedia;
  @override
  @JsonKey(ignore: true)
  _$$StaffDtoImplCopyWith<_$StaffDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
