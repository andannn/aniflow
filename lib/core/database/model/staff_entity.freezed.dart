// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffEntity _$StaffEntityFromJson(Map<String, dynamic> json) {
  return _StaffEntity.fromJson(json);
}

/// @nodoc
mixin _$StaffEntity {
  @JsonKey(name: StaffColumns.id)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.image)
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.name)
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.description)
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.gender)
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.siteUrl)
  String? get siteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.dateOfBirth)
  int? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.dateOfDeath)
  int? get dateOfDeath => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.age)
  int? get age => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.isFavourite)
  int? get isFavourite => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.yearsActive)
  String? get yearsActive => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.homeTown)
  String? get homeTown => throw _privateConstructorUsedError;
  @JsonKey(name: StaffColumns.bloodType)
  String? get bloodType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffEntityCopyWith<StaffEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffEntityCopyWith<$Res> {
  factory $StaffEntityCopyWith(
          StaffEntity value, $Res Function(StaffEntity) then) =
      _$StaffEntityCopyWithImpl<$Res, StaffEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: StaffColumns.id) String id,
      @JsonKey(name: StaffColumns.image) String? image,
      @JsonKey(name: StaffColumns.name) String? name,
      @JsonKey(name: StaffColumns.description) String? description,
      @JsonKey(name: StaffColumns.gender) String? gender,
      @JsonKey(name: StaffColumns.siteUrl) String? siteUrl,
      @JsonKey(name: StaffColumns.dateOfBirth) int? dateOfBirth,
      @JsonKey(name: StaffColumns.dateOfDeath) int? dateOfDeath,
      @JsonKey(name: StaffColumns.age) int? age,
      @JsonKey(name: StaffColumns.isFavourite) int? isFavourite,
      @JsonKey(name: StaffColumns.yearsActive) String? yearsActive,
      @JsonKey(name: StaffColumns.homeTown) String? homeTown,
      @JsonKey(name: StaffColumns.bloodType) String? bloodType});
}

/// @nodoc
class _$StaffEntityCopyWithImpl<$Res, $Val extends StaffEntity>
    implements $StaffEntityCopyWith<$Res> {
  _$StaffEntityCopyWithImpl(this._value, this._then);

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
    Object? siteUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? age = freezed,
    Object? isFavourite = freezed,
    Object? yearsActive = freezed,
    Object? homeTown = freezed,
    Object? bloodType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as int?,
      yearsActive: freezed == yearsActive
          ? _value.yearsActive
          : yearsActive // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTown: freezed == homeTown
          ? _value.homeTown
          : homeTown // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StaffEntityImplCopyWith<$Res>
    implements $StaffEntityCopyWith<$Res> {
  factory _$$StaffEntityImplCopyWith(
          _$StaffEntityImpl value, $Res Function(_$StaffEntityImpl) then) =
      __$$StaffEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: StaffColumns.id) String id,
      @JsonKey(name: StaffColumns.image) String? image,
      @JsonKey(name: StaffColumns.name) String? name,
      @JsonKey(name: StaffColumns.description) String? description,
      @JsonKey(name: StaffColumns.gender) String? gender,
      @JsonKey(name: StaffColumns.siteUrl) String? siteUrl,
      @JsonKey(name: StaffColumns.dateOfBirth) int? dateOfBirth,
      @JsonKey(name: StaffColumns.dateOfDeath) int? dateOfDeath,
      @JsonKey(name: StaffColumns.age) int? age,
      @JsonKey(name: StaffColumns.isFavourite) int? isFavourite,
      @JsonKey(name: StaffColumns.yearsActive) String? yearsActive,
      @JsonKey(name: StaffColumns.homeTown) String? homeTown,
      @JsonKey(name: StaffColumns.bloodType) String? bloodType});
}

