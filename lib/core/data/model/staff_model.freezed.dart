// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'staff_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StaffModel {
  String get id => throw _privateConstructorUsedError;
  String get largeImage => throw _privateConstructorUsedError;
  String get mediumImage => throw _privateConstructorUsedError;
  StaffCharacterName? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  String? get siteUrl => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  DateTime? get dateOfDeath => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;
  bool get isFavourite => throw _privateConstructorUsedError;
  List<dynamic> get yearsActive => throw _privateConstructorUsedError;
  String? get homeTown => throw _privateConstructorUsedError;
  String? get bloodType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StaffModelCopyWith<StaffModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffModelCopyWith<$Res> {
  factory $StaffModelCopyWith(
          StaffModel value, $Res Function(StaffModel) then) =
      _$StaffModelCopyWithImpl<$Res, StaffModel>;
  @useResult
  $Res call(
      {String id,
      String largeImage,
      String mediumImage,
      StaffCharacterName? name,
      String? description,
      String? gender,
      String? siteUrl,
      DateTime? dateOfBirth,
      DateTime? dateOfDeath,
      int? age,
      bool isFavourite,
      List<dynamic> yearsActive,
      String? homeTown,
      String? bloodType});

  $StaffCharacterNameCopyWith<$Res>? get name;
}

/// @nodoc
class _$StaffModelCopyWithImpl<$Res, $Val extends StaffModel>
    implements $StaffModelCopyWith<$Res> {
  _$StaffModelCopyWithImpl(this._value, this._then);

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
    Object? siteUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? age = freezed,
    Object? isFavourite = null,
    Object? yearsActive = null,
    Object? homeTown = freezed,
    Object? bloodType = freezed,
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
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as List<dynamic>,
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
abstract class _$$StaffModelImplCopyWith<$Res>
    implements $StaffModelCopyWith<$Res> {
  factory _$$StaffModelImplCopyWith(
          _$StaffModelImpl value, $Res Function(_$StaffModelImpl) then) =
      __$$StaffModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String largeImage,
      String mediumImage,
      StaffCharacterName? name,
      String? description,
      String? gender,
      String? siteUrl,
      DateTime? dateOfBirth,
      DateTime? dateOfDeath,
      int? age,
      bool isFavourite,
      List<dynamic> yearsActive,
      String? homeTown,
      String? bloodType});

  @override
  $StaffCharacterNameCopyWith<$Res>? get name;
}

/// @nodoc
class __$$StaffModelImplCopyWithImpl<$Res>
    extends _$StaffModelCopyWithImpl<$Res, _$StaffModelImpl>
    implements _$$StaffModelImplCopyWith<$Res> {
  __$$StaffModelImplCopyWithImpl(
      _$StaffModelImpl _value, $Res Function(_$StaffModelImpl) _then)
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
    Object? siteUrl = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfDeath = freezed,
    Object? age = freezed,
    Object? isFavourite = null,
    Object? yearsActive = null,
    Object? homeTown = freezed,
    Object? bloodType = freezed,
  }) {
    return _then(_$StaffModelImpl(
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
      siteUrl: freezed == siteUrl
          ? _value.siteUrl
          : siteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfDeath: freezed == dateOfDeath
          ? _value.dateOfDeath
          : dateOfDeath // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
              as List<dynamic>,
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

class _$StaffModelImpl implements _StaffModel {
  _$StaffModelImpl(
      {this.id = '',
      this.largeImage = '',
      this.mediumImage = '',
      this.name,
      this.description,
      this.gender,
      this.siteUrl,
      this.dateOfBirth,
      this.dateOfDeath,
      this.age,
      this.isFavourite = false,
      final List<dynamic> yearsActive = const [],
      this.homeTown,
      this.bloodType})
      : _yearsActive = yearsActive;

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
  final String? siteUrl;
  @override
  final DateTime? dateOfBirth;
  @override
  final DateTime? dateOfDeath;
  @override
  final int? age;
  @override
  @JsonKey()
  final bool isFavourite;
  final List<dynamic> _yearsActive;
  @override
  @JsonKey()
  List<dynamic> get yearsActive {
    if (_yearsActive is EqualUnmodifiableListView) return _yearsActive;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_yearsActive);
  }

  @override
  final String? homeTown;
  @override
  final String? bloodType;

  @override
  String toString() {
    return 'StaffModel(id: $id, largeImage: $largeImage, mediumImage: $mediumImage, name: $name, description: $description, gender: $gender, siteUrl: $siteUrl, dateOfBirth: $dateOfBirth, dateOfDeath: $dateOfDeath, age: $age, isFavourite: $isFavourite, yearsActive: $yearsActive, homeTown: $homeTown, bloodType: $bloodType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StaffModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.largeImage, largeImage) ||
                other.largeImage == largeImage) &&
            (identical(other.mediumImage, mediumImage) ||
                other.mediumImage == mediumImage) &&
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
                other.bloodType == bloodType));
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
      siteUrl,
      dateOfBirth,
      dateOfDeath,
      age,
      isFavourite,
      const DeepCollectionEquality().hash(_yearsActive),
      homeTown,
      bloodType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      __$$StaffModelImplCopyWithImpl<_$StaffModelImpl>(this, _$identity);
}

abstract class _StaffModel implements StaffModel {
  factory _StaffModel(
      {final String id,
      final String largeImage,
      final String mediumImage,
      final StaffCharacterName? name,
      final String? description,
      final String? gender,
      final String? siteUrl,
      final DateTime? dateOfBirth,
      final DateTime? dateOfDeath,
      final int? age,
      final bool isFavourite,
      final List<dynamic> yearsActive,
      final String? homeTown,
      final String? bloodType}) = _$StaffModelImpl;

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
  String? get siteUrl;
  @override
  DateTime? get dateOfBirth;
  @override
  DateTime? get dateOfDeath;
  @override
  int? get age;
  @override
  bool get isFavourite;
  @override
  List<dynamic> get yearsActive;
  @override
  String? get homeTown;
  @override
  String? get bloodType;
  @override
  @JsonKey(ignore: true)
  _$$StaffModelImplCopyWith<_$StaffModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