/// @nodoc
class __$$StaffEntityImplCopyWithImpl<$Res>
    extends _$StaffEntityCopyWithImpl<$Res, _$StaffEntityImpl>
    implements _$$StaffEntityImplCopyWith<$Res> {
  __$$StaffEntityImplCopyWithImpl(
      _$StaffEntityImpl _value, $Res Function(_$StaffEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? gender = freezed,
    Object? siteUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? age = freezed,
    Object? isFavourite = freezed,
    Object? yearsActive = freezed,
    Object? homeTown = freezed,
    Object? bloodType = freezed,
  }) {
    return _then(_$StaffEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as int?,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      isFavourite: freezed == isFavourite
          ? _value.isFavourite
          : isFavourite // ignore: cast_nullable_to_non_nullable
              as int?,
      yearsActive: freezed == yearsActive
          ? _value.yearsActive
          : yearsActive // ignore: cast_nullable_to_non_nullable
              as String?,
      homeTown: freezed == homeTown
          ? _value.homeTown
          : homeTown // ignore: cast_nullable_to_non_nullable
              as String?,
      bloodType: freezed == bloodType
          ? _value.bloodType
          : bloodType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StaffEntityImpl implements _StaffEntity {
  _$StaffEntityImpl(
      {@JsonKey(name: StaffColumns.id) this.id = '',
      @JsonKey(name: StaffColumns.image) this.image,
      @JsonKey(name: StaffColumns.name) this.name,
      @JsonKey(name: StaffColumns.description) this.description,
      @JsonKey(name: StaffColumns.gender) this.gender,
      @JsonKey(name: StaffColumns.siteUrl) this.siteUrl,
      @JsonKey(name: StaffColumns.dateOfBirth) this.dateOfBirth,
      @JsonKey(name: StaffColumns.dateOfDeath) this.dateOfDeath,
      @JsonKey(name: StaffColumns.age) this.age,
      @JsonKey(name: StaffColumns.isFavourite) this.isFavourite,
      @JsonKey(name: StaffColumns.yearsActive) this.yearsActive,
      @JsonKey(name: StaffColumns.homeTown) this.homeTown,
      @JsonKey(name: StaffColumns.bloodType) this.bloodType});

  factory _$StaffEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$StaffEntityImplFromJson(json);

  @override
  @JsonKey(name: StaffColumns.id)
  final String id;
  @override
  @JsonKey(name: StaffColumns.image)
  final String? image;
  @override
  @JsonKey(name: StaffColumns.name)
  final String? name;
  @override
  @JsonKey(name: StaffColumns.description)
  final String? description;
  @override
  @JsonKey(name: StaffColumns.gender)
  final String? gender;
  @override
  @JsonKey(name: StaffColumns.siteUrl)
  final String? siteUrl;
  @override
  @JsonKey(name: StaffColumns.dateOfBirth)
  final int? dateOfBirth;
  @override
  @JsonKey(name: StaffColumns.dateOfDeath)
  final int? dateOfDeath;
  @override
  @JsonKey(name: StaffColumns.age)
  final int? age;
  @override
  @JsonKey(name: StaffColumns.isFavourite)
  final int? isFavourite;
  @override
  @JsonKey(name: StaffColumns.yearsActive)
  final String? yearsActive;
  @override
  @JsonKey(name: StaffColumns.homeTown)
  final String? homeTown;
  @override
  @JsonKey(name: StaffColumns.bloodType)
  final String? bloodType;

  @override
  String toString() {
    return 'StaffEntity(id: $id, image: $image, name: $name, description: $description, gender: $gender, siteUrl: $siteUrl, dateOfBirth: $dateOfBirth, dateOfDeath: $dateOfDeath, age: $age, isFavourite: $isFavourite, yearsActive: $yearsActive, homeTown: $homeTown, bloodType: $bloodType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
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
            (identical(other.yearsActive, yearsActive) ||
                other.yearsActive == yearsActive) &&
            (identical(other.homeTown, homeTown) ||
                other.homeTown == homeTown) &&
            (identical(other.bloodType, bloodType) ||
                other.bloodType == bloodType));
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
      siteUrl,
      dateOfBirth,
      dateOfDeath,
      age,
      isFavourite,
      yearsActive,
      homeTown,
      bloodType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffEntityImplCopyWith<_$StaffEntityImpl> get copyWith =>
      __$$StaffEntityImplCopyWithImpl<_$StaffEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StaffEntityImplToJson(
      this,
    );
  }
}

abstract class _StaffEntity implements StaffEntity {
  factory _StaffEntity(
          {@JsonKey(name: StaffColumns.id) final String id,
          @JsonKey(name: StaffColumns.image) final String? image,
          @JsonKey(name: StaffColumns.name) final String? name,
          @JsonKey(name: StaffColumns.description) final String? description,
          @JsonKey(name: StaffColumns.gender) final String? gender,
          @JsonKey(name: StaffColumns.siteUrl) final String? siteUrl,
          @JsonKey(name: StaffColumns.dateOfBirth) final int? dateOfBirth,
          @JsonKey(name: StaffColumns.dateOfDeath) final int? dateOfDeath,
          @JsonKey(name: StaffColumns.age) final int? age,
          @JsonKey(name: StaffColumns.isFavourite) final int? isFavourite,
          @JsonKey(name: StaffColumns.yearsActive) final String? yearsActive,
          @JsonKey(name: StaffColumns.homeTown) final String? homeTown,
          @JsonKey(name: StaffColumns.bloodType) final String? bloodType}) =
      _$StaffEntityImpl;

  factory _StaffEntity.fromJson(Map<String, dynamic> json) =
      _$StaffEntityImpl.fromJson;

  @override
  @JsonKey(name: StaffColumns.id)
  String get id;
  @override
  @JsonKey(name: StaffColumns.image)
  String? get image;
  @override
  @JsonKey(name: StaffColumns.name)
  String? get name;
  @override
  @JsonKey(name: StaffColumns.description)
  String? get description;
  @override
  @JsonKey(name: StaffColumns.gender)
  String? get gender;
  @override
  @JsonKey(name: StaffColumns.siteUrl)
  String? get siteUrl;
  @override
  @JsonKey(name: StaffColumns.dateOfBirth)
  int? get dateOfBirth;
  @override
  @JsonKey(name: StaffColumns.dateOfDeath)
  int? get dateOfDeath;
  @override
  @JsonKey(name: StaffColumns.age)
  int? get age;
  @override
  @JsonKey(name: StaffColumns.isFavourite)
  int? get isFavourite;
  @override
  @JsonKey(name: StaffColumns.yearsActive)
  String? get yearsActive;
  @override
  @JsonKey(name: StaffColumns.homeTown)
  String? get homeTown;
  @override
  @JsonKey(name: StaffColumns.bloodType)
  String? get bloodType;
  @override
  @JsonKey(ignore: true)
  _$$StaffEntityImplCopyWith<_$StaffEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
