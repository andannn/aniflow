// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aniflow_database.dart';

// ignore_for_file: type=lint
class $UserTableTable extends UserTable
    with TableInfo<$UserTableTable, UserEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'user_data_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'user_data_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _avatarImageMeta =
      const VerificationMeta('avatarImage');
  @override
  late final GeneratedColumn<String> avatarImage = GeneratedColumn<String>(
      'user_data_avatar_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bannerImageMeta =
      const VerificationMeta('bannerImage');
  @override
  late final GeneratedColumn<String> bannerImage = GeneratedColumn<String>(
      'user_data_banner_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profileColorMeta =
      const VerificationMeta('profileColor');
  @override
  late final GeneratedColumn<String> profileColor = GeneratedColumn<String>(
      'user_data_profile_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteUrlMeta =
      const VerificationMeta('siteUrl');
  @override
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'user_data_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _unreadNotificationCountMeta =
      const VerificationMeta('unreadNotificationCount');
  @override
  late final GeneratedColumn<int> unreadNotificationCount =
      GeneratedColumn<int>(
          'user_data_unread_notification_count', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        avatarImage,
        bannerImage,
        profileColor,
        siteUrl,
        unreadNotificationCount
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_data_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['user_data_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('user_data_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['user_data_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('user_data_avatar_image')) {
      context.handle(
          _avatarImageMeta,
          avatarImage.isAcceptableOrUnknown(
              data['user_data_avatar_image']!, _avatarImageMeta));
    }
    if (data.containsKey('user_data_banner_image')) {
      context.handle(
          _bannerImageMeta,
          bannerImage.isAcceptableOrUnknown(
              data['user_data_banner_image']!, _bannerImageMeta));
    }
    if (data.containsKey('user_data_profile_color')) {
      context.handle(
          _profileColorMeta,
          profileColor.isAcceptableOrUnknown(
              data['user_data_profile_color']!, _profileColorMeta));
    }
    if (data.containsKey('user_data_site_url')) {
      context.handle(
          _siteUrlMeta,
          siteUrl.isAcceptableOrUnknown(
              data['user_data_site_url']!, _siteUrlMeta));
    }
    if (data.containsKey('user_data_unread_notification_count')) {
      context.handle(
          _unreadNotificationCountMeta,
          unreadNotificationCount.isAcceptableOrUnknown(
              data['user_data_unread_notification_count']!,
              _unreadNotificationCountMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_data_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_data_name'])!,
      avatarImage: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}user_data_avatar_image']),
      bannerImage: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}user_data_banner_image']),
      profileColor: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}user_data_profile_color']),
      siteUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_data_site_url']),
      unreadNotificationCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}user_data_unread_notification_count']),
    );
  }

  @override
  $UserTableTable createAlias(String alias) {
    return $UserTableTable(attachedDatabase, alias);
  }
}

class UserEntity extends DataClass implements Insertable<UserEntity> {
  final String id;
  final String name;
  final String? avatarImage;
  final String? bannerImage;
  final String? profileColor;
  final String? siteUrl;
  final int? unreadNotificationCount;
  const UserEntity(
      {required this.id,
      required this.name,
      this.avatarImage,
      this.bannerImage,
      this.profileColor,
      this.siteUrl,
      this.unreadNotificationCount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_data_id'] = Variable<String>(id);
    map['user_data_name'] = Variable<String>(name);
    if (!nullToAbsent || avatarImage != null) {
      map['user_data_avatar_image'] = Variable<String>(avatarImage);
    }
    if (!nullToAbsent || bannerImage != null) {
      map['user_data_banner_image'] = Variable<String>(bannerImage);
    }
    if (!nullToAbsent || profileColor != null) {
      map['user_data_profile_color'] = Variable<String>(profileColor);
    }
    if (!nullToAbsent || siteUrl != null) {
      map['user_data_site_url'] = Variable<String>(siteUrl);
    }
    if (!nullToAbsent || unreadNotificationCount != null) {
      map['user_data_unread_notification_count'] =
          Variable<int>(unreadNotificationCount);
    }
    return map;
  }

  UserTableCompanion toCompanion(bool nullToAbsent) {
    return UserTableCompanion(
      id: Value(id),
      name: Value(name),
      avatarImage: avatarImage == null && nullToAbsent
          ? const Value.absent()
          : Value(avatarImage),
      bannerImage: bannerImage == null && nullToAbsent
          ? const Value.absent()
          : Value(bannerImage),
      profileColor: profileColor == null && nullToAbsent
          ? const Value.absent()
          : Value(profileColor),
      siteUrl: siteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(siteUrl),
      unreadNotificationCount: unreadNotificationCount == null && nullToAbsent
          ? const Value.absent()
          : Value(unreadNotificationCount),
    );
  }

  factory UserEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      avatarImage: serializer.fromJson<String?>(json['avatarImage']),
      bannerImage: serializer.fromJson<String?>(json['bannerImage']),
      profileColor: serializer.fromJson<String?>(json['profileColor']),
      siteUrl: serializer.fromJson<String?>(json['siteUrl']),
      unreadNotificationCount:
          serializer.fromJson<int?>(json['unreadNotificationCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'avatarImage': serializer.toJson<String?>(avatarImage),
      'bannerImage': serializer.toJson<String?>(bannerImage),
      'profileColor': serializer.toJson<String?>(profileColor),
      'siteUrl': serializer.toJson<String?>(siteUrl),
      'unreadNotificationCount':
          serializer.toJson<int?>(unreadNotificationCount),
    };
  }

  UserEntity copyWith(
          {String? id,
          String? name,
          Value<String?> avatarImage = const Value.absent(),
          Value<String?> bannerImage = const Value.absent(),
          Value<String?> profileColor = const Value.absent(),
          Value<String?> siteUrl = const Value.absent(),
          Value<int?> unreadNotificationCount = const Value.absent()}) =>
      UserEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        avatarImage: avatarImage.present ? avatarImage.value : this.avatarImage,
        bannerImage: bannerImage.present ? bannerImage.value : this.bannerImage,
        profileColor:
            profileColor.present ? profileColor.value : this.profileColor,
        siteUrl: siteUrl.present ? siteUrl.value : this.siteUrl,
        unreadNotificationCount: unreadNotificationCount.present
            ? unreadNotificationCount.value
            : this.unreadNotificationCount,
      );
  UserEntity copyWithCompanion(UserTableCompanion data) {
    return UserEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      avatarImage:
          data.avatarImage.present ? data.avatarImage.value : this.avatarImage,
      bannerImage:
          data.bannerImage.present ? data.bannerImage.value : this.bannerImage,
      profileColor: data.profileColor.present
          ? data.profileColor.value
          : this.profileColor,
      siteUrl: data.siteUrl.present ? data.siteUrl.value : this.siteUrl,
      unreadNotificationCount: data.unreadNotificationCount.present
          ? data.unreadNotificationCount.value
          : this.unreadNotificationCount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarImage: $avatarImage, ')
          ..write('bannerImage: $bannerImage, ')
          ..write('profileColor: $profileColor, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('unreadNotificationCount: $unreadNotificationCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, avatarImage, bannerImage,
      profileColor, siteUrl, unreadNotificationCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.avatarImage == this.avatarImage &&
          other.bannerImage == this.bannerImage &&
          other.profileColor == this.profileColor &&
          other.siteUrl == this.siteUrl &&
          other.unreadNotificationCount == this.unreadNotificationCount);
}

class UserTableCompanion extends UpdateCompanion<UserEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> avatarImage;
  final Value<String?> bannerImage;
  final Value<String?> profileColor;
  final Value<String?> siteUrl;
  final Value<int?> unreadNotificationCount;
  final Value<int> rowid;
  const UserTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.avatarImage = const Value.absent(),
    this.bannerImage = const Value.absent(),
    this.profileColor = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.unreadNotificationCount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserTableCompanion.insert({
    required String id,
    required String name,
    this.avatarImage = const Value.absent(),
    this.bannerImage = const Value.absent(),
    this.profileColor = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.unreadNotificationCount = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<UserEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? avatarImage,
    Expression<String>? bannerImage,
    Expression<String>? profileColor,
    Expression<String>? siteUrl,
    Expression<int>? unreadNotificationCount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'user_data_id': id,
      if (name != null) 'user_data_name': name,
      if (avatarImage != null) 'user_data_avatar_image': avatarImage,
      if (bannerImage != null) 'user_data_banner_image': bannerImage,
      if (profileColor != null) 'user_data_profile_color': profileColor,
      if (siteUrl != null) 'user_data_site_url': siteUrl,
      if (unreadNotificationCount != null)
        'user_data_unread_notification_count': unreadNotificationCount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? avatarImage,
      Value<String?>? bannerImage,
      Value<String?>? profileColor,
      Value<String?>? siteUrl,
      Value<int?>? unreadNotificationCount,
      Value<int>? rowid}) {
    return UserTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarImage: avatarImage ?? this.avatarImage,
      bannerImage: bannerImage ?? this.bannerImage,
      profileColor: profileColor ?? this.profileColor,
      siteUrl: siteUrl ?? this.siteUrl,
      unreadNotificationCount:
          unreadNotificationCount ?? this.unreadNotificationCount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['user_data_id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['user_data_name'] = Variable<String>(name.value);
    }
    if (avatarImage.present) {
      map['user_data_avatar_image'] = Variable<String>(avatarImage.value);
    }
    if (bannerImage.present) {
      map['user_data_banner_image'] = Variable<String>(bannerImage.value);
    }
    if (profileColor.present) {
      map['user_data_profile_color'] = Variable<String>(profileColor.value);
    }
    if (siteUrl.present) {
      map['user_data_site_url'] = Variable<String>(siteUrl.value);
    }
    if (unreadNotificationCount.present) {
      map['user_data_unread_notification_count'] =
          Variable<int>(unreadNotificationCount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('avatarImage: $avatarImage, ')
          ..write('bannerImage: $bannerImage, ')
          ..write('profileColor: $profileColor, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('unreadNotificationCount: $unreadNotificationCount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudioTableTable extends StudioTable
    with TableInfo<$StudioTableTable, StudioEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudioTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'studio_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'studio_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _siteUrlMeta =
      const VerificationMeta('siteUrl');
  @override
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'studio_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isAnimationStudioMeta =
      const VerificationMeta('isAnimationStudio');
  @override
  late final GeneratedColumn<bool> isAnimationStudio = GeneratedColumn<bool>(
      'studio_is_animation_studio', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("studio_is_animation_studio" IN (0, 1))'));
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'studio_is_favourite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("studio_is_favourite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, siteUrl, isAnimationStudio, isFavourite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'studio_table';
  @override
  VerificationContext validateIntegrity(Insertable<StudioEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('studio_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['studio_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('studio_name')) {
      context.handle(_nameMeta,
          name.isAcceptableOrUnknown(data['studio_name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('studio_site_url')) {
      context.handle(
          _siteUrlMeta,
          siteUrl.isAcceptableOrUnknown(
              data['studio_site_url']!, _siteUrlMeta));
    }
    if (data.containsKey('studio_is_animation_studio')) {
      context.handle(
          _isAnimationStudioMeta,
          isAnimationStudio.isAcceptableOrUnknown(
              data['studio_is_animation_studio']!, _isAnimationStudioMeta));
    } else if (isInserting) {
      context.missing(_isAnimationStudioMeta);
    }
    if (data.containsKey('studio_is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['studio_is_favourite']!, _isFavouriteMeta));
    } else if (isInserting) {
      context.missing(_isFavouriteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudioEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudioEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}studio_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}studio_name'])!,
      siteUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}studio_site_url']),
      isAnimationStudio: attachedDatabase.typeMapping.read(DriftSqlType.bool,
          data['${effectivePrefix}studio_is_animation_studio'])!,
      isFavourite: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}studio_is_favourite'])!,
    );
  }

  @override
  $StudioTableTable createAlias(String alias) {
    return $StudioTableTable(attachedDatabase, alias);
  }
}

class StudioEntity extends DataClass implements Insertable<StudioEntity> {
  final String id;
  final String name;
  final String? siteUrl;
  final bool isAnimationStudio;
  final bool isFavourite;
  const StudioEntity(
      {required this.id,
      required this.name,
      this.siteUrl,
      required this.isAnimationStudio,
      required this.isFavourite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['studio_id'] = Variable<String>(id);
    map['studio_name'] = Variable<String>(name);
    if (!nullToAbsent || siteUrl != null) {
      map['studio_site_url'] = Variable<String>(siteUrl);
    }
    map['studio_is_animation_studio'] = Variable<bool>(isAnimationStudio);
    map['studio_is_favourite'] = Variable<bool>(isFavourite);
    return map;
  }

  StudioTableCompanion toCompanion(bool nullToAbsent) {
    return StudioTableCompanion(
      id: Value(id),
      name: Value(name),
      siteUrl: siteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(siteUrl),
      isAnimationStudio: Value(isAnimationStudio),
      isFavourite: Value(isFavourite),
    );
  }

  factory StudioEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudioEntity(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      siteUrl: serializer.fromJson<String?>(json['siteUrl']),
      isAnimationStudio: serializer.fromJson<bool>(json['isAnimationStudio']),
      isFavourite: serializer.fromJson<bool>(json['isFavourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'siteUrl': serializer.toJson<String?>(siteUrl),
      'isAnimationStudio': serializer.toJson<bool>(isAnimationStudio),
      'isFavourite': serializer.toJson<bool>(isFavourite),
    };
  }

  StudioEntity copyWith(
          {String? id,
          String? name,
          Value<String?> siteUrl = const Value.absent(),
          bool? isAnimationStudio,
          bool? isFavourite}) =>
      StudioEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        siteUrl: siteUrl.present ? siteUrl.value : this.siteUrl,
        isAnimationStudio: isAnimationStudio ?? this.isAnimationStudio,
        isFavourite: isFavourite ?? this.isFavourite,
      );
  StudioEntity copyWithCompanion(StudioTableCompanion data) {
    return StudioEntity(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      siteUrl: data.siteUrl.present ? data.siteUrl.value : this.siteUrl,
      isAnimationStudio: data.isAnimationStudio.present
          ? data.isAnimationStudio.value
          : this.isAnimationStudio,
      isFavourite:
          data.isFavourite.present ? data.isFavourite.value : this.isFavourite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudioEntity(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('isAnimationStudio: $isAnimationStudio, ')
          ..write('isFavourite: $isFavourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, siteUrl, isAnimationStudio, isFavourite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudioEntity &&
          other.id == this.id &&
          other.name == this.name &&
          other.siteUrl == this.siteUrl &&
          other.isAnimationStudio == this.isAnimationStudio &&
          other.isFavourite == this.isFavourite);
}

class StudioTableCompanion extends UpdateCompanion<StudioEntity> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> siteUrl;
  final Value<bool> isAnimationStudio;
  final Value<bool> isFavourite;
  final Value<int> rowid;
  const StudioTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.isAnimationStudio = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudioTableCompanion.insert({
    required String id,
    required String name,
    this.siteUrl = const Value.absent(),
    required bool isAnimationStudio,
    required bool isFavourite,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        isAnimationStudio = Value(isAnimationStudio),
        isFavourite = Value(isFavourite);
  static Insertable<StudioEntity> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? siteUrl,
    Expression<bool>? isAnimationStudio,
    Expression<bool>? isFavourite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'studio_id': id,
      if (name != null) 'studio_name': name,
      if (siteUrl != null) 'studio_site_url': siteUrl,
      if (isAnimationStudio != null)
        'studio_is_animation_studio': isAnimationStudio,
      if (isFavourite != null) 'studio_is_favourite': isFavourite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudioTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? siteUrl,
      Value<bool>? isAnimationStudio,
      Value<bool>? isFavourite,
      Value<int>? rowid}) {
    return StudioTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      siteUrl: siteUrl ?? this.siteUrl,
      isAnimationStudio: isAnimationStudio ?? this.isAnimationStudio,
      isFavourite: isFavourite ?? this.isFavourite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['studio_id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['studio_name'] = Variable<String>(name.value);
    }
    if (siteUrl.present) {
      map['studio_site_url'] = Variable<String>(siteUrl.value);
    }
    if (isAnimationStudio.present) {
      map['studio_is_animation_studio'] =
          Variable<bool>(isAnimationStudio.value);
    }
    if (isFavourite.present) {
      map['studio_is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudioTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('isAnimationStudio: $isAnimationStudio, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StaffTableTable extends StaffTable
    with TableInfo<$StaffTableTable, StaffEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StaffTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _largeImageMeta =
      const VerificationMeta('largeImage');
  @override
  late final GeneratedColumn<String> largeImage = GeneratedColumn<String>(
      'staff_large_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediumImageMeta =
      const VerificationMeta('mediumImage');
  @override
  late final GeneratedColumn<String> mediumImage = GeneratedColumn<String>(
      'staff_medium_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'staff_first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _middleNameMeta =
      const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'staff_middle_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'staff_last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'staff_full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nativeNameMeta =
      const VerificationMeta('nativeName');
  @override
  late final GeneratedColumn<String> nativeName = GeneratedColumn<String>(
      'staff_native_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'staff_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'staff_gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteUrlMeta =
      const VerificationMeta('siteUrl');
  @override
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'staff_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<int> dateOfBirth = GeneratedColumn<int>(
      'staff_date_of_birth', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _dateOfDeathMeta =
      const VerificationMeta('dateOfDeath');
  @override
  late final GeneratedColumn<int> dateOfDeath = GeneratedColumn<int>(
      'staff_date_of_death', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'staff_age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'staff_is_favourite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("staff_is_favourite" IN (0, 1))'));
  static const VerificationMeta _yearsActiveMeta =
      const VerificationMeta('yearsActive');
  @override
  late final GeneratedColumn<String> yearsActive = GeneratedColumn<String>(
      'staff_years_active', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _homeTownMeta =
      const VerificationMeta('homeTown');
  @override
  late final GeneratedColumn<String> homeTown = GeneratedColumn<String>(
      'staff_home_town', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bloodTypeMeta =
      const VerificationMeta('bloodType');
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
      'staff_blood_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        largeImage,
        mediumImage,
        firstName,
        middleName,
        lastName,
        fullName,
        nativeName,
        description,
        gender,
        siteUrl,
        dateOfBirth,
        dateOfDeath,
        age,
        isFavourite,
        yearsActive,
        homeTown,
        bloodType
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'staff_table';
  @override
  VerificationContext validateIntegrity(Insertable<StaffEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('staff_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['staff_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('staff_large_image')) {
      context.handle(
          _largeImageMeta,
          largeImage.isAcceptableOrUnknown(
              data['staff_large_image']!, _largeImageMeta));
    }
    if (data.containsKey('staff_medium_image')) {
      context.handle(
          _mediumImageMeta,
          mediumImage.isAcceptableOrUnknown(
              data['staff_medium_image']!, _mediumImageMeta));
    }
    if (data.containsKey('staff_first_name')) {
      context.handle(
          _firstNameMeta,
          firstName.isAcceptableOrUnknown(
              data['staff_first_name']!, _firstNameMeta));
    }
    if (data.containsKey('staff_middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['staff_middle_name']!, _middleNameMeta));
    }
    if (data.containsKey('staff_last_name')) {
      context.handle(
          _lastNameMeta,
          lastName.isAcceptableOrUnknown(
              data['staff_last_name']!, _lastNameMeta));
    }
    if (data.containsKey('staff_full_name')) {
      context.handle(
          _fullNameMeta,
          fullName.isAcceptableOrUnknown(
              data['staff_full_name']!, _fullNameMeta));
    }
    if (data.containsKey('staff_native_name')) {
      context.handle(
          _nativeNameMeta,
          nativeName.isAcceptableOrUnknown(
              data['staff_native_name']!, _nativeNameMeta));
    }
    if (data.containsKey('staff_description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['staff_description']!, _descriptionMeta));
    }
    if (data.containsKey('staff_gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['staff_gender']!, _genderMeta));
    }
    if (data.containsKey('staff_site_url')) {
      context.handle(_siteUrlMeta,
          siteUrl.isAcceptableOrUnknown(data['staff_site_url']!, _siteUrlMeta));
    }
    if (data.containsKey('staff_date_of_birth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['staff_date_of_birth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('staff_date_of_death')) {
      context.handle(
          _dateOfDeathMeta,
          dateOfDeath.isAcceptableOrUnknown(
              data['staff_date_of_death']!, _dateOfDeathMeta));
    }
    if (data.containsKey('staff_age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['staff_age']!, _ageMeta));
    }
    if (data.containsKey('staff_is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['staff_is_favourite']!, _isFavouriteMeta));
    }
    if (data.containsKey('staff_years_active')) {
      context.handle(
          _yearsActiveMeta,
          yearsActive.isAcceptableOrUnknown(
              data['staff_years_active']!, _yearsActiveMeta));
    }
    if (data.containsKey('staff_home_town')) {
      context.handle(
          _homeTownMeta,
          homeTown.isAcceptableOrUnknown(
              data['staff_home_town']!, _homeTownMeta));
    }
    if (data.containsKey('staff_blood_type')) {
      context.handle(
          _bloodTypeMeta,
          bloodType.isAcceptableOrUnknown(
              data['staff_blood_type']!, _bloodTypeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StaffEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StaffEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_id'])!,
      largeImage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_large_image']),
      mediumImage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_medium_image']),
      firstName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_first_name']),
      middleName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_middle_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_last_name']),
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_full_name']),
      nativeName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_native_name']),
      description: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_description']),
      gender: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_gender']),
      siteUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_site_url']),
      dateOfBirth: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}staff_date_of_birth']),
      dateOfDeath: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}staff_date_of_death']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}staff_age']),
      isFavourite: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}staff_is_favourite']),
      yearsActive: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_years_active']),
      homeTown: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}staff_home_town']),
      bloodType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}staff_blood_type']),
    );
  }

  @override
  $StaffTableTable createAlias(String alias) {
    return $StaffTableTable(attachedDatabase, alias);
  }
}

class StaffEntity extends DataClass implements Insertable<StaffEntity> {
  final String id;
  final String? largeImage;
  final String? mediumImage;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? fullName;
  final String? nativeName;
  final String? description;
  final String? gender;
  final String? siteUrl;
  final int? dateOfBirth;
  final int? dateOfDeath;
  final int? age;
  final bool? isFavourite;
  final String? yearsActive;
  final String? homeTown;
  final String? bloodType;
  const StaffEntity(
      {required this.id,
      this.largeImage,
      this.mediumImage,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.nativeName,
      this.description,
      this.gender,
      this.siteUrl,
      this.dateOfBirth,
      this.dateOfDeath,
      this.age,
      this.isFavourite,
      this.yearsActive,
      this.homeTown,
      this.bloodType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['staff_id'] = Variable<String>(id);
    if (!nullToAbsent || largeImage != null) {
      map['staff_large_image'] = Variable<String>(largeImage);
    }
    if (!nullToAbsent || mediumImage != null) {
      map['staff_medium_image'] = Variable<String>(mediumImage);
    }
    if (!nullToAbsent || firstName != null) {
      map['staff_first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || middleName != null) {
      map['staff_middle_name'] = Variable<String>(middleName);
    }
    if (!nullToAbsent || lastName != null) {
      map['staff_last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || fullName != null) {
      map['staff_full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || nativeName != null) {
      map['staff_native_name'] = Variable<String>(nativeName);
    }
    if (!nullToAbsent || description != null) {
      map['staff_description'] = Variable<String>(description);
    }
    if (!nullToAbsent || gender != null) {
      map['staff_gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || siteUrl != null) {
      map['staff_site_url'] = Variable<String>(siteUrl);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['staff_date_of_birth'] = Variable<int>(dateOfBirth);
    }
    if (!nullToAbsent || dateOfDeath != null) {
      map['staff_date_of_death'] = Variable<int>(dateOfDeath);
    }
    if (!nullToAbsent || age != null) {
      map['staff_age'] = Variable<int>(age);
    }
    if (!nullToAbsent || isFavourite != null) {
      map['staff_is_favourite'] = Variable<bool>(isFavourite);
    }
    if (!nullToAbsent || yearsActive != null) {
      map['staff_years_active'] = Variable<String>(yearsActive);
    }
    if (!nullToAbsent || homeTown != null) {
      map['staff_home_town'] = Variable<String>(homeTown);
    }
    if (!nullToAbsent || bloodType != null) {
      map['staff_blood_type'] = Variable<String>(bloodType);
    }
    return map;
  }

  StaffTableCompanion toCompanion(bool nullToAbsent) {
    return StaffTableCompanion(
      id: Value(id),
      largeImage: largeImage == null && nullToAbsent
          ? const Value.absent()
          : Value(largeImage),
      mediumImage: mediumImage == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumImage),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      nativeName: nativeName == null && nullToAbsent
          ? const Value.absent()
          : Value(nativeName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      siteUrl: siteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(siteUrl),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      dateOfDeath: dateOfDeath == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfDeath),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      isFavourite: isFavourite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavourite),
      yearsActive: yearsActive == null && nullToAbsent
          ? const Value.absent()
          : Value(yearsActive),
      homeTown: homeTown == null && nullToAbsent
          ? const Value.absent()
          : Value(homeTown),
      bloodType: bloodType == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodType),
    );
  }

  factory StaffEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StaffEntity(
      id: serializer.fromJson<String>(json['id']),
      largeImage: serializer.fromJson<String?>(json['largeImage']),
      mediumImage: serializer.fromJson<String?>(json['mediumImage']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      nativeName: serializer.fromJson<String?>(json['nativeName']),
      description: serializer.fromJson<String?>(json['description']),
      gender: serializer.fromJson<String?>(json['gender']),
      siteUrl: serializer.fromJson<String?>(json['siteUrl']),
      dateOfBirth: serializer.fromJson<int?>(json['dateOfBirth']),
      dateOfDeath: serializer.fromJson<int?>(json['dateOfDeath']),
      age: serializer.fromJson<int?>(json['age']),
      isFavourite: serializer.fromJson<bool?>(json['isFavourite']),
      yearsActive: serializer.fromJson<String?>(json['yearsActive']),
      homeTown: serializer.fromJson<String?>(json['homeTown']),
      bloodType: serializer.fromJson<String?>(json['bloodType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'largeImage': serializer.toJson<String?>(largeImage),
      'mediumImage': serializer.toJson<String?>(mediumImage),
      'firstName': serializer.toJson<String?>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String?>(lastName),
      'fullName': serializer.toJson<String?>(fullName),
      'nativeName': serializer.toJson<String?>(nativeName),
      'description': serializer.toJson<String?>(description),
      'gender': serializer.toJson<String?>(gender),
      'siteUrl': serializer.toJson<String?>(siteUrl),
      'dateOfBirth': serializer.toJson<int?>(dateOfBirth),
      'dateOfDeath': serializer.toJson<int?>(dateOfDeath),
      'age': serializer.toJson<int?>(age),
      'isFavourite': serializer.toJson<bool?>(isFavourite),
      'yearsActive': serializer.toJson<String?>(yearsActive),
      'homeTown': serializer.toJson<String?>(homeTown),
      'bloodType': serializer.toJson<String?>(bloodType),
    };
  }

  StaffEntity copyWith(
          {String? id,
          Value<String?> largeImage = const Value.absent(),
          Value<String?> mediumImage = const Value.absent(),
          Value<String?> firstName = const Value.absent(),
          Value<String?> middleName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> fullName = const Value.absent(),
          Value<String?> nativeName = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> gender = const Value.absent(),
          Value<String?> siteUrl = const Value.absent(),
          Value<int?> dateOfBirth = const Value.absent(),
          Value<int?> dateOfDeath = const Value.absent(),
          Value<int?> age = const Value.absent(),
          Value<bool?> isFavourite = const Value.absent(),
          Value<String?> yearsActive = const Value.absent(),
          Value<String?> homeTown = const Value.absent(),
          Value<String?> bloodType = const Value.absent()}) =>
      StaffEntity(
        id: id ?? this.id,
        largeImage: largeImage.present ? largeImage.value : this.largeImage,
        mediumImage: mediumImage.present ? mediumImage.value : this.mediumImage,
        firstName: firstName.present ? firstName.value : this.firstName,
        middleName: middleName.present ? middleName.value : this.middleName,
        lastName: lastName.present ? lastName.value : this.lastName,
        fullName: fullName.present ? fullName.value : this.fullName,
        nativeName: nativeName.present ? nativeName.value : this.nativeName,
        description: description.present ? description.value : this.description,
        gender: gender.present ? gender.value : this.gender,
        siteUrl: siteUrl.present ? siteUrl.value : this.siteUrl,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        dateOfDeath: dateOfDeath.present ? dateOfDeath.value : this.dateOfDeath,
        age: age.present ? age.value : this.age,
        isFavourite: isFavourite.present ? isFavourite.value : this.isFavourite,
        yearsActive: yearsActive.present ? yearsActive.value : this.yearsActive,
        homeTown: homeTown.present ? homeTown.value : this.homeTown,
        bloodType: bloodType.present ? bloodType.value : this.bloodType,
      );
  StaffEntity copyWithCompanion(StaffTableCompanion data) {
    return StaffEntity(
      id: data.id.present ? data.id.value : this.id,
      largeImage:
          data.largeImage.present ? data.largeImage.value : this.largeImage,
      mediumImage:
          data.mediumImage.present ? data.mediumImage.value : this.mediumImage,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      nativeName:
          data.nativeName.present ? data.nativeName.value : this.nativeName,
      description:
          data.description.present ? data.description.value : this.description,
      gender: data.gender.present ? data.gender.value : this.gender,
      siteUrl: data.siteUrl.present ? data.siteUrl.value : this.siteUrl,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      dateOfDeath:
          data.dateOfDeath.present ? data.dateOfDeath.value : this.dateOfDeath,
      age: data.age.present ? data.age.value : this.age,
      isFavourite:
          data.isFavourite.present ? data.isFavourite.value : this.isFavourite,
      yearsActive:
          data.yearsActive.present ? data.yearsActive.value : this.yearsActive,
      homeTown: data.homeTown.present ? data.homeTown.value : this.homeTown,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StaffEntity(')
          ..write('id: $id, ')
          ..write('largeImage: $largeImage, ')
          ..write('mediumImage: $mediumImage, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('nativeName: $nativeName, ')
          ..write('description: $description, ')
          ..write('gender: $gender, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('dateOfDeath: $dateOfDeath, ')
          ..write('age: $age, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('yearsActive: $yearsActive, ')
          ..write('homeTown: $homeTown, ')
          ..write('bloodType: $bloodType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      largeImage,
      mediumImage,
      firstName,
      middleName,
      lastName,
      fullName,
      nativeName,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StaffEntity &&
          other.id == this.id &&
          other.largeImage == this.largeImage &&
          other.mediumImage == this.mediumImage &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.fullName == this.fullName &&
          other.nativeName == this.nativeName &&
          other.description == this.description &&
          other.gender == this.gender &&
          other.siteUrl == this.siteUrl &&
          other.dateOfBirth == this.dateOfBirth &&
          other.dateOfDeath == this.dateOfDeath &&
          other.age == this.age &&
          other.isFavourite == this.isFavourite &&
          other.yearsActive == this.yearsActive &&
          other.homeTown == this.homeTown &&
          other.bloodType == this.bloodType);
}

class StaffTableCompanion extends UpdateCompanion<StaffEntity> {
  final Value<String> id;
  final Value<String?> largeImage;
  final Value<String?> mediumImage;
  final Value<String?> firstName;
  final Value<String?> middleName;
  final Value<String?> lastName;
  final Value<String?> fullName;
  final Value<String?> nativeName;
  final Value<String?> description;
  final Value<String?> gender;
  final Value<String?> siteUrl;
  final Value<int?> dateOfBirth;
  final Value<int?> dateOfDeath;
  final Value<int?> age;
  final Value<bool?> isFavourite;
  final Value<String?> yearsActive;
  final Value<String?> homeTown;
  final Value<String?> bloodType;
  final Value<int> rowid;
  const StaffTableCompanion({
    this.id = const Value.absent(),
    this.largeImage = const Value.absent(),
    this.mediumImage = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nativeName = const Value.absent(),
    this.description = const Value.absent(),
    this.gender = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.dateOfDeath = const Value.absent(),
    this.age = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.yearsActive = const Value.absent(),
    this.homeTown = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StaffTableCompanion.insert({
    required String id,
    this.largeImage = const Value.absent(),
    this.mediumImage = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nativeName = const Value.absent(),
    this.description = const Value.absent(),
    this.gender = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.dateOfDeath = const Value.absent(),
    this.age = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.yearsActive = const Value.absent(),
    this.homeTown = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<StaffEntity> custom({
    Expression<String>? id,
    Expression<String>? largeImage,
    Expression<String>? mediumImage,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<String>? fullName,
    Expression<String>? nativeName,
    Expression<String>? description,
    Expression<String>? gender,
    Expression<String>? siteUrl,
    Expression<int>? dateOfBirth,
    Expression<int>? dateOfDeath,
    Expression<int>? age,
    Expression<bool>? isFavourite,
    Expression<String>? yearsActive,
    Expression<String>? homeTown,
    Expression<String>? bloodType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'staff_id': id,
      if (largeImage != null) 'staff_large_image': largeImage,
      if (mediumImage != null) 'staff_medium_image': mediumImage,
      if (firstName != null) 'staff_first_name': firstName,
      if (middleName != null) 'staff_middle_name': middleName,
      if (lastName != null) 'staff_last_name': lastName,
      if (fullName != null) 'staff_full_name': fullName,
      if (nativeName != null) 'staff_native_name': nativeName,
      if (description != null) 'staff_description': description,
      if (gender != null) 'staff_gender': gender,
      if (siteUrl != null) 'staff_site_url': siteUrl,
      if (dateOfBirth != null) 'staff_date_of_birth': dateOfBirth,
      if (dateOfDeath != null) 'staff_date_of_death': dateOfDeath,
      if (age != null) 'staff_age': age,
      if (isFavourite != null) 'staff_is_favourite': isFavourite,
      if (yearsActive != null) 'staff_years_active': yearsActive,
      if (homeTown != null) 'staff_home_town': homeTown,
      if (bloodType != null) 'staff_blood_type': bloodType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StaffTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? largeImage,
      Value<String?>? mediumImage,
      Value<String?>? firstName,
      Value<String?>? middleName,
      Value<String?>? lastName,
      Value<String?>? fullName,
      Value<String?>? nativeName,
      Value<String?>? description,
      Value<String?>? gender,
      Value<String?>? siteUrl,
      Value<int?>? dateOfBirth,
      Value<int?>? dateOfDeath,
      Value<int?>? age,
      Value<bool?>? isFavourite,
      Value<String?>? yearsActive,
      Value<String?>? homeTown,
      Value<String?>? bloodType,
      Value<int>? rowid}) {
    return StaffTableCompanion(
      id: id ?? this.id,
      largeImage: largeImage ?? this.largeImage,
      mediumImage: mediumImage ?? this.mediumImage,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      nativeName: nativeName ?? this.nativeName,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      siteUrl: siteUrl ?? this.siteUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      dateOfDeath: dateOfDeath ?? this.dateOfDeath,
      age: age ?? this.age,
      isFavourite: isFavourite ?? this.isFavourite,
      yearsActive: yearsActive ?? this.yearsActive,
      homeTown: homeTown ?? this.homeTown,
      bloodType: bloodType ?? this.bloodType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['staff_id'] = Variable<String>(id.value);
    }
    if (largeImage.present) {
      map['staff_large_image'] = Variable<String>(largeImage.value);
    }
    if (mediumImage.present) {
      map['staff_medium_image'] = Variable<String>(mediumImage.value);
    }
    if (firstName.present) {
      map['staff_first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['staff_middle_name'] = Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['staff_last_name'] = Variable<String>(lastName.value);
    }
    if (fullName.present) {
      map['staff_full_name'] = Variable<String>(fullName.value);
    }
    if (nativeName.present) {
      map['staff_native_name'] = Variable<String>(nativeName.value);
    }
    if (description.present) {
      map['staff_description'] = Variable<String>(description.value);
    }
    if (gender.present) {
      map['staff_gender'] = Variable<String>(gender.value);
    }
    if (siteUrl.present) {
      map['staff_site_url'] = Variable<String>(siteUrl.value);
    }
    if (dateOfBirth.present) {
      map['staff_date_of_birth'] = Variable<int>(dateOfBirth.value);
    }
    if (dateOfDeath.present) {
      map['staff_date_of_death'] = Variable<int>(dateOfDeath.value);
    }
    if (age.present) {
      map['staff_age'] = Variable<int>(age.value);
    }
    if (isFavourite.present) {
      map['staff_is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (yearsActive.present) {
      map['staff_years_active'] = Variable<String>(yearsActive.value);
    }
    if (homeTown.present) {
      map['staff_home_town'] = Variable<String>(homeTown.value);
    }
    if (bloodType.present) {
      map['staff_blood_type'] = Variable<String>(bloodType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StaffTableCompanion(')
          ..write('id: $id, ')
          ..write('largeImage: $largeImage, ')
          ..write('mediumImage: $mediumImage, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('nativeName: $nativeName, ')
          ..write('description: $description, ')
          ..write('gender: $gender, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('dateOfDeath: $dateOfDeath, ')
          ..write('age: $age, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('yearsActive: $yearsActive, ')
          ..write('homeTown: $homeTown, ')
          ..write('bloodType: $bloodType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActivityTableTable extends ActivityTable
    with TableInfo<$ActivityTableTable, ActivityEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'activity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'activity_userId', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'activity_mediaId', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _textContentMeta =
      const VerificationMeta('textContent');
  @override
  late final GeneratedColumn<String> textContent = GeneratedColumn<String>(
      'activity_text', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'activity_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<String> progress = GeneratedColumn<String>(
      'activity_progress', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'activity_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteUrlMeta =
      const VerificationMeta('siteUrl');
  @override
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'activity_siteUrl', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _replyCountMeta =
      const VerificationMeta('replyCount');
  @override
  late final GeneratedColumn<int> replyCount = GeneratedColumn<int>(
      'activity_replyCount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _likeCountMeta =
      const VerificationMeta('likeCount');
  @override
  late final GeneratedColumn<int> likeCount = GeneratedColumn<int>(
      'activity_likeCount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'activity_createdAt', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isLockedMeta =
      const VerificationMeta('isLocked');
  @override
  late final GeneratedColumn<bool> isLocked = GeneratedColumn<bool>(
      'activity_isLocked', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("activity_isLocked" IN (0, 1))'));
  static const VerificationMeta _isLikedMeta =
      const VerificationMeta('isLiked');
  @override
  late final GeneratedColumn<bool> isLiked = GeneratedColumn<bool>(
      'activity_isLiked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("activity_isLiked" IN (0, 1))'),
      defaultValue: const Constant<bool>(false));
  static const VerificationMeta _isPinnedMeta =
      const VerificationMeta('isPinned');
  @override
  late final GeneratedColumn<bool> isPinned = GeneratedColumn<bool>(
      'activity_isPinned', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("activity_isPinned" IN (0, 1))'),
      defaultValue: const Constant<bool>(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        mediaId,
        textContent,
        status,
        progress,
        type,
        siteUrl,
        replyCount,
        likeCount,
        createdAt,
        isLocked,
        isLiked,
        isPinned
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_table';
  @override
  VerificationContext validateIntegrity(Insertable<ActivityEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('activity_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['activity_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('activity_userId')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['activity_userId']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('activity_mediaId')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['activity_mediaId']!, _mediaIdMeta));
    }
    if (data.containsKey('activity_text')) {
      context.handle(
          _textContentMeta,
          textContent.isAcceptableOrUnknown(
              data['activity_text']!, _textContentMeta));
    }
    if (data.containsKey('activity_status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['activity_status']!, _statusMeta));
    }
    if (data.containsKey('activity_progress')) {
      context.handle(
          _progressMeta,
          progress.isAcceptableOrUnknown(
              data['activity_progress']!, _progressMeta));
    }
    if (data.containsKey('activity_type')) {
      context.handle(_typeMeta,
          type.isAcceptableOrUnknown(data['activity_type']!, _typeMeta));
    }
    if (data.containsKey('activity_siteUrl')) {
      context.handle(
          _siteUrlMeta,
          siteUrl.isAcceptableOrUnknown(
              data['activity_siteUrl']!, _siteUrlMeta));
    }
    if (data.containsKey('activity_replyCount')) {
      context.handle(
          _replyCountMeta,
          replyCount.isAcceptableOrUnknown(
              data['activity_replyCount']!, _replyCountMeta));
    }
    if (data.containsKey('activity_likeCount')) {
      context.handle(
          _likeCountMeta,
          likeCount.isAcceptableOrUnknown(
              data['activity_likeCount']!, _likeCountMeta));
    }
    if (data.containsKey('activity_createdAt')) {
      context.handle(
          _createdAtMeta,
          createdAt.isAcceptableOrUnknown(
              data['activity_createdAt']!, _createdAtMeta));
    }
    if (data.containsKey('activity_isLocked')) {
      context.handle(
          _isLockedMeta,
          isLocked.isAcceptableOrUnknown(
              data['activity_isLocked']!, _isLockedMeta));
    }
    if (data.containsKey('activity_isLiked')) {
      context.handle(
          _isLikedMeta,
          isLiked.isAcceptableOrUnknown(
              data['activity_isLiked']!, _isLikedMeta));
    }
    if (data.containsKey('activity_isPinned')) {
      context.handle(
          _isPinnedMeta,
          isPinned.isAcceptableOrUnknown(
              data['activity_isPinned']!, _isPinnedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivityEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_id'])!,
      userId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activity_userId'])!,
      mediaId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activity_mediaId']),
      textContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_text']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_status']),
      progress: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activity_progress']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activity_type']),
      siteUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}activity_siteUrl']),
      replyCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}activity_replyCount'])!,
      likeCount: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}activity_likeCount'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}activity_createdAt']),
      isLocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}activity_isLocked']),
      isLiked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}activity_isLiked'])!,
      isPinned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}activity_isPinned']),
    );
  }

  @override
  $ActivityTableTable createAlias(String alias) {
    return $ActivityTableTable(attachedDatabase, alias);
  }
}

class ActivityEntity extends DataClass implements Insertable<ActivityEntity> {
  final String id;
  final String userId;
  final String? mediaId;
  final String? textContent;
  final String? status;
  final String? progress;
  final String? type;
  final String? siteUrl;
  final int replyCount;
  final int likeCount;
  final int? createdAt;
  final bool? isLocked;
  final bool isLiked;
  final bool? isPinned;
  const ActivityEntity(
      {required this.id,
      required this.userId,
      this.mediaId,
      this.textContent,
      this.status,
      this.progress,
      this.type,
      this.siteUrl,
      required this.replyCount,
      required this.likeCount,
      this.createdAt,
      this.isLocked,
      required this.isLiked,
      this.isPinned});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['activity_id'] = Variable<String>(id);
    map['activity_userId'] = Variable<String>(userId);
    if (!nullToAbsent || mediaId != null) {
      map['activity_mediaId'] = Variable<String>(mediaId);
    }
    if (!nullToAbsent || textContent != null) {
      map['activity_text'] = Variable<String>(textContent);
    }
    if (!nullToAbsent || status != null) {
      map['activity_status'] = Variable<String>(status);
    }
    if (!nullToAbsent || progress != null) {
      map['activity_progress'] = Variable<String>(progress);
    }
    if (!nullToAbsent || type != null) {
      map['activity_type'] = Variable<String>(type);
    }
    if (!nullToAbsent || siteUrl != null) {
      map['activity_siteUrl'] = Variable<String>(siteUrl);
    }
    map['activity_replyCount'] = Variable<int>(replyCount);
    map['activity_likeCount'] = Variable<int>(likeCount);
    if (!nullToAbsent || createdAt != null) {
      map['activity_createdAt'] = Variable<int>(createdAt);
    }
    if (!nullToAbsent || isLocked != null) {
      map['activity_isLocked'] = Variable<bool>(isLocked);
    }
    map['activity_isLiked'] = Variable<bool>(isLiked);
    if (!nullToAbsent || isPinned != null) {
      map['activity_isPinned'] = Variable<bool>(isPinned);
    }
    return map;
  }

  ActivityTableCompanion toCompanion(bool nullToAbsent) {
    return ActivityTableCompanion(
      id: Value(id),
      userId: Value(userId),
      mediaId: mediaId == null && nullToAbsent
          ? const Value.absent()
          : Value(mediaId),
      textContent: textContent == null && nullToAbsent
          ? const Value.absent()
          : Value(textContent),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      siteUrl: siteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(siteUrl),
      replyCount: Value(replyCount),
      likeCount: Value(likeCount),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      isLocked: isLocked == null && nullToAbsent
          ? const Value.absent()
          : Value(isLocked),
      isLiked: Value(isLiked),
      isPinned: isPinned == null && nullToAbsent
          ? const Value.absent()
          : Value(isPinned),
    );
  }

  factory ActivityEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      mediaId: serializer.fromJson<String?>(json['mediaId']),
      textContent: serializer.fromJson<String?>(json['textContent']),
      status: serializer.fromJson<String?>(json['status']),
      progress: serializer.fromJson<String?>(json['progress']),
      type: serializer.fromJson<String?>(json['type']),
      siteUrl: serializer.fromJson<String?>(json['siteUrl']),
      replyCount: serializer.fromJson<int>(json['replyCount']),
      likeCount: serializer.fromJson<int>(json['likeCount']),
      createdAt: serializer.fromJson<int?>(json['createdAt']),
      isLocked: serializer.fromJson<bool?>(json['isLocked']),
      isLiked: serializer.fromJson<bool>(json['isLiked']),
      isPinned: serializer.fromJson<bool?>(json['isPinned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'mediaId': serializer.toJson<String?>(mediaId),
      'textContent': serializer.toJson<String?>(textContent),
      'status': serializer.toJson<String?>(status),
      'progress': serializer.toJson<String?>(progress),
      'type': serializer.toJson<String?>(type),
      'siteUrl': serializer.toJson<String?>(siteUrl),
      'replyCount': serializer.toJson<int>(replyCount),
      'likeCount': serializer.toJson<int>(likeCount),
      'createdAt': serializer.toJson<int?>(createdAt),
      'isLocked': serializer.toJson<bool?>(isLocked),
      'isLiked': serializer.toJson<bool>(isLiked),
      'isPinned': serializer.toJson<bool?>(isPinned),
    };
  }

  ActivityEntity copyWith(
          {String? id,
          String? userId,
          Value<String?> mediaId = const Value.absent(),
          Value<String?> textContent = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> progress = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<String?> siteUrl = const Value.absent(),
          int? replyCount,
          int? likeCount,
          Value<int?> createdAt = const Value.absent(),
          Value<bool?> isLocked = const Value.absent(),
          bool? isLiked,
          Value<bool?> isPinned = const Value.absent()}) =>
      ActivityEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        mediaId: mediaId.present ? mediaId.value : this.mediaId,
        textContent: textContent.present ? textContent.value : this.textContent,
        status: status.present ? status.value : this.status,
        progress: progress.present ? progress.value : this.progress,
        type: type.present ? type.value : this.type,
        siteUrl: siteUrl.present ? siteUrl.value : this.siteUrl,
        replyCount: replyCount ?? this.replyCount,
        likeCount: likeCount ?? this.likeCount,
        createdAt: createdAt.present ? createdAt.value : this.createdAt,
        isLocked: isLocked.present ? isLocked.value : this.isLocked,
        isLiked: isLiked ?? this.isLiked,
        isPinned: isPinned.present ? isPinned.value : this.isPinned,
      );
  ActivityEntity copyWithCompanion(ActivityTableCompanion data) {
    return ActivityEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      textContent:
          data.textContent.present ? data.textContent.value : this.textContent,
      status: data.status.present ? data.status.value : this.status,
      progress: data.progress.present ? data.progress.value : this.progress,
      type: data.type.present ? data.type.value : this.type,
      siteUrl: data.siteUrl.present ? data.siteUrl.value : this.siteUrl,
      replyCount:
          data.replyCount.present ? data.replyCount.value : this.replyCount,
      likeCount: data.likeCount.present ? data.likeCount.value : this.likeCount,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isLocked: data.isLocked.present ? data.isLocked.value : this.isLocked,
      isLiked: data.isLiked.present ? data.isLiked.value : this.isLiked,
      isPinned: data.isPinned.present ? data.isPinned.value : this.isPinned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('mediaId: $mediaId, ')
          ..write('textContent: $textContent, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('type: $type, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('replyCount: $replyCount, ')
          ..write('likeCount: $likeCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('isLocked: $isLocked, ')
          ..write('isLiked: $isLiked, ')
          ..write('isPinned: $isPinned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      mediaId,
      textContent,
      status,
      progress,
      type,
      siteUrl,
      replyCount,
      likeCount,
      createdAt,
      isLocked,
      isLiked,
      isPinned);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.mediaId == this.mediaId &&
          other.textContent == this.textContent &&
          other.status == this.status &&
          other.progress == this.progress &&
          other.type == this.type &&
          other.siteUrl == this.siteUrl &&
          other.replyCount == this.replyCount &&
          other.likeCount == this.likeCount &&
          other.createdAt == this.createdAt &&
          other.isLocked == this.isLocked &&
          other.isLiked == this.isLiked &&
          other.isPinned == this.isPinned);
}

class ActivityTableCompanion extends UpdateCompanion<ActivityEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String?> mediaId;
  final Value<String?> textContent;
  final Value<String?> status;
  final Value<String?> progress;
  final Value<String?> type;
  final Value<String?> siteUrl;
  final Value<int> replyCount;
  final Value<int> likeCount;
  final Value<int?> createdAt;
  final Value<bool?> isLocked;
  final Value<bool> isLiked;
  final Value<bool?> isPinned;
  final Value<int> rowid;
  const ActivityTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.textContent = const Value.absent(),
    this.status = const Value.absent(),
    this.progress = const Value.absent(),
    this.type = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.replyCount = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActivityTableCompanion.insert({
    required String id,
    required String userId,
    this.mediaId = const Value.absent(),
    this.textContent = const Value.absent(),
    this.status = const Value.absent(),
    this.progress = const Value.absent(),
    this.type = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.replyCount = const Value.absent(),
    this.likeCount = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isLocked = const Value.absent(),
    this.isLiked = const Value.absent(),
    this.isPinned = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId);
  static Insertable<ActivityEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? mediaId,
    Expression<String>? textContent,
    Expression<String>? status,
    Expression<String>? progress,
    Expression<String>? type,
    Expression<String>? siteUrl,
    Expression<int>? replyCount,
    Expression<int>? likeCount,
    Expression<int>? createdAt,
    Expression<bool>? isLocked,
    Expression<bool>? isLiked,
    Expression<bool>? isPinned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'activity_id': id,
      if (userId != null) 'activity_userId': userId,
      if (mediaId != null) 'activity_mediaId': mediaId,
      if (textContent != null) 'activity_text': textContent,
      if (status != null) 'activity_status': status,
      if (progress != null) 'activity_progress': progress,
      if (type != null) 'activity_type': type,
      if (siteUrl != null) 'activity_siteUrl': siteUrl,
      if (replyCount != null) 'activity_replyCount': replyCount,
      if (likeCount != null) 'activity_likeCount': likeCount,
      if (createdAt != null) 'activity_createdAt': createdAt,
      if (isLocked != null) 'activity_isLocked': isLocked,
      if (isLiked != null) 'activity_isLiked': isLiked,
      if (isPinned != null) 'activity_isPinned': isPinned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActivityTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String?>? mediaId,
      Value<String?>? textContent,
      Value<String?>? status,
      Value<String?>? progress,
      Value<String?>? type,
      Value<String?>? siteUrl,
      Value<int>? replyCount,
      Value<int>? likeCount,
      Value<int?>? createdAt,
      Value<bool?>? isLocked,
      Value<bool>? isLiked,
      Value<bool?>? isPinned,
      Value<int>? rowid}) {
    return ActivityTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      mediaId: mediaId ?? this.mediaId,
      textContent: textContent ?? this.textContent,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      type: type ?? this.type,
      siteUrl: siteUrl ?? this.siteUrl,
      replyCount: replyCount ?? this.replyCount,
      likeCount: likeCount ?? this.likeCount,
      createdAt: createdAt ?? this.createdAt,
      isLocked: isLocked ?? this.isLocked,
      isLiked: isLiked ?? this.isLiked,
      isPinned: isPinned ?? this.isPinned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['activity_id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['activity_userId'] = Variable<String>(userId.value);
    }
    if (mediaId.present) {
      map['activity_mediaId'] = Variable<String>(mediaId.value);
    }
    if (textContent.present) {
      map['activity_text'] = Variable<String>(textContent.value);
    }
    if (status.present) {
      map['activity_status'] = Variable<String>(status.value);
    }
    if (progress.present) {
      map['activity_progress'] = Variable<String>(progress.value);
    }
    if (type.present) {
      map['activity_type'] = Variable<String>(type.value);
    }
    if (siteUrl.present) {
      map['activity_siteUrl'] = Variable<String>(siteUrl.value);
    }
    if (replyCount.present) {
      map['activity_replyCount'] = Variable<int>(replyCount.value);
    }
    if (likeCount.present) {
      map['activity_likeCount'] = Variable<int>(likeCount.value);
    }
    if (createdAt.present) {
      map['activity_createdAt'] = Variable<int>(createdAt.value);
    }
    if (isLocked.present) {
      map['activity_isLocked'] = Variable<bool>(isLocked.value);
    }
    if (isLiked.present) {
      map['activity_isLiked'] = Variable<bool>(isLiked.value);
    }
    if (isPinned.present) {
      map['activity_isPinned'] = Variable<bool>(isPinned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('mediaId: $mediaId, ')
          ..write('textContent: $textContent, ')
          ..write('status: $status, ')
          ..write('progress: $progress, ')
          ..write('type: $type, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('replyCount: $replyCount, ')
          ..write('likeCount: $likeCount, ')
          ..write('createdAt: $createdAt, ')
          ..write('isLocked: $isLocked, ')
          ..write('isLiked: $isLiked, ')
          ..write('isPinned: $isPinned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AiringScheduleTableTable extends AiringScheduleTable
    with TableInfo<$AiringScheduleTableTable, AiringScheduleEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AiringScheduleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'airing_schedules_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'airing_schedules_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _airingAtMeta =
      const VerificationMeta('airingAt');
  @override
  late final GeneratedColumn<int> airingAt = GeneratedColumn<int>(
      'airing_schedules_airing_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _timeUntilAiringMeta =
      const VerificationMeta('timeUntilAiring');
  @override
  late final GeneratedColumn<int> timeUntilAiring = GeneratedColumn<int>(
      'airing_schedules_time_until_airing', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _episodeMeta =
      const VerificationMeta('episode');
  @override
  late final GeneratedColumn<int> episode = GeneratedColumn<int>(
      'airing_schedules_episode', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mediaId, airingAt, timeUntilAiring, episode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'airing_schedule_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<AiringScheduleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('airing_schedules_id')) {
      context.handle(_idMeta,
          id.isAcceptableOrUnknown(data['airing_schedules_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('airing_schedules_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['airing_schedules_media_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('airing_schedules_airing_at')) {
      context.handle(
          _airingAtMeta,
          airingAt.isAcceptableOrUnknown(
              data['airing_schedules_airing_at']!, _airingAtMeta));
    }
    if (data.containsKey('airing_schedules_time_until_airing')) {
      context.handle(
          _timeUntilAiringMeta,
          timeUntilAiring.isAcceptableOrUnknown(
              data['airing_schedules_time_until_airing']!,
              _timeUntilAiringMeta));
    }
    if (data.containsKey('airing_schedules_episode')) {
      context.handle(
          _episodeMeta,
          episode.isAcceptableOrUnknown(
              data['airing_schedules_episode']!, _episodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AiringScheduleEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AiringScheduleEntity(
      id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}airing_schedules_id'])!,
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}airing_schedules_media_id'])!,
      airingAt: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}airing_schedules_airing_at']),
      timeUntilAiring: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}airing_schedules_time_until_airing']),
      episode: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}airing_schedules_episode']),
    );
  }

  @override
  $AiringScheduleTableTable createAlias(String alias) {
    return $AiringScheduleTableTable(attachedDatabase, alias);
  }
}

class AiringScheduleEntity extends DataClass
    implements Insertable<AiringScheduleEntity> {
  final String id;
  final String mediaId;
  final int? airingAt;
  final int? timeUntilAiring;
  final int? episode;
  const AiringScheduleEntity(
      {required this.id,
      required this.mediaId,
      this.airingAt,
      this.timeUntilAiring,
      this.episode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['airing_schedules_id'] = Variable<String>(id);
    map['airing_schedules_media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || airingAt != null) {
      map['airing_schedules_airing_at'] = Variable<int>(airingAt);
    }
    if (!nullToAbsent || timeUntilAiring != null) {
      map['airing_schedules_time_until_airing'] =
          Variable<int>(timeUntilAiring);
    }
    if (!nullToAbsent || episode != null) {
      map['airing_schedules_episode'] = Variable<int>(episode);
    }
    return map;
  }

  AiringScheduleTableCompanion toCompanion(bool nullToAbsent) {
    return AiringScheduleTableCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      airingAt: airingAt == null && nullToAbsent
          ? const Value.absent()
          : Value(airingAt),
      timeUntilAiring: timeUntilAiring == null && nullToAbsent
          ? const Value.absent()
          : Value(timeUntilAiring),
      episode: episode == null && nullToAbsent
          ? const Value.absent()
          : Value(episode),
    );
  }

  factory AiringScheduleEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AiringScheduleEntity(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      airingAt: serializer.fromJson<int?>(json['airingAt']),
      timeUntilAiring: serializer.fromJson<int?>(json['timeUntilAiring']),
      episode: serializer.fromJson<int?>(json['episode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'airingAt': serializer.toJson<int?>(airingAt),
      'timeUntilAiring': serializer.toJson<int?>(timeUntilAiring),
      'episode': serializer.toJson<int?>(episode),
    };
  }

  AiringScheduleEntity copyWith(
          {String? id,
          String? mediaId,
          Value<int?> airingAt = const Value.absent(),
          Value<int?> timeUntilAiring = const Value.absent(),
          Value<int?> episode = const Value.absent()}) =>
      AiringScheduleEntity(
        id: id ?? this.id,
        mediaId: mediaId ?? this.mediaId,
        airingAt: airingAt.present ? airingAt.value : this.airingAt,
        timeUntilAiring: timeUntilAiring.present
            ? timeUntilAiring.value
            : this.timeUntilAiring,
        episode: episode.present ? episode.value : this.episode,
      );
  AiringScheduleEntity copyWithCompanion(AiringScheduleTableCompanion data) {
    return AiringScheduleEntity(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      airingAt: data.airingAt.present ? data.airingAt.value : this.airingAt,
      timeUntilAiring: data.timeUntilAiring.present
          ? data.timeUntilAiring.value
          : this.timeUntilAiring,
      episode: data.episode.present ? data.episode.value : this.episode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AiringScheduleEntity(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('airingAt: $airingAt, ')
          ..write('timeUntilAiring: $timeUntilAiring, ')
          ..write('episode: $episode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mediaId, airingAt, timeUntilAiring, episode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AiringScheduleEntity &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.airingAt == this.airingAt &&
          other.timeUntilAiring == this.timeUntilAiring &&
          other.episode == this.episode);
}

class AiringScheduleTableCompanion
    extends UpdateCompanion<AiringScheduleEntity> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<int?> airingAt;
  final Value<int?> timeUntilAiring;
  final Value<int?> episode;
  final Value<int> rowid;
  const AiringScheduleTableCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.airingAt = const Value.absent(),
    this.timeUntilAiring = const Value.absent(),
    this.episode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AiringScheduleTableCompanion.insert({
    required String id,
    required String mediaId,
    this.airingAt = const Value.absent(),
    this.timeUntilAiring = const Value.absent(),
    this.episode = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mediaId = Value(mediaId);
  static Insertable<AiringScheduleEntity> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<int>? airingAt,
    Expression<int>? timeUntilAiring,
    Expression<int>? episode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'airing_schedules_id': id,
      if (mediaId != null) 'airing_schedules_media_id': mediaId,
      if (airingAt != null) 'airing_schedules_airing_at': airingAt,
      if (timeUntilAiring != null)
        'airing_schedules_time_until_airing': timeUntilAiring,
      if (episode != null) 'airing_schedules_episode': episode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AiringScheduleTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? mediaId,
      Value<int?>? airingAt,
      Value<int?>? timeUntilAiring,
      Value<int?>? episode,
      Value<int>? rowid}) {
    return AiringScheduleTableCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      airingAt: airingAt ?? this.airingAt,
      timeUntilAiring: timeUntilAiring ?? this.timeUntilAiring,
      episode: episode ?? this.episode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['airing_schedules_id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['airing_schedules_media_id'] = Variable<String>(mediaId.value);
    }
    if (airingAt.present) {
      map['airing_schedules_airing_at'] = Variable<int>(airingAt.value);
    }
    if (timeUntilAiring.present) {
      map['airing_schedules_time_until_airing'] =
          Variable<int>(timeUntilAiring.value);
    }
    if (episode.present) {
      map['airing_schedules_episode'] = Variable<int>(episode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AiringScheduleTableCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('airingAt: $airingAt, ')
          ..write('timeUntilAiring: $timeUntilAiring, ')
          ..write('episode: $episode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterTableTable extends CharacterTable
    with TableInfo<$CharacterTableTable, CharacterEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _largeImageMeta =
      const VerificationMeta('largeImage');
  @override
  late final GeneratedColumn<String> largeImage = GeneratedColumn<String>(
      'character_large_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mediumImageMeta =
      const VerificationMeta('mediumImage');
  @override
  late final GeneratedColumn<String> mediumImage = GeneratedColumn<String>(
      'character_medium_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'character_first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _middleNameMeta =
      const VerificationMeta('middleName');
  @override
  late final GeneratedColumn<String> middleName = GeneratedColumn<String>(
      'character_middle_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'character_last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'character_full_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nativeNameMeta =
      const VerificationMeta('nativeName');
  @override
  late final GeneratedColumn<String> nativeName = GeneratedColumn<String>(
      'character_native_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'character_description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'character_gender', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<String> age = GeneratedColumn<String>(
      'character_age', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bloodTypeMeta =
      const VerificationMeta('bloodType');
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
      'character_blood_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteUrlMeta =
      const VerificationMeta('siteUrl');
  @override
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'character_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateOfBirthMeta =
      const VerificationMeta('dateOfBirth');
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
      'character_dateOfBirth', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _favouritesMeta =
      const VerificationMeta('favourites');
  @override
  late final GeneratedColumn<int> favourites = GeneratedColumn<int>(
      'character_favourites', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'character_is_favourite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("character_is_favourite" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        largeImage,
        mediumImage,
        firstName,
        middleName,
        lastName,
        fullName,
        nativeName,
        description,
        gender,
        age,
        bloodType,
        siteUrl,
        dateOfBirth,
        favourites,
        isFavourite
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_table';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['character_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('character_large_image')) {
      context.handle(
          _largeImageMeta,
          largeImage.isAcceptableOrUnknown(
              data['character_large_image']!, _largeImageMeta));
    }
    if (data.containsKey('character_medium_image')) {
      context.handle(
          _mediumImageMeta,
          mediumImage.isAcceptableOrUnknown(
              data['character_medium_image']!, _mediumImageMeta));
    }
    if (data.containsKey('character_first_name')) {
      context.handle(
          _firstNameMeta,
          firstName.isAcceptableOrUnknown(
              data['character_first_name']!, _firstNameMeta));
    }
    if (data.containsKey('character_middle_name')) {
      context.handle(
          _middleNameMeta,
          middleName.isAcceptableOrUnknown(
              data['character_middle_name']!, _middleNameMeta));
    }
    if (data.containsKey('character_last_name')) {
      context.handle(
          _lastNameMeta,
          lastName.isAcceptableOrUnknown(
              data['character_last_name']!, _lastNameMeta));
    }
    if (data.containsKey('character_full_name')) {
      context.handle(
          _fullNameMeta,
          fullName.isAcceptableOrUnknown(
              data['character_full_name']!, _fullNameMeta));
    }
    if (data.containsKey('character_native_name')) {
      context.handle(
          _nativeNameMeta,
          nativeName.isAcceptableOrUnknown(
              data['character_native_name']!, _nativeNameMeta));
    }
    if (data.containsKey('character_description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['character_description']!, _descriptionMeta));
    }
    if (data.containsKey('character_gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['character_gender']!, _genderMeta));
    }
    if (data.containsKey('character_age')) {
      context.handle(_ageMeta,
          age.isAcceptableOrUnknown(data['character_age']!, _ageMeta));
    }
    if (data.containsKey('character_blood_type')) {
      context.handle(
          _bloodTypeMeta,
          bloodType.isAcceptableOrUnknown(
              data['character_blood_type']!, _bloodTypeMeta));
    }
    if (data.containsKey('character_site_url')) {
      context.handle(
          _siteUrlMeta,
          siteUrl.isAcceptableOrUnknown(
              data['character_site_url']!, _siteUrlMeta));
    }
    if (data.containsKey('character_dateOfBirth')) {
      context.handle(
          _dateOfBirthMeta,
          dateOfBirth.isAcceptableOrUnknown(
              data['character_dateOfBirth']!, _dateOfBirthMeta));
    }
    if (data.containsKey('character_favourites')) {
      context.handle(
          _favouritesMeta,
          favourites.isAcceptableOrUnknown(
              data['character_favourites']!, _favouritesMeta));
    }
    if (data.containsKey('character_is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['character_is_favourite']!, _isFavouriteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CharacterEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_id'])!,
      largeImage: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_large_image']),
      mediumImage: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}character_medium_image']),
      firstName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_first_name']),
      middleName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_middle_name']),
      lastName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_last_name']),
      fullName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_full_name']),
      nativeName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_native_name']),
      description: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_description']),
      gender: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_gender']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character_age']),
      bloodType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_blood_type']),
      siteUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}character_site_url']),
      dateOfBirth: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}character_dateOfBirth']),
      favourites: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}character_favourites']),
      isFavourite: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}character_is_favourite']),
    );
  }

  @override
  $CharacterTableTable createAlias(String alias) {
    return $CharacterTableTable(attachedDatabase, alias);
  }
}

class CharacterEntity extends DataClass implements Insertable<CharacterEntity> {
  final String id;
  final String? largeImage;
  final String? mediumImage;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? fullName;
  final String? nativeName;
  final String? description;
  final String? gender;
  final String? age;
  final String? bloodType;
  final String? siteUrl;
  final DateTime? dateOfBirth;
  final int? favourites;
  final bool? isFavourite;
  const CharacterEntity(
      {required this.id,
      this.largeImage,
      this.mediumImage,
      this.firstName,
      this.middleName,
      this.lastName,
      this.fullName,
      this.nativeName,
      this.description,
      this.gender,
      this.age,
      this.bloodType,
      this.siteUrl,
      this.dateOfBirth,
      this.favourites,
      this.isFavourite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_id'] = Variable<String>(id);
    if (!nullToAbsent || largeImage != null) {
      map['character_large_image'] = Variable<String>(largeImage);
    }
    if (!nullToAbsent || mediumImage != null) {
      map['character_medium_image'] = Variable<String>(mediumImage);
    }
    if (!nullToAbsent || firstName != null) {
      map['character_first_name'] = Variable<String>(firstName);
    }
    if (!nullToAbsent || middleName != null) {
      map['character_middle_name'] = Variable<String>(middleName);
    }
    if (!nullToAbsent || lastName != null) {
      map['character_last_name'] = Variable<String>(lastName);
    }
    if (!nullToAbsent || fullName != null) {
      map['character_full_name'] = Variable<String>(fullName);
    }
    if (!nullToAbsent || nativeName != null) {
      map['character_native_name'] = Variable<String>(nativeName);
    }
    if (!nullToAbsent || description != null) {
      map['character_description'] = Variable<String>(description);
    }
    if (!nullToAbsent || gender != null) {
      map['character_gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || age != null) {
      map['character_age'] = Variable<String>(age);
    }
    if (!nullToAbsent || bloodType != null) {
      map['character_blood_type'] = Variable<String>(bloodType);
    }
    if (!nullToAbsent || siteUrl != null) {
      map['character_site_url'] = Variable<String>(siteUrl);
    }
    if (!nullToAbsent || dateOfBirth != null) {
      map['character_dateOfBirth'] = Variable<DateTime>(dateOfBirth);
    }
    if (!nullToAbsent || favourites != null) {
      map['character_favourites'] = Variable<int>(favourites);
    }
    if (!nullToAbsent || isFavourite != null) {
      map['character_is_favourite'] = Variable<bool>(isFavourite);
    }
    return map;
  }

  CharacterTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterTableCompanion(
      id: Value(id),
      largeImage: largeImage == null && nullToAbsent
          ? const Value.absent()
          : Value(largeImage),
      mediumImage: mediumImage == null && nullToAbsent
          ? const Value.absent()
          : Value(mediumImage),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      middleName: middleName == null && nullToAbsent
          ? const Value.absent()
          : Value(middleName),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      fullName: fullName == null && nullToAbsent
          ? const Value.absent()
          : Value(fullName),
      nativeName: nativeName == null && nullToAbsent
          ? const Value.absent()
          : Value(nativeName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      bloodType: bloodType == null && nullToAbsent
          ? const Value.absent()
          : Value(bloodType),
      siteUrl: siteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(siteUrl),
      dateOfBirth: dateOfBirth == null && nullToAbsent
          ? const Value.absent()
          : Value(dateOfBirth),
      favourites: favourites == null && nullToAbsent
          ? const Value.absent()
          : Value(favourites),
      isFavourite: isFavourite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavourite),
    );
  }

  factory CharacterEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterEntity(
      id: serializer.fromJson<String>(json['id']),
      largeImage: serializer.fromJson<String?>(json['largeImage']),
      mediumImage: serializer.fromJson<String?>(json['mediumImage']),
      firstName: serializer.fromJson<String?>(json['firstName']),
      middleName: serializer.fromJson<String?>(json['middleName']),
      lastName: serializer.fromJson<String?>(json['lastName']),
      fullName: serializer.fromJson<String?>(json['fullName']),
      nativeName: serializer.fromJson<String?>(json['nativeName']),
      description: serializer.fromJson<String?>(json['description']),
      gender: serializer.fromJson<String?>(json['gender']),
      age: serializer.fromJson<String?>(json['age']),
      bloodType: serializer.fromJson<String?>(json['bloodType']),
      siteUrl: serializer.fromJson<String?>(json['siteUrl']),
      dateOfBirth: serializer.fromJson<DateTime?>(json['dateOfBirth']),
      favourites: serializer.fromJson<int?>(json['favourites']),
      isFavourite: serializer.fromJson<bool?>(json['isFavourite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'largeImage': serializer.toJson<String?>(largeImage),
      'mediumImage': serializer.toJson<String?>(mediumImage),
      'firstName': serializer.toJson<String?>(firstName),
      'middleName': serializer.toJson<String?>(middleName),
      'lastName': serializer.toJson<String?>(lastName),
      'fullName': serializer.toJson<String?>(fullName),
      'nativeName': serializer.toJson<String?>(nativeName),
      'description': serializer.toJson<String?>(description),
      'gender': serializer.toJson<String?>(gender),
      'age': serializer.toJson<String?>(age),
      'bloodType': serializer.toJson<String?>(bloodType),
      'siteUrl': serializer.toJson<String?>(siteUrl),
      'dateOfBirth': serializer.toJson<DateTime?>(dateOfBirth),
      'favourites': serializer.toJson<int?>(favourites),
      'isFavourite': serializer.toJson<bool?>(isFavourite),
    };
  }

  CharacterEntity copyWith(
          {String? id,
          Value<String?> largeImage = const Value.absent(),
          Value<String?> mediumImage = const Value.absent(),
          Value<String?> firstName = const Value.absent(),
          Value<String?> middleName = const Value.absent(),
          Value<String?> lastName = const Value.absent(),
          Value<String?> fullName = const Value.absent(),
          Value<String?> nativeName = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<String?> gender = const Value.absent(),
          Value<String?> age = const Value.absent(),
          Value<String?> bloodType = const Value.absent(),
          Value<String?> siteUrl = const Value.absent(),
          Value<DateTime?> dateOfBirth = const Value.absent(),
          Value<int?> favourites = const Value.absent(),
          Value<bool?> isFavourite = const Value.absent()}) =>
      CharacterEntity(
        id: id ?? this.id,
        largeImage: largeImage.present ? largeImage.value : this.largeImage,
        mediumImage: mediumImage.present ? mediumImage.value : this.mediumImage,
        firstName: firstName.present ? firstName.value : this.firstName,
        middleName: middleName.present ? middleName.value : this.middleName,
        lastName: lastName.present ? lastName.value : this.lastName,
        fullName: fullName.present ? fullName.value : this.fullName,
        nativeName: nativeName.present ? nativeName.value : this.nativeName,
        description: description.present ? description.value : this.description,
        gender: gender.present ? gender.value : this.gender,
        age: age.present ? age.value : this.age,
        bloodType: bloodType.present ? bloodType.value : this.bloodType,
        siteUrl: siteUrl.present ? siteUrl.value : this.siteUrl,
        dateOfBirth: dateOfBirth.present ? dateOfBirth.value : this.dateOfBirth,
        favourites: favourites.present ? favourites.value : this.favourites,
        isFavourite: isFavourite.present ? isFavourite.value : this.isFavourite,
      );
  CharacterEntity copyWithCompanion(CharacterTableCompanion data) {
    return CharacterEntity(
      id: data.id.present ? data.id.value : this.id,
      largeImage:
          data.largeImage.present ? data.largeImage.value : this.largeImage,
      mediumImage:
          data.mediumImage.present ? data.mediumImage.value : this.mediumImage,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      middleName:
          data.middleName.present ? data.middleName.value : this.middleName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      nativeName:
          data.nativeName.present ? data.nativeName.value : this.nativeName,
      description:
          data.description.present ? data.description.value : this.description,
      gender: data.gender.present ? data.gender.value : this.gender,
      age: data.age.present ? data.age.value : this.age,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
      siteUrl: data.siteUrl.present ? data.siteUrl.value : this.siteUrl,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      favourites:
          data.favourites.present ? data.favourites.value : this.favourites,
      isFavourite:
          data.isFavourite.present ? data.isFavourite.value : this.isFavourite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterEntity(')
          ..write('id: $id, ')
          ..write('largeImage: $largeImage, ')
          ..write('mediumImage: $mediumImage, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('nativeName: $nativeName, ')
          ..write('description: $description, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('bloodType: $bloodType, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('favourites: $favourites, ')
          ..write('isFavourite: $isFavourite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      largeImage,
      mediumImage,
      firstName,
      middleName,
      lastName,
      fullName,
      nativeName,
      description,
      gender,
      age,
      bloodType,
      siteUrl,
      dateOfBirth,
      favourites,
      isFavourite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterEntity &&
          other.id == this.id &&
          other.largeImage == this.largeImage &&
          other.mediumImage == this.mediumImage &&
          other.firstName == this.firstName &&
          other.middleName == this.middleName &&
          other.lastName == this.lastName &&
          other.fullName == this.fullName &&
          other.nativeName == this.nativeName &&
          other.description == this.description &&
          other.gender == this.gender &&
          other.age == this.age &&
          other.bloodType == this.bloodType &&
          other.siteUrl == this.siteUrl &&
          other.dateOfBirth == this.dateOfBirth &&
          other.favourites == this.favourites &&
          other.isFavourite == this.isFavourite);
}

class CharacterTableCompanion extends UpdateCompanion<CharacterEntity> {
  final Value<String> id;
  final Value<String?> largeImage;
  final Value<String?> mediumImage;
  final Value<String?> firstName;
  final Value<String?> middleName;
  final Value<String?> lastName;
  final Value<String?> fullName;
  final Value<String?> nativeName;
  final Value<String?> description;
  final Value<String?> gender;
  final Value<String?> age;
  final Value<String?> bloodType;
  final Value<String?> siteUrl;
  final Value<DateTime?> dateOfBirth;
  final Value<int?> favourites;
  final Value<bool?> isFavourite;
  final Value<int> rowid;
  const CharacterTableCompanion({
    this.id = const Value.absent(),
    this.largeImage = const Value.absent(),
    this.mediumImage = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nativeName = const Value.absent(),
    this.description = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.favourites = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterTableCompanion.insert({
    required String id,
    this.largeImage = const Value.absent(),
    this.mediumImage = const Value.absent(),
    this.firstName = const Value.absent(),
    this.middleName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.fullName = const Value.absent(),
    this.nativeName = const Value.absent(),
    this.description = const Value.absent(),
    this.gender = const Value.absent(),
    this.age = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.favourites = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<CharacterEntity> custom({
    Expression<String>? id,
    Expression<String>? largeImage,
    Expression<String>? mediumImage,
    Expression<String>? firstName,
    Expression<String>? middleName,
    Expression<String>? lastName,
    Expression<String>? fullName,
    Expression<String>? nativeName,
    Expression<String>? description,
    Expression<String>? gender,
    Expression<String>? age,
    Expression<String>? bloodType,
    Expression<String>? siteUrl,
    Expression<DateTime>? dateOfBirth,
    Expression<int>? favourites,
    Expression<bool>? isFavourite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'character_id': id,
      if (largeImage != null) 'character_large_image': largeImage,
      if (mediumImage != null) 'character_medium_image': mediumImage,
      if (firstName != null) 'character_first_name': firstName,
      if (middleName != null) 'character_middle_name': middleName,
      if (lastName != null) 'character_last_name': lastName,
      if (fullName != null) 'character_full_name': fullName,
      if (nativeName != null) 'character_native_name': nativeName,
      if (description != null) 'character_description': description,
      if (gender != null) 'character_gender': gender,
      if (age != null) 'character_age': age,
      if (bloodType != null) 'character_blood_type': bloodType,
      if (siteUrl != null) 'character_site_url': siteUrl,
      if (dateOfBirth != null) 'character_dateOfBirth': dateOfBirth,
      if (favourites != null) 'character_favourites': favourites,
      if (isFavourite != null) 'character_is_favourite': isFavourite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? largeImage,
      Value<String?>? mediumImage,
      Value<String?>? firstName,
      Value<String?>? middleName,
      Value<String?>? lastName,
      Value<String?>? fullName,
      Value<String?>? nativeName,
      Value<String?>? description,
      Value<String?>? gender,
      Value<String?>? age,
      Value<String?>? bloodType,
      Value<String?>? siteUrl,
      Value<DateTime?>? dateOfBirth,
      Value<int?>? favourites,
      Value<bool?>? isFavourite,
      Value<int>? rowid}) {
    return CharacterTableCompanion(
      id: id ?? this.id,
      largeImage: largeImage ?? this.largeImage,
      mediumImage: mediumImage ?? this.mediumImage,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      nativeName: nativeName ?? this.nativeName,
      description: description ?? this.description,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      bloodType: bloodType ?? this.bloodType,
      siteUrl: siteUrl ?? this.siteUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      favourites: favourites ?? this.favourites,
      isFavourite: isFavourite ?? this.isFavourite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['character_id'] = Variable<String>(id.value);
    }
    if (largeImage.present) {
      map['character_large_image'] = Variable<String>(largeImage.value);
    }
    if (mediumImage.present) {
      map['character_medium_image'] = Variable<String>(mediumImage.value);
    }
    if (firstName.present) {
      map['character_first_name'] = Variable<String>(firstName.value);
    }
    if (middleName.present) {
      map['character_middle_name'] = Variable<String>(middleName.value);
    }
    if (lastName.present) {
      map['character_last_name'] = Variable<String>(lastName.value);
    }
    if (fullName.present) {
      map['character_full_name'] = Variable<String>(fullName.value);
    }
    if (nativeName.present) {
      map['character_native_name'] = Variable<String>(nativeName.value);
    }
    if (description.present) {
      map['character_description'] = Variable<String>(description.value);
    }
    if (gender.present) {
      map['character_gender'] = Variable<String>(gender.value);
    }
    if (age.present) {
      map['character_age'] = Variable<String>(age.value);
    }
    if (bloodType.present) {
      map['character_blood_type'] = Variable<String>(bloodType.value);
    }
    if (siteUrl.present) {
      map['character_site_url'] = Variable<String>(siteUrl.value);
    }
    if (dateOfBirth.present) {
      map['character_dateOfBirth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (favourites.present) {
      map['character_favourites'] = Variable<int>(favourites.value);
    }
    if (isFavourite.present) {
      map['character_is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterTableCompanion(')
          ..write('id: $id, ')
          ..write('largeImage: $largeImage, ')
          ..write('mediumImage: $mediumImage, ')
          ..write('firstName: $firstName, ')
          ..write('middleName: $middleName, ')
          ..write('lastName: $lastName, ')
          ..write('fullName: $fullName, ')
          ..write('nativeName: $nativeName, ')
          ..write('description: $description, ')
          ..write('gender: $gender, ')
          ..write('age: $age, ')
          ..write('bloodType: $bloodType, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('favourites: $favourites, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaListTableTable extends MediaListTable
    with TableInfo<$MediaListTableTable, MediaListEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaListTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'media_list_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'media_list_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'media_list_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'media_list_status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'media_list_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _progressMeta =
      const VerificationMeta('progress');
  @override
  late final GeneratedColumn<int> progress = GeneratedColumn<int>(
      'media_list_progress', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _progressVolumesMeta =
      const VerificationMeta('progressVolumes');
  @override
  late final GeneratedColumn<int> progressVolumes = GeneratedColumn<int>(
      'media_list_progress_volumes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _startedAtMeta =
      const VerificationMeta('startedAt');
  @override
  late final GeneratedColumn<int> startedAt = GeneratedColumn<int>(
      'media_list_started_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _completedAtMeta =
      const VerificationMeta('completedAt');
  @override
  late final GeneratedColumn<int> completedAt = GeneratedColumn<int>(
      'media_list_completed_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'media_list_updatedAt', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _repeatMeta = const VerificationMeta('repeat');
  @override
  late final GeneratedColumn<int> repeat = GeneratedColumn<int>(
      'media_list_repeat', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'media_list_score', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _privateMeta =
      const VerificationMeta('private');
  @override
  late final GeneratedColumn<bool> private = GeneratedColumn<bool>(
      'media_list_private', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("media_list_private" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        userId,
        mediaId,
        status,
        notes,
        progress,
        progressVolumes,
        startedAt,
        completedAt,
        updatedAt,
        repeat,
        score,
        private
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_list_table';
  @override
  VerificationContext validateIntegrity(Insertable<MediaListEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_list_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['media_list_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_list_user_id')) {
      context.handle(
          _userIdMeta,
          userId.isAcceptableOrUnknown(
              data['media_list_user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('media_list_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['media_list_media_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('media_list_status')) {
      context.handle(
          _statusMeta,
          status.isAcceptableOrUnknown(
              data['media_list_status']!, _statusMeta));
    }
    if (data.containsKey('media_list_notes')) {
      context.handle(_notesMeta,
          notes.isAcceptableOrUnknown(data['media_list_notes']!, _notesMeta));
    }
    if (data.containsKey('media_list_progress')) {
      context.handle(
          _progressMeta,
          progress.isAcceptableOrUnknown(
              data['media_list_progress']!, _progressMeta));
    }
    if (data.containsKey('media_list_progress_volumes')) {
      context.handle(
          _progressVolumesMeta,
          progressVolumes.isAcceptableOrUnknown(
              data['media_list_progress_volumes']!, _progressVolumesMeta));
    }
    if (data.containsKey('media_list_started_at')) {
      context.handle(
          _startedAtMeta,
          startedAt.isAcceptableOrUnknown(
              data['media_list_started_at']!, _startedAtMeta));
    }
    if (data.containsKey('media_list_completed_at')) {
      context.handle(
          _completedAtMeta,
          completedAt.isAcceptableOrUnknown(
              data['media_list_completed_at']!, _completedAtMeta));
    }
    if (data.containsKey('media_list_updatedAt')) {
      context.handle(
          _updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(
              data['media_list_updatedAt']!, _updatedAtMeta));
    }
    if (data.containsKey('media_list_repeat')) {
      context.handle(
          _repeatMeta,
          repeat.isAcceptableOrUnknown(
              data['media_list_repeat']!, _repeatMeta));
    }
    if (data.containsKey('media_list_score')) {
      context.handle(_scoreMeta,
          score.isAcceptableOrUnknown(data['media_list_score']!, _scoreMeta));
    }
    if (data.containsKey('media_list_private')) {
      context.handle(
          _privateMeta,
          private.isAcceptableOrUnknown(
              data['media_list_private']!, _privateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaListEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaListEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_list_id'])!,
      userId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}media_list_user_id'])!,
      mediaId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}media_list_media_id'])!,
      status: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}media_list_status']),
      notes: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}media_list_notes']),
      progress: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}media_list_progress']),
      progressVolumes: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}media_list_progress_volumes']),
      startedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}media_list_started_at']),
      completedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}media_list_completed_at']),
      updatedAt: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}media_list_updatedAt']),
      repeat: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}media_list_repeat']),
      score: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}media_list_score']),
      private: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}media_list_private']),
    );
  }

  @override
  $MediaListTableTable createAlias(String alias) {
    return $MediaListTableTable(attachedDatabase, alias);
  }
}

class MediaListEntity extends DataClass implements Insertable<MediaListEntity> {
  final String id;
  final String userId;
  final String mediaId;
  final String? status;
  final String? notes;
  final int? progress;
  final int? progressVolumes;
  final int? startedAt;
  final int? completedAt;
  final int? updatedAt;
  final int? repeat;
  final double? score;
  final bool? private;
  const MediaListEntity(
      {required this.id,
      required this.userId,
      required this.mediaId,
      this.status,
      this.notes,
      this.progress,
      this.progressVolumes,
      this.startedAt,
      this.completedAt,
      this.updatedAt,
      this.repeat,
      this.score,
      this.private});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_list_id'] = Variable<String>(id);
    map['media_list_user_id'] = Variable<String>(userId);
    map['media_list_media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || status != null) {
      map['media_list_status'] = Variable<String>(status);
    }
    if (!nullToAbsent || notes != null) {
      map['media_list_notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || progress != null) {
      map['media_list_progress'] = Variable<int>(progress);
    }
    if (!nullToAbsent || progressVolumes != null) {
      map['media_list_progress_volumes'] = Variable<int>(progressVolumes);
    }
    if (!nullToAbsent || startedAt != null) {
      map['media_list_started_at'] = Variable<int>(startedAt);
    }
    if (!nullToAbsent || completedAt != null) {
      map['media_list_completed_at'] = Variable<int>(completedAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['media_list_updatedAt'] = Variable<int>(updatedAt);
    }
    if (!nullToAbsent || repeat != null) {
      map['media_list_repeat'] = Variable<int>(repeat);
    }
    if (!nullToAbsent || score != null) {
      map['media_list_score'] = Variable<double>(score);
    }
    if (!nullToAbsent || private != null) {
      map['media_list_private'] = Variable<bool>(private);
    }
    return map;
  }

  MediaListTableCompanion toCompanion(bool nullToAbsent) {
    return MediaListTableCompanion(
      id: Value(id),
      userId: Value(userId),
      mediaId: Value(mediaId),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      progress: progress == null && nullToAbsent
          ? const Value.absent()
          : Value(progress),
      progressVolumes: progressVolumes == null && nullToAbsent
          ? const Value.absent()
          : Value(progressVolumes),
      startedAt: startedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(startedAt),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      repeat:
          repeat == null && nullToAbsent ? const Value.absent() : Value(repeat),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      private: private == null && nullToAbsent
          ? const Value.absent()
          : Value(private),
    );
  }

  factory MediaListEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaListEntity(
      id: serializer.fromJson<String>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      status: serializer.fromJson<String?>(json['status']),
      notes: serializer.fromJson<String?>(json['notes']),
      progress: serializer.fromJson<int?>(json['progress']),
      progressVolumes: serializer.fromJson<int?>(json['progressVolumes']),
      startedAt: serializer.fromJson<int?>(json['startedAt']),
      completedAt: serializer.fromJson<int?>(json['completedAt']),
      updatedAt: serializer.fromJson<int?>(json['updatedAt']),
      repeat: serializer.fromJson<int?>(json['repeat']),
      score: serializer.fromJson<double?>(json['score']),
      private: serializer.fromJson<bool?>(json['private']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'userId': serializer.toJson<String>(userId),
      'mediaId': serializer.toJson<String>(mediaId),
      'status': serializer.toJson<String?>(status),
      'notes': serializer.toJson<String?>(notes),
      'progress': serializer.toJson<int?>(progress),
      'progressVolumes': serializer.toJson<int?>(progressVolumes),
      'startedAt': serializer.toJson<int?>(startedAt),
      'completedAt': serializer.toJson<int?>(completedAt),
      'updatedAt': serializer.toJson<int?>(updatedAt),
      'repeat': serializer.toJson<int?>(repeat),
      'score': serializer.toJson<double?>(score),
      'private': serializer.toJson<bool?>(private),
    };
  }

  MediaListEntity copyWith(
          {String? id,
          String? userId,
          String? mediaId,
          Value<String?> status = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<int?> progress = const Value.absent(),
          Value<int?> progressVolumes = const Value.absent(),
          Value<int?> startedAt = const Value.absent(),
          Value<int?> completedAt = const Value.absent(),
          Value<int?> updatedAt = const Value.absent(),
          Value<int?> repeat = const Value.absent(),
          Value<double?> score = const Value.absent(),
          Value<bool?> private = const Value.absent()}) =>
      MediaListEntity(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        mediaId: mediaId ?? this.mediaId,
        status: status.present ? status.value : this.status,
        notes: notes.present ? notes.value : this.notes,
        progress: progress.present ? progress.value : this.progress,
        progressVolumes: progressVolumes.present
            ? progressVolumes.value
            : this.progressVolumes,
        startedAt: startedAt.present ? startedAt.value : this.startedAt,
        completedAt: completedAt.present ? completedAt.value : this.completedAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        repeat: repeat.present ? repeat.value : this.repeat,
        score: score.present ? score.value : this.score,
        private: private.present ? private.value : this.private,
      );
  MediaListEntity copyWithCompanion(MediaListTableCompanion data) {
    return MediaListEntity(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      progress: data.progress.present ? data.progress.value : this.progress,
      progressVolumes: data.progressVolumes.present
          ? data.progressVolumes.value
          : this.progressVolumes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completedAt:
          data.completedAt.present ? data.completedAt.value : this.completedAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      repeat: data.repeat.present ? data.repeat.value : this.repeat,
      score: data.score.present ? data.score.value : this.score,
      private: data.private.present ? data.private.value : this.private,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaListEntity(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('mediaId: $mediaId, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('progress: $progress, ')
          ..write('progressVolumes: $progressVolumes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('repeat: $repeat, ')
          ..write('score: $score, ')
          ..write('private: $private')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      userId,
      mediaId,
      status,
      notes,
      progress,
      progressVolumes,
      startedAt,
      completedAt,
      updatedAt,
      repeat,
      score,
      private);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaListEntity &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.mediaId == this.mediaId &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.progress == this.progress &&
          other.progressVolumes == this.progressVolumes &&
          other.startedAt == this.startedAt &&
          other.completedAt == this.completedAt &&
          other.updatedAt == this.updatedAt &&
          other.repeat == this.repeat &&
          other.score == this.score &&
          other.private == this.private);
}

class MediaListTableCompanion extends UpdateCompanion<MediaListEntity> {
  final Value<String> id;
  final Value<String> userId;
  final Value<String> mediaId;
  final Value<String?> status;
  final Value<String?> notes;
  final Value<int?> progress;
  final Value<int?> progressVolumes;
  final Value<int?> startedAt;
  final Value<int?> completedAt;
  final Value<int?> updatedAt;
  final Value<int?> repeat;
  final Value<double?> score;
  final Value<bool?> private;
  final Value<int> rowid;
  const MediaListTableCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.progress = const Value.absent(),
    this.progressVolumes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.repeat = const Value.absent(),
    this.score = const Value.absent(),
    this.private = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaListTableCompanion.insert({
    required String id,
    required String userId,
    required String mediaId,
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.progress = const Value.absent(),
    this.progressVolumes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.repeat = const Value.absent(),
    this.score = const Value.absent(),
    this.private = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        userId = Value(userId),
        mediaId = Value(mediaId);
  static Insertable<MediaListEntity> custom({
    Expression<String>? id,
    Expression<String>? userId,
    Expression<String>? mediaId,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<int>? progress,
    Expression<int>? progressVolumes,
    Expression<int>? startedAt,
    Expression<int>? completedAt,
    Expression<int>? updatedAt,
    Expression<int>? repeat,
    Expression<double>? score,
    Expression<bool>? private,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'media_list_id': id,
      if (userId != null) 'media_list_user_id': userId,
      if (mediaId != null) 'media_list_media_id': mediaId,
      if (status != null) 'media_list_status': status,
      if (notes != null) 'media_list_notes': notes,
      if (progress != null) 'media_list_progress': progress,
      if (progressVolumes != null)
        'media_list_progress_volumes': progressVolumes,
      if (startedAt != null) 'media_list_started_at': startedAt,
      if (completedAt != null) 'media_list_completed_at': completedAt,
      if (updatedAt != null) 'media_list_updatedAt': updatedAt,
      if (repeat != null) 'media_list_repeat': repeat,
      if (score != null) 'media_list_score': score,
      if (private != null) 'media_list_private': private,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaListTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? userId,
      Value<String>? mediaId,
      Value<String?>? status,
      Value<String?>? notes,
      Value<int?>? progress,
      Value<int?>? progressVolumes,
      Value<int?>? startedAt,
      Value<int?>? completedAt,
      Value<int?>? updatedAt,
      Value<int?>? repeat,
      Value<double?>? score,
      Value<bool?>? private,
      Value<int>? rowid}) {
    return MediaListTableCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      mediaId: mediaId ?? this.mediaId,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      progress: progress ?? this.progress,
      progressVolumes: progressVolumes ?? this.progressVolumes,
      startedAt: startedAt ?? this.startedAt,
      completedAt: completedAt ?? this.completedAt,
      updatedAt: updatedAt ?? this.updatedAt,
      repeat: repeat ?? this.repeat,
      score: score ?? this.score,
      private: private ?? this.private,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['media_list_id'] = Variable<String>(id.value);
    }
    if (userId.present) {
      map['media_list_user_id'] = Variable<String>(userId.value);
    }
    if (mediaId.present) {
      map['media_list_media_id'] = Variable<String>(mediaId.value);
    }
    if (status.present) {
      map['media_list_status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['media_list_notes'] = Variable<String>(notes.value);
    }
    if (progress.present) {
      map['media_list_progress'] = Variable<int>(progress.value);
    }
    if (progressVolumes.present) {
      map['media_list_progress_volumes'] = Variable<int>(progressVolumes.value);
    }
    if (startedAt.present) {
      map['media_list_started_at'] = Variable<int>(startedAt.value);
    }
    if (completedAt.present) {
      map['media_list_completed_at'] = Variable<int>(completedAt.value);
    }
    if (updatedAt.present) {
      map['media_list_updatedAt'] = Variable<int>(updatedAt.value);
    }
    if (repeat.present) {
      map['media_list_repeat'] = Variable<int>(repeat.value);
    }
    if (score.present) {
      map['media_list_score'] = Variable<double>(score.value);
    }
    if (private.present) {
      map['media_list_private'] = Variable<bool>(private.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaListTableCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('mediaId: $mediaId, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('progress: $progress, ')
          ..write('progressVolumes: $progressVolumes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completedAt: $completedAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('repeat: $repeat, ')
          ..write('score: $score, ')
          ..write('private: $private, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaTableTable extends MediaTable
    with TableInfo<$MediaTableTable, MediaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'media_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _englishTitleMeta =
      const VerificationMeta('englishTitle');
  @override
  late final GeneratedColumn<String> englishTitle = GeneratedColumn<String>(
      'english_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _romajiTitleMeta =
      const VerificationMeta('romajiTitle');
  @override
  late final GeneratedColumn<String> romajiTitle = GeneratedColumn<String>(
      'romaji_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _nativeTitleMeta =
      const VerificationMeta('nativeTitle');
  @override
  late final GeneratedColumn<String> nativeTitle = GeneratedColumn<String>(
      'native_title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverImageExtraLargeMeta =
      const VerificationMeta('coverImageExtraLarge');
  @override
  late final GeneratedColumn<String> coverImageExtraLarge =
      GeneratedColumn<String>('cover_image_extra_large', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverImageLargeMeta =
      const VerificationMeta('coverImageLarge');
  @override
  late final GeneratedColumn<String> coverImageLarge = GeneratedColumn<String>(
      'cover_image_large', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverImageMediumMeta =
      const VerificationMeta('coverImageMedium');
  @override
  late final GeneratedColumn<String> coverImageMedium = GeneratedColumn<String>(
      'cover_image_medium', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _coverImageColorMeta =
      const VerificationMeta('coverImageColor');
  @override
  late final GeneratedColumn<String> coverImageColor = GeneratedColumn<String>(
      'cover_image_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _episodesMeta =
      const VerificationMeta('episodes');
  @override
  late final GeneratedColumn<int> episodes = GeneratedColumn<int>(
      'episodes', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _seasonYearMeta =
      const VerificationMeta('seasonYear');
  @override
  late final GeneratedColumn<int> seasonYear = GeneratedColumn<int>(
      'season_year', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<String> season = GeneratedColumn<String>(
      'season', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _hashtagMeta =
      const VerificationMeta('hashtag');
  @override
  late final GeneratedColumn<String> hashtag = GeneratedColumn<String>(
      'hashtag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _bannerImageMeta =
      const VerificationMeta('bannerImage');
  @override
  late final GeneratedColumn<String> bannerImage = GeneratedColumn<String>(
      'banner_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _averageScoreMeta =
      const VerificationMeta('averageScore');
  @override
  late final GeneratedColumn<int> averageScore = GeneratedColumn<int>(
      'average_score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _trailerIdMeta =
      const VerificationMeta('trailerId');
  @override
  late final GeneratedColumn<String> trailerId = GeneratedColumn<String>(
      'trailer_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trailerSiteMeta =
      const VerificationMeta('trailerSite');
  @override
  late final GeneratedColumn<String> trailerSite = GeneratedColumn<String>(
      'trailer_site', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trailerThumbnailMeta =
      const VerificationMeta('trailerThumbnail');
  @override
  late final GeneratedColumn<String> trailerThumbnail = GeneratedColumn<String>(
      'trailer_thumbnail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _genresMeta = const VerificationMeta('genres');
  @override
  late final GeneratedColumn<String> genres = GeneratedColumn<String>(
      'genres', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumn<String> format = GeneratedColumn<String>(
      'format', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _trendingMeta =
      const VerificationMeta('trending');
  @override
  late final GeneratedColumn<int> trending = GeneratedColumn<int>(
      'trending', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _favouritesMeta =
      const VerificationMeta('favourites');
  @override
  late final GeneratedColumn<int> favourites = GeneratedColumn<int>(
      'favourites', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _popularRankingMeta =
      const VerificationMeta('popularRanking');
  @override
  late final GeneratedColumn<int> popularRanking = GeneratedColumn<int>(
      'popular_ranking', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ratedRankingMeta =
      const VerificationMeta('ratedRanking');
  @override
  late final GeneratedColumn<int> ratedRanking = GeneratedColumn<int>(
      'rated_ranking', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nextAiringEpisodeMeta =
      const VerificationMeta('nextAiringEpisode');
  @override
  late final GeneratedColumn<int> nextAiringEpisode = GeneratedColumn<int>(
      'next_airing_episode', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _timeUntilAiringMeta =
      const VerificationMeta('timeUntilAiring');
  @override
  late final GeneratedColumn<int> timeUntilAiring = GeneratedColumn<int>(
      'time_until_airing', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _isFavouriteMeta =
      const VerificationMeta('isFavourite');
  @override
  late final GeneratedColumn<bool> isFavourite = GeneratedColumn<bool>(
      'is_favourite', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_favourite" IN (0, 1))'));
  static const VerificationMeta _nextAiringEpisodeUpdateTimeMeta =
      const VerificationMeta('nextAiringEpisodeUpdateTime');
  @override
  late final GeneratedColumn<DateTime> nextAiringEpisodeUpdateTime =
      GeneratedColumn<DateTime>(
          'next_airing_episode_update_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _siteUrlMeta =
      const VerificationMeta('siteUrl');
  @override
  late final GeneratedColumn<String> siteUrl = GeneratedColumn<String>(
      'user_data_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        englishTitle,
        romajiTitle,
        nativeTitle,
        coverImageExtraLarge,
        coverImageLarge,
        coverImageMedium,
        coverImageColor,
        description,
        episodes,
        seasonYear,
        season,
        source,
        status,
        hashtag,
        bannerImage,
        averageScore,
        trailerId,
        trailerSite,
        trailerThumbnail,
        genres,
        format,
        trending,
        favourites,
        popularRanking,
        ratedRanking,
        nextAiringEpisode,
        timeUntilAiring,
        startDate,
        endDate,
        isFavourite,
        nextAiringEpisodeUpdateTime,
        siteUrl
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_table';
  @override
  VerificationContext validateIntegrity(Insertable<MediaEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('media_type')) {
      context.handle(_typeMeta,
          type.isAcceptableOrUnknown(data['media_type']!, _typeMeta));
    }
    if (data.containsKey('english_title')) {
      context.handle(
          _englishTitleMeta,
          englishTitle.isAcceptableOrUnknown(
              data['english_title']!, _englishTitleMeta));
    }
    if (data.containsKey('romaji_title')) {
      context.handle(
          _romajiTitleMeta,
          romajiTitle.isAcceptableOrUnknown(
              data['romaji_title']!, _romajiTitleMeta));
    }
    if (data.containsKey('native_title')) {
      context.handle(
          _nativeTitleMeta,
          nativeTitle.isAcceptableOrUnknown(
              data['native_title']!, _nativeTitleMeta));
    }
    if (data.containsKey('cover_image_extra_large')) {
      context.handle(
          _coverImageExtraLargeMeta,
          coverImageExtraLarge.isAcceptableOrUnknown(
              data['cover_image_extra_large']!, _coverImageExtraLargeMeta));
    }
    if (data.containsKey('cover_image_large')) {
      context.handle(
          _coverImageLargeMeta,
          coverImageLarge.isAcceptableOrUnknown(
              data['cover_image_large']!, _coverImageLargeMeta));
    }
    if (data.containsKey('cover_image_medium')) {
      context.handle(
          _coverImageMediumMeta,
          coverImageMedium.isAcceptableOrUnknown(
              data['cover_image_medium']!, _coverImageMediumMeta));
    }
    if (data.containsKey('cover_image_color')) {
      context.handle(
          _coverImageColorMeta,
          coverImageColor.isAcceptableOrUnknown(
              data['cover_image_color']!, _coverImageColorMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('episodes')) {
      context.handle(_episodesMeta,
          episodes.isAcceptableOrUnknown(data['episodes']!, _episodesMeta));
    }
    if (data.containsKey('season_year')) {
      context.handle(
          _seasonYearMeta,
          seasonYear.isAcceptableOrUnknown(
              data['season_year']!, _seasonYearMeta));
    }
    if (data.containsKey('season')) {
      context.handle(_seasonMeta,
          season.isAcceptableOrUnknown(data['season']!, _seasonMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('hashtag')) {
      context.handle(_hashtagMeta,
          hashtag.isAcceptableOrUnknown(data['hashtag']!, _hashtagMeta));
    }
    if (data.containsKey('banner_image')) {
      context.handle(
          _bannerImageMeta,
          bannerImage.isAcceptableOrUnknown(
              data['banner_image']!, _bannerImageMeta));
    }
    if (data.containsKey('average_score')) {
      context.handle(
          _averageScoreMeta,
          averageScore.isAcceptableOrUnknown(
              data['average_score']!, _averageScoreMeta));
    }
    if (data.containsKey('trailer_id')) {
      context.handle(_trailerIdMeta,
          trailerId.isAcceptableOrUnknown(data['trailer_id']!, _trailerIdMeta));
    }
    if (data.containsKey('trailer_site')) {
      context.handle(
          _trailerSiteMeta,
          trailerSite.isAcceptableOrUnknown(
              data['trailer_site']!, _trailerSiteMeta));
    }
    if (data.containsKey('trailer_thumbnail')) {
      context.handle(
          _trailerThumbnailMeta,
          trailerThumbnail.isAcceptableOrUnknown(
              data['trailer_thumbnail']!, _trailerThumbnailMeta));
    }
    if (data.containsKey('genres')) {
      context.handle(_genresMeta,
          genres.isAcceptableOrUnknown(data['genres']!, _genresMeta));
    }
    if (data.containsKey('format')) {
      context.handle(_formatMeta,
          format.isAcceptableOrUnknown(data['format']!, _formatMeta));
    }
    if (data.containsKey('trending')) {
      context.handle(_trendingMeta,
          trending.isAcceptableOrUnknown(data['trending']!, _trendingMeta));
    }
    if (data.containsKey('favourites')) {
      context.handle(
          _favouritesMeta,
          favourites.isAcceptableOrUnknown(
              data['favourites']!, _favouritesMeta));
    }
    if (data.containsKey('popular_ranking')) {
      context.handle(
          _popularRankingMeta,
          popularRanking.isAcceptableOrUnknown(
              data['popular_ranking']!, _popularRankingMeta));
    }
    if (data.containsKey('rated_ranking')) {
      context.handle(
          _ratedRankingMeta,
          ratedRanking.isAcceptableOrUnknown(
              data['rated_ranking']!, _ratedRankingMeta));
    }
    if (data.containsKey('next_airing_episode')) {
      context.handle(
          _nextAiringEpisodeMeta,
          nextAiringEpisode.isAcceptableOrUnknown(
              data['next_airing_episode']!, _nextAiringEpisodeMeta));
    }
    if (data.containsKey('time_until_airing')) {
      context.handle(
          _timeUntilAiringMeta,
          timeUntilAiring.isAcceptableOrUnknown(
              data['time_until_airing']!, _timeUntilAiringMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('is_favourite')) {
      context.handle(
          _isFavouriteMeta,
          isFavourite.isAcceptableOrUnknown(
              data['is_favourite']!, _isFavouriteMeta));
    }
    if (data.containsKey('next_airing_episode_update_time')) {
      context.handle(
          _nextAiringEpisodeUpdateTimeMeta,
          nextAiringEpisodeUpdateTime.isAcceptableOrUnknown(
              data['next_airing_episode_update_time']!,
              _nextAiringEpisodeUpdateTimeMeta));
    }
    if (data.containsKey('user_data_site_url')) {
      context.handle(
          _siteUrlMeta,
          siteUrl.isAcceptableOrUnknown(
              data['user_data_site_url']!, _siteUrlMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}media_type']),
      englishTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}english_title']),
      romajiTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}romaji_title']),
      nativeTitle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}native_title']),
      coverImageExtraLarge: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}cover_image_extra_large']),
      coverImageLarge: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cover_image_large']),
      coverImageMedium: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cover_image_medium']),
      coverImageColor: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}cover_image_color']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      episodes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}episodes']),
      seasonYear: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}season_year']),
      season: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}season']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status']),
      hashtag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hashtag']),
      bannerImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}banner_image']),
      averageScore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}average_score']),
      trailerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trailer_id']),
      trailerSite: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trailer_site']),
      trailerThumbnail: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}trailer_thumbnail']),
      genres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}genres']),
      format: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}format']),
      trending: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trending']),
      favourites: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}favourites']),
      popularRanking: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}popular_ranking']),
      ratedRanking: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rated_ranking']),
      nextAiringEpisode: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}next_airing_episode']),
      timeUntilAiring: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time_until_airing']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      isFavourite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favourite']),
      nextAiringEpisodeUpdateTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}next_airing_episode_update_time']),
      siteUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}user_data_site_url']),
    );
  }

  @override
  $MediaTableTable createAlias(String alias) {
    return $MediaTableTable(attachedDatabase, alias);
  }
}

class MediaEntity extends DataClass implements Insertable<MediaEntity> {
  final String id;
  final String? type;
  final String? englishTitle;
  final String? romajiTitle;
  final String? nativeTitle;
  final String? coverImageExtraLarge;
  final String? coverImageLarge;
  final String? coverImageMedium;
  final String? coverImageColor;
  final String? description;
  final int? episodes;
  final int? seasonYear;
  final String? season;
  final String? source;
  final String? status;
  final String? hashtag;
  final String? bannerImage;
  final int? averageScore;
  final String? trailerId;
  final String? trailerSite;
  final String? trailerThumbnail;
  final String? genres;
  final String? format;
  final int? trending;
  final int? favourites;
  final int? popularRanking;
  final int? ratedRanking;
  final int? nextAiringEpisode;
  final int? timeUntilAiring;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool? isFavourite;
  final DateTime? nextAiringEpisodeUpdateTime;
  final String? siteUrl;
  const MediaEntity(
      {required this.id,
      this.type,
      this.englishTitle,
      this.romajiTitle,
      this.nativeTitle,
      this.coverImageExtraLarge,
      this.coverImageLarge,
      this.coverImageMedium,
      this.coverImageColor,
      this.description,
      this.episodes,
      this.seasonYear,
      this.season,
      this.source,
      this.status,
      this.hashtag,
      this.bannerImage,
      this.averageScore,
      this.trailerId,
      this.trailerSite,
      this.trailerThumbnail,
      this.genres,
      this.format,
      this.trending,
      this.favourites,
      this.popularRanking,
      this.ratedRanking,
      this.nextAiringEpisode,
      this.timeUntilAiring,
      this.startDate,
      this.endDate,
      this.isFavourite,
      this.nextAiringEpisodeUpdateTime,
      this.siteUrl});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || type != null) {
      map['media_type'] = Variable<String>(type);
    }
    if (!nullToAbsent || englishTitle != null) {
      map['english_title'] = Variable<String>(englishTitle);
    }
    if (!nullToAbsent || romajiTitle != null) {
      map['romaji_title'] = Variable<String>(romajiTitle);
    }
    if (!nullToAbsent || nativeTitle != null) {
      map['native_title'] = Variable<String>(nativeTitle);
    }
    if (!nullToAbsent || coverImageExtraLarge != null) {
      map['cover_image_extra_large'] = Variable<String>(coverImageExtraLarge);
    }
    if (!nullToAbsent || coverImageLarge != null) {
      map['cover_image_large'] = Variable<String>(coverImageLarge);
    }
    if (!nullToAbsent || coverImageMedium != null) {
      map['cover_image_medium'] = Variable<String>(coverImageMedium);
    }
    if (!nullToAbsent || coverImageColor != null) {
      map['cover_image_color'] = Variable<String>(coverImageColor);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || episodes != null) {
      map['episodes'] = Variable<int>(episodes);
    }
    if (!nullToAbsent || seasonYear != null) {
      map['season_year'] = Variable<int>(seasonYear);
    }
    if (!nullToAbsent || season != null) {
      map['season'] = Variable<String>(season);
    }
    if (!nullToAbsent || source != null) {
      map['source'] = Variable<String>(source);
    }
    if (!nullToAbsent || status != null) {
      map['status'] = Variable<String>(status);
    }
    if (!nullToAbsent || hashtag != null) {
      map['hashtag'] = Variable<String>(hashtag);
    }
    if (!nullToAbsent || bannerImage != null) {
      map['banner_image'] = Variable<String>(bannerImage);
    }
    if (!nullToAbsent || averageScore != null) {
      map['average_score'] = Variable<int>(averageScore);
    }
    if (!nullToAbsent || trailerId != null) {
      map['trailer_id'] = Variable<String>(trailerId);
    }
    if (!nullToAbsent || trailerSite != null) {
      map['trailer_site'] = Variable<String>(trailerSite);
    }
    if (!nullToAbsent || trailerThumbnail != null) {
      map['trailer_thumbnail'] = Variable<String>(trailerThumbnail);
    }
    if (!nullToAbsent || genres != null) {
      map['genres'] = Variable<String>(genres);
    }
    if (!nullToAbsent || format != null) {
      map['format'] = Variable<String>(format);
    }
    if (!nullToAbsent || trending != null) {
      map['trending'] = Variable<int>(trending);
    }
    if (!nullToAbsent || favourites != null) {
      map['favourites'] = Variable<int>(favourites);
    }
    if (!nullToAbsent || popularRanking != null) {
      map['popular_ranking'] = Variable<int>(popularRanking);
    }
    if (!nullToAbsent || ratedRanking != null) {
      map['rated_ranking'] = Variable<int>(ratedRanking);
    }
    if (!nullToAbsent || nextAiringEpisode != null) {
      map['next_airing_episode'] = Variable<int>(nextAiringEpisode);
    }
    if (!nullToAbsent || timeUntilAiring != null) {
      map['time_until_airing'] = Variable<int>(timeUntilAiring);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    if (!nullToAbsent || isFavourite != null) {
      map['is_favourite'] = Variable<bool>(isFavourite);
    }
    if (!nullToAbsent || nextAiringEpisodeUpdateTime != null) {
      map['next_airing_episode_update_time'] =
          Variable<DateTime>(nextAiringEpisodeUpdateTime);
    }
    if (!nullToAbsent || siteUrl != null) {
      map['user_data_site_url'] = Variable<String>(siteUrl);
    }
    return map;
  }

  MediaTableCompanion toCompanion(bool nullToAbsent) {
    return MediaTableCompanion(
      id: Value(id),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      englishTitle: englishTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(englishTitle),
      romajiTitle: romajiTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(romajiTitle),
      nativeTitle: nativeTitle == null && nullToAbsent
          ? const Value.absent()
          : Value(nativeTitle),
      coverImageExtraLarge: coverImageExtraLarge == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageExtraLarge),
      coverImageLarge: coverImageLarge == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageLarge),
      coverImageMedium: coverImageMedium == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageMedium),
      coverImageColor: coverImageColor == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageColor),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      episodes: episodes == null && nullToAbsent
          ? const Value.absent()
          : Value(episodes),
      seasonYear: seasonYear == null && nullToAbsent
          ? const Value.absent()
          : Value(seasonYear),
      season:
          season == null && nullToAbsent ? const Value.absent() : Value(season),
      source:
          source == null && nullToAbsent ? const Value.absent() : Value(source),
      status:
          status == null && nullToAbsent ? const Value.absent() : Value(status),
      hashtag: hashtag == null && nullToAbsent
          ? const Value.absent()
          : Value(hashtag),
      bannerImage: bannerImage == null && nullToAbsent
          ? const Value.absent()
          : Value(bannerImage),
      averageScore: averageScore == null && nullToAbsent
          ? const Value.absent()
          : Value(averageScore),
      trailerId: trailerId == null && nullToAbsent
          ? const Value.absent()
          : Value(trailerId),
      trailerSite: trailerSite == null && nullToAbsent
          ? const Value.absent()
          : Value(trailerSite),
      trailerThumbnail: trailerThumbnail == null && nullToAbsent
          ? const Value.absent()
          : Value(trailerThumbnail),
      genres:
          genres == null && nullToAbsent ? const Value.absent() : Value(genres),
      format:
          format == null && nullToAbsent ? const Value.absent() : Value(format),
      trending: trending == null && nullToAbsent
          ? const Value.absent()
          : Value(trending),
      favourites: favourites == null && nullToAbsent
          ? const Value.absent()
          : Value(favourites),
      popularRanking: popularRanking == null && nullToAbsent
          ? const Value.absent()
          : Value(popularRanking),
      ratedRanking: ratedRanking == null && nullToAbsent
          ? const Value.absent()
          : Value(ratedRanking),
      nextAiringEpisode: nextAiringEpisode == null && nullToAbsent
          ? const Value.absent()
          : Value(nextAiringEpisode),
      timeUntilAiring: timeUntilAiring == null && nullToAbsent
          ? const Value.absent()
          : Value(timeUntilAiring),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      isFavourite: isFavourite == null && nullToAbsent
          ? const Value.absent()
          : Value(isFavourite),
      nextAiringEpisodeUpdateTime:
          nextAiringEpisodeUpdateTime == null && nullToAbsent
              ? const Value.absent()
              : Value(nextAiringEpisodeUpdateTime),
      siteUrl: siteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(siteUrl),
    );
  }

  factory MediaEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaEntity(
      id: serializer.fromJson<String>(json['id']),
      type: serializer.fromJson<String?>(json['type']),
      englishTitle: serializer.fromJson<String?>(json['englishTitle']),
      romajiTitle: serializer.fromJson<String?>(json['romajiTitle']),
      nativeTitle: serializer.fromJson<String?>(json['nativeTitle']),
      coverImageExtraLarge:
          serializer.fromJson<String?>(json['coverImageExtraLarge']),
      coverImageLarge: serializer.fromJson<String?>(json['coverImageLarge']),
      coverImageMedium: serializer.fromJson<String?>(json['coverImageMedium']),
      coverImageColor: serializer.fromJson<String?>(json['coverImageColor']),
      description: serializer.fromJson<String?>(json['description']),
      episodes: serializer.fromJson<int?>(json['episodes']),
      seasonYear: serializer.fromJson<int?>(json['seasonYear']),
      season: serializer.fromJson<String?>(json['season']),
      source: serializer.fromJson<String?>(json['source']),
      status: serializer.fromJson<String?>(json['status']),
      hashtag: serializer.fromJson<String?>(json['hashtag']),
      bannerImage: serializer.fromJson<String?>(json['bannerImage']),
      averageScore: serializer.fromJson<int?>(json['averageScore']),
      trailerId: serializer.fromJson<String?>(json['trailerId']),
      trailerSite: serializer.fromJson<String?>(json['trailerSite']),
      trailerThumbnail: serializer.fromJson<String?>(json['trailerThumbnail']),
      genres: serializer.fromJson<String?>(json['genres']),
      format: serializer.fromJson<String?>(json['format']),
      trending: serializer.fromJson<int?>(json['trending']),
      favourites: serializer.fromJson<int?>(json['favourites']),
      popularRanking: serializer.fromJson<int?>(json['popularRanking']),
      ratedRanking: serializer.fromJson<int?>(json['ratedRanking']),
      nextAiringEpisode: serializer.fromJson<int?>(json['nextAiringEpisode']),
      timeUntilAiring: serializer.fromJson<int?>(json['timeUntilAiring']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      isFavourite: serializer.fromJson<bool?>(json['isFavourite']),
      nextAiringEpisodeUpdateTime:
          serializer.fromJson<DateTime?>(json['nextAiringEpisodeUpdateTime']),
      siteUrl: serializer.fromJson<String?>(json['siteUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer.toJson<String?>(type),
      'englishTitle': serializer.toJson<String?>(englishTitle),
      'romajiTitle': serializer.toJson<String?>(romajiTitle),
      'nativeTitle': serializer.toJson<String?>(nativeTitle),
      'coverImageExtraLarge': serializer.toJson<String?>(coverImageExtraLarge),
      'coverImageLarge': serializer.toJson<String?>(coverImageLarge),
      'coverImageMedium': serializer.toJson<String?>(coverImageMedium),
      'coverImageColor': serializer.toJson<String?>(coverImageColor),
      'description': serializer.toJson<String?>(description),
      'episodes': serializer.toJson<int?>(episodes),
      'seasonYear': serializer.toJson<int?>(seasonYear),
      'season': serializer.toJson<String?>(season),
      'source': serializer.toJson<String?>(source),
      'status': serializer.toJson<String?>(status),
      'hashtag': serializer.toJson<String?>(hashtag),
      'bannerImage': serializer.toJson<String?>(bannerImage),
      'averageScore': serializer.toJson<int?>(averageScore),
      'trailerId': serializer.toJson<String?>(trailerId),
      'trailerSite': serializer.toJson<String?>(trailerSite),
      'trailerThumbnail': serializer.toJson<String?>(trailerThumbnail),
      'genres': serializer.toJson<String?>(genres),
      'format': serializer.toJson<String?>(format),
      'trending': serializer.toJson<int?>(trending),
      'favourites': serializer.toJson<int?>(favourites),
      'popularRanking': serializer.toJson<int?>(popularRanking),
      'ratedRanking': serializer.toJson<int?>(ratedRanking),
      'nextAiringEpisode': serializer.toJson<int?>(nextAiringEpisode),
      'timeUntilAiring': serializer.toJson<int?>(timeUntilAiring),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'isFavourite': serializer.toJson<bool?>(isFavourite),
      'nextAiringEpisodeUpdateTime':
          serializer.toJson<DateTime?>(nextAiringEpisodeUpdateTime),
      'siteUrl': serializer.toJson<String?>(siteUrl),
    };
  }

  MediaEntity copyWith(
          {String? id,
          Value<String?> type = const Value.absent(),
          Value<String?> englishTitle = const Value.absent(),
          Value<String?> romajiTitle = const Value.absent(),
          Value<String?> nativeTitle = const Value.absent(),
          Value<String?> coverImageExtraLarge = const Value.absent(),
          Value<String?> coverImageLarge = const Value.absent(),
          Value<String?> coverImageMedium = const Value.absent(),
          Value<String?> coverImageColor = const Value.absent(),
          Value<String?> description = const Value.absent(),
          Value<int?> episodes = const Value.absent(),
          Value<int?> seasonYear = const Value.absent(),
          Value<String?> season = const Value.absent(),
          Value<String?> source = const Value.absent(),
          Value<String?> status = const Value.absent(),
          Value<String?> hashtag = const Value.absent(),
          Value<String?> bannerImage = const Value.absent(),
          Value<int?> averageScore = const Value.absent(),
          Value<String?> trailerId = const Value.absent(),
          Value<String?> trailerSite = const Value.absent(),
          Value<String?> trailerThumbnail = const Value.absent(),
          Value<String?> genres = const Value.absent(),
          Value<String?> format = const Value.absent(),
          Value<int?> trending = const Value.absent(),
          Value<int?> favourites = const Value.absent(),
          Value<int?> popularRanking = const Value.absent(),
          Value<int?> ratedRanking = const Value.absent(),
          Value<int?> nextAiringEpisode = const Value.absent(),
          Value<int?> timeUntilAiring = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          Value<bool?> isFavourite = const Value.absent(),
          Value<DateTime?> nextAiringEpisodeUpdateTime = const Value.absent(),
          Value<String?> siteUrl = const Value.absent()}) =>
      MediaEntity(
        id: id ?? this.id,
        type: type.present ? type.value : this.type,
        englishTitle:
            englishTitle.present ? englishTitle.value : this.englishTitle,
        romajiTitle: romajiTitle.present ? romajiTitle.value : this.romajiTitle,
        nativeTitle: nativeTitle.present ? nativeTitle.value : this.nativeTitle,
        coverImageExtraLarge: coverImageExtraLarge.present
            ? coverImageExtraLarge.value
            : this.coverImageExtraLarge,
        coverImageLarge: coverImageLarge.present
            ? coverImageLarge.value
            : this.coverImageLarge,
        coverImageMedium: coverImageMedium.present
            ? coverImageMedium.value
            : this.coverImageMedium,
        coverImageColor: coverImageColor.present
            ? coverImageColor.value
            : this.coverImageColor,
        description: description.present ? description.value : this.description,
        episodes: episodes.present ? episodes.value : this.episodes,
        seasonYear: seasonYear.present ? seasonYear.value : this.seasonYear,
        season: season.present ? season.value : this.season,
        source: source.present ? source.value : this.source,
        status: status.present ? status.value : this.status,
        hashtag: hashtag.present ? hashtag.value : this.hashtag,
        bannerImage: bannerImage.present ? bannerImage.value : this.bannerImage,
        averageScore:
            averageScore.present ? averageScore.value : this.averageScore,
        trailerId: trailerId.present ? trailerId.value : this.trailerId,
        trailerSite: trailerSite.present ? trailerSite.value : this.trailerSite,
        trailerThumbnail: trailerThumbnail.present
            ? trailerThumbnail.value
            : this.trailerThumbnail,
        genres: genres.present ? genres.value : this.genres,
        format: format.present ? format.value : this.format,
        trending: trending.present ? trending.value : this.trending,
        favourites: favourites.present ? favourites.value : this.favourites,
        popularRanking:
            popularRanking.present ? popularRanking.value : this.popularRanking,
        ratedRanking:
            ratedRanking.present ? ratedRanking.value : this.ratedRanking,
        nextAiringEpisode: nextAiringEpisode.present
            ? nextAiringEpisode.value
            : this.nextAiringEpisode,
        timeUntilAiring: timeUntilAiring.present
            ? timeUntilAiring.value
            : this.timeUntilAiring,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        isFavourite: isFavourite.present ? isFavourite.value : this.isFavourite,
        nextAiringEpisodeUpdateTime: nextAiringEpisodeUpdateTime.present
            ? nextAiringEpisodeUpdateTime.value
            : this.nextAiringEpisodeUpdateTime,
        siteUrl: siteUrl.present ? siteUrl.value : this.siteUrl,
      );
  MediaEntity copyWithCompanion(MediaTableCompanion data) {
    return MediaEntity(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      englishTitle: data.englishTitle.present
          ? data.englishTitle.value
          : this.englishTitle,
      romajiTitle:
          data.romajiTitle.present ? data.romajiTitle.value : this.romajiTitle,
      nativeTitle:
          data.nativeTitle.present ? data.nativeTitle.value : this.nativeTitle,
      coverImageExtraLarge: data.coverImageExtraLarge.present
          ? data.coverImageExtraLarge.value
          : this.coverImageExtraLarge,
      coverImageLarge: data.coverImageLarge.present
          ? data.coverImageLarge.value
          : this.coverImageLarge,
      coverImageMedium: data.coverImageMedium.present
          ? data.coverImageMedium.value
          : this.coverImageMedium,
      coverImageColor: data.coverImageColor.present
          ? data.coverImageColor.value
          : this.coverImageColor,
      description:
          data.description.present ? data.description.value : this.description,
      episodes: data.episodes.present ? data.episodes.value : this.episodes,
      seasonYear:
          data.seasonYear.present ? data.seasonYear.value : this.seasonYear,
      season: data.season.present ? data.season.value : this.season,
      source: data.source.present ? data.source.value : this.source,
      status: data.status.present ? data.status.value : this.status,
      hashtag: data.hashtag.present ? data.hashtag.value : this.hashtag,
      bannerImage:
          data.bannerImage.present ? data.bannerImage.value : this.bannerImage,
      averageScore: data.averageScore.present
          ? data.averageScore.value
          : this.averageScore,
      trailerId: data.trailerId.present ? data.trailerId.value : this.trailerId,
      trailerSite:
          data.trailerSite.present ? data.trailerSite.value : this.trailerSite,
      trailerThumbnail: data.trailerThumbnail.present
          ? data.trailerThumbnail.value
          : this.trailerThumbnail,
      genres: data.genres.present ? data.genres.value : this.genres,
      format: data.format.present ? data.format.value : this.format,
      trending: data.trending.present ? data.trending.value : this.trending,
      favourites:
          data.favourites.present ? data.favourites.value : this.favourites,
      popularRanking: data.popularRanking.present
          ? data.popularRanking.value
          : this.popularRanking,
      ratedRanking: data.ratedRanking.present
          ? data.ratedRanking.value
          : this.ratedRanking,
      nextAiringEpisode: data.nextAiringEpisode.present
          ? data.nextAiringEpisode.value
          : this.nextAiringEpisode,
      timeUntilAiring: data.timeUntilAiring.present
          ? data.timeUntilAiring.value
          : this.timeUntilAiring,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      isFavourite:
          data.isFavourite.present ? data.isFavourite.value : this.isFavourite,
      nextAiringEpisodeUpdateTime: data.nextAiringEpisodeUpdateTime.present
          ? data.nextAiringEpisodeUpdateTime.value
          : this.nextAiringEpisodeUpdateTime,
      siteUrl: data.siteUrl.present ? data.siteUrl.value : this.siteUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaEntity(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('romajiTitle: $romajiTitle, ')
          ..write('nativeTitle: $nativeTitle, ')
          ..write('coverImageExtraLarge: $coverImageExtraLarge, ')
          ..write('coverImageLarge: $coverImageLarge, ')
          ..write('coverImageMedium: $coverImageMedium, ')
          ..write('coverImageColor: $coverImageColor, ')
          ..write('description: $description, ')
          ..write('episodes: $episodes, ')
          ..write('seasonYear: $seasonYear, ')
          ..write('season: $season, ')
          ..write('source: $source, ')
          ..write('status: $status, ')
          ..write('hashtag: $hashtag, ')
          ..write('bannerImage: $bannerImage, ')
          ..write('averageScore: $averageScore, ')
          ..write('trailerId: $trailerId, ')
          ..write('trailerSite: $trailerSite, ')
          ..write('trailerThumbnail: $trailerThumbnail, ')
          ..write('genres: $genres, ')
          ..write('format: $format, ')
          ..write('trending: $trending, ')
          ..write('favourites: $favourites, ')
          ..write('popularRanking: $popularRanking, ')
          ..write('ratedRanking: $ratedRanking, ')
          ..write('nextAiringEpisode: $nextAiringEpisode, ')
          ..write('timeUntilAiring: $timeUntilAiring, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('nextAiringEpisodeUpdateTime: $nextAiringEpisodeUpdateTime, ')
          ..write('siteUrl: $siteUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        type,
        englishTitle,
        romajiTitle,
        nativeTitle,
        coverImageExtraLarge,
        coverImageLarge,
        coverImageMedium,
        coverImageColor,
        description,
        episodes,
        seasonYear,
        season,
        source,
        status,
        hashtag,
        bannerImage,
        averageScore,
        trailerId,
        trailerSite,
        trailerThumbnail,
        genres,
        format,
        trending,
        favourites,
        popularRanking,
        ratedRanking,
        nextAiringEpisode,
        timeUntilAiring,
        startDate,
        endDate,
        isFavourite,
        nextAiringEpisodeUpdateTime,
        siteUrl
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaEntity &&
          other.id == this.id &&
          other.type == this.type &&
          other.englishTitle == this.englishTitle &&
          other.romajiTitle == this.romajiTitle &&
          other.nativeTitle == this.nativeTitle &&
          other.coverImageExtraLarge == this.coverImageExtraLarge &&
          other.coverImageLarge == this.coverImageLarge &&
          other.coverImageMedium == this.coverImageMedium &&
          other.coverImageColor == this.coverImageColor &&
          other.description == this.description &&
          other.episodes == this.episodes &&
          other.seasonYear == this.seasonYear &&
          other.season == this.season &&
          other.source == this.source &&
          other.status == this.status &&
          other.hashtag == this.hashtag &&
          other.bannerImage == this.bannerImage &&
          other.averageScore == this.averageScore &&
          other.trailerId == this.trailerId &&
          other.trailerSite == this.trailerSite &&
          other.trailerThumbnail == this.trailerThumbnail &&
          other.genres == this.genres &&
          other.format == this.format &&
          other.trending == this.trending &&
          other.favourites == this.favourites &&
          other.popularRanking == this.popularRanking &&
          other.ratedRanking == this.ratedRanking &&
          other.nextAiringEpisode == this.nextAiringEpisode &&
          other.timeUntilAiring == this.timeUntilAiring &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.isFavourite == this.isFavourite &&
          other.nextAiringEpisodeUpdateTime ==
              this.nextAiringEpisodeUpdateTime &&
          other.siteUrl == this.siteUrl);
}

class MediaTableCompanion extends UpdateCompanion<MediaEntity> {
  final Value<String> id;
  final Value<String?> type;
  final Value<String?> englishTitle;
  final Value<String?> romajiTitle;
  final Value<String?> nativeTitle;
  final Value<String?> coverImageExtraLarge;
  final Value<String?> coverImageLarge;
  final Value<String?> coverImageMedium;
  final Value<String?> coverImageColor;
  final Value<String?> description;
  final Value<int?> episodes;
  final Value<int?> seasonYear;
  final Value<String?> season;
  final Value<String?> source;
  final Value<String?> status;
  final Value<String?> hashtag;
  final Value<String?> bannerImage;
  final Value<int?> averageScore;
  final Value<String?> trailerId;
  final Value<String?> trailerSite;
  final Value<String?> trailerThumbnail;
  final Value<String?> genres;
  final Value<String?> format;
  final Value<int?> trending;
  final Value<int?> favourites;
  final Value<int?> popularRanking;
  final Value<int?> ratedRanking;
  final Value<int?> nextAiringEpisode;
  final Value<int?> timeUntilAiring;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<bool?> isFavourite;
  final Value<DateTime?> nextAiringEpisodeUpdateTime;
  final Value<String?> siteUrl;
  final Value<int> rowid;
  const MediaTableCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.englishTitle = const Value.absent(),
    this.romajiTitle = const Value.absent(),
    this.nativeTitle = const Value.absent(),
    this.coverImageExtraLarge = const Value.absent(),
    this.coverImageLarge = const Value.absent(),
    this.coverImageMedium = const Value.absent(),
    this.coverImageColor = const Value.absent(),
    this.description = const Value.absent(),
    this.episodes = const Value.absent(),
    this.seasonYear = const Value.absent(),
    this.season = const Value.absent(),
    this.source = const Value.absent(),
    this.status = const Value.absent(),
    this.hashtag = const Value.absent(),
    this.bannerImage = const Value.absent(),
    this.averageScore = const Value.absent(),
    this.trailerId = const Value.absent(),
    this.trailerSite = const Value.absent(),
    this.trailerThumbnail = const Value.absent(),
    this.genres = const Value.absent(),
    this.format = const Value.absent(),
    this.trending = const Value.absent(),
    this.favourites = const Value.absent(),
    this.popularRanking = const Value.absent(),
    this.ratedRanking = const Value.absent(),
    this.nextAiringEpisode = const Value.absent(),
    this.timeUntilAiring = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.nextAiringEpisodeUpdateTime = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaTableCompanion.insert({
    required String id,
    this.type = const Value.absent(),
    this.englishTitle = const Value.absent(),
    this.romajiTitle = const Value.absent(),
    this.nativeTitle = const Value.absent(),
    this.coverImageExtraLarge = const Value.absent(),
    this.coverImageLarge = const Value.absent(),
    this.coverImageMedium = const Value.absent(),
    this.coverImageColor = const Value.absent(),
    this.description = const Value.absent(),
    this.episodes = const Value.absent(),
    this.seasonYear = const Value.absent(),
    this.season = const Value.absent(),
    this.source = const Value.absent(),
    this.status = const Value.absent(),
    this.hashtag = const Value.absent(),
    this.bannerImage = const Value.absent(),
    this.averageScore = const Value.absent(),
    this.trailerId = const Value.absent(),
    this.trailerSite = const Value.absent(),
    this.trailerThumbnail = const Value.absent(),
    this.genres = const Value.absent(),
    this.format = const Value.absent(),
    this.trending = const Value.absent(),
    this.favourites = const Value.absent(),
    this.popularRanking = const Value.absent(),
    this.ratedRanking = const Value.absent(),
    this.nextAiringEpisode = const Value.absent(),
    this.timeUntilAiring = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.isFavourite = const Value.absent(),
    this.nextAiringEpisodeUpdateTime = const Value.absent(),
    this.siteUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<MediaEntity> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? englishTitle,
    Expression<String>? romajiTitle,
    Expression<String>? nativeTitle,
    Expression<String>? coverImageExtraLarge,
    Expression<String>? coverImageLarge,
    Expression<String>? coverImageMedium,
    Expression<String>? coverImageColor,
    Expression<String>? description,
    Expression<int>? episodes,
    Expression<int>? seasonYear,
    Expression<String>? season,
    Expression<String>? source,
    Expression<String>? status,
    Expression<String>? hashtag,
    Expression<String>? bannerImage,
    Expression<int>? averageScore,
    Expression<String>? trailerId,
    Expression<String>? trailerSite,
    Expression<String>? trailerThumbnail,
    Expression<String>? genres,
    Expression<String>? format,
    Expression<int>? trending,
    Expression<int>? favourites,
    Expression<int>? popularRanking,
    Expression<int>? ratedRanking,
    Expression<int>? nextAiringEpisode,
    Expression<int>? timeUntilAiring,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<bool>? isFavourite,
    Expression<DateTime>? nextAiringEpisodeUpdateTime,
    Expression<String>? siteUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'media_type': type,
      if (englishTitle != null) 'english_title': englishTitle,
      if (romajiTitle != null) 'romaji_title': romajiTitle,
      if (nativeTitle != null) 'native_title': nativeTitle,
      if (coverImageExtraLarge != null)
        'cover_image_extra_large': coverImageExtraLarge,
      if (coverImageLarge != null) 'cover_image_large': coverImageLarge,
      if (coverImageMedium != null) 'cover_image_medium': coverImageMedium,
      if (coverImageColor != null) 'cover_image_color': coverImageColor,
      if (description != null) 'description': description,
      if (episodes != null) 'episodes': episodes,
      if (seasonYear != null) 'season_year': seasonYear,
      if (season != null) 'season': season,
      if (source != null) 'source': source,
      if (status != null) 'status': status,
      if (hashtag != null) 'hashtag': hashtag,
      if (bannerImage != null) 'banner_image': bannerImage,
      if (averageScore != null) 'average_score': averageScore,
      if (trailerId != null) 'trailer_id': trailerId,
      if (trailerSite != null) 'trailer_site': trailerSite,
      if (trailerThumbnail != null) 'trailer_thumbnail': trailerThumbnail,
      if (genres != null) 'genres': genres,
      if (format != null) 'format': format,
      if (trending != null) 'trending': trending,
      if (favourites != null) 'favourites': favourites,
      if (popularRanking != null) 'popular_ranking': popularRanking,
      if (ratedRanking != null) 'rated_ranking': ratedRanking,
      if (nextAiringEpisode != null) 'next_airing_episode': nextAiringEpisode,
      if (timeUntilAiring != null) 'time_until_airing': timeUntilAiring,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (isFavourite != null) 'is_favourite': isFavourite,
      if (nextAiringEpisodeUpdateTime != null)
        'next_airing_episode_update_time': nextAiringEpisodeUpdateTime,
      if (siteUrl != null) 'user_data_site_url': siteUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaTableCompanion copyWith(
      {Value<String>? id,
      Value<String?>? type,
      Value<String?>? englishTitle,
      Value<String?>? romajiTitle,
      Value<String?>? nativeTitle,
      Value<String?>? coverImageExtraLarge,
      Value<String?>? coverImageLarge,
      Value<String?>? coverImageMedium,
      Value<String?>? coverImageColor,
      Value<String?>? description,
      Value<int?>? episodes,
      Value<int?>? seasonYear,
      Value<String?>? season,
      Value<String?>? source,
      Value<String?>? status,
      Value<String?>? hashtag,
      Value<String?>? bannerImage,
      Value<int?>? averageScore,
      Value<String?>? trailerId,
      Value<String?>? trailerSite,
      Value<String?>? trailerThumbnail,
      Value<String?>? genres,
      Value<String?>? format,
      Value<int?>? trending,
      Value<int?>? favourites,
      Value<int?>? popularRanking,
      Value<int?>? ratedRanking,
      Value<int?>? nextAiringEpisode,
      Value<int?>? timeUntilAiring,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<bool?>? isFavourite,
      Value<DateTime?>? nextAiringEpisodeUpdateTime,
      Value<String?>? siteUrl,
      Value<int>? rowid}) {
    return MediaTableCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      englishTitle: englishTitle ?? this.englishTitle,
      romajiTitle: romajiTitle ?? this.romajiTitle,
      nativeTitle: nativeTitle ?? this.nativeTitle,
      coverImageExtraLarge: coverImageExtraLarge ?? this.coverImageExtraLarge,
      coverImageLarge: coverImageLarge ?? this.coverImageLarge,
      coverImageMedium: coverImageMedium ?? this.coverImageMedium,
      coverImageColor: coverImageColor ?? this.coverImageColor,
      description: description ?? this.description,
      episodes: episodes ?? this.episodes,
      seasonYear: seasonYear ?? this.seasonYear,
      season: season ?? this.season,
      source: source ?? this.source,
      status: status ?? this.status,
      hashtag: hashtag ?? this.hashtag,
      bannerImage: bannerImage ?? this.bannerImage,
      averageScore: averageScore ?? this.averageScore,
      trailerId: trailerId ?? this.trailerId,
      trailerSite: trailerSite ?? this.trailerSite,
      trailerThumbnail: trailerThumbnail ?? this.trailerThumbnail,
      genres: genres ?? this.genres,
      format: format ?? this.format,
      trending: trending ?? this.trending,
      favourites: favourites ?? this.favourites,
      popularRanking: popularRanking ?? this.popularRanking,
      ratedRanking: ratedRanking ?? this.ratedRanking,
      nextAiringEpisode: nextAiringEpisode ?? this.nextAiringEpisode,
      timeUntilAiring: timeUntilAiring ?? this.timeUntilAiring,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      isFavourite: isFavourite ?? this.isFavourite,
      nextAiringEpisodeUpdateTime:
          nextAiringEpisodeUpdateTime ?? this.nextAiringEpisodeUpdateTime,
      siteUrl: siteUrl ?? this.siteUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['media_type'] = Variable<String>(type.value);
    }
    if (englishTitle.present) {
      map['english_title'] = Variable<String>(englishTitle.value);
    }
    if (romajiTitle.present) {
      map['romaji_title'] = Variable<String>(romajiTitle.value);
    }
    if (nativeTitle.present) {
      map['native_title'] = Variable<String>(nativeTitle.value);
    }
    if (coverImageExtraLarge.present) {
      map['cover_image_extra_large'] =
          Variable<String>(coverImageExtraLarge.value);
    }
    if (coverImageLarge.present) {
      map['cover_image_large'] = Variable<String>(coverImageLarge.value);
    }
    if (coverImageMedium.present) {
      map['cover_image_medium'] = Variable<String>(coverImageMedium.value);
    }
    if (coverImageColor.present) {
      map['cover_image_color'] = Variable<String>(coverImageColor.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (episodes.present) {
      map['episodes'] = Variable<int>(episodes.value);
    }
    if (seasonYear.present) {
      map['season_year'] = Variable<int>(seasonYear.value);
    }
    if (season.present) {
      map['season'] = Variable<String>(season.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (hashtag.present) {
      map['hashtag'] = Variable<String>(hashtag.value);
    }
    if (bannerImage.present) {
      map['banner_image'] = Variable<String>(bannerImage.value);
    }
    if (averageScore.present) {
      map['average_score'] = Variable<int>(averageScore.value);
    }
    if (trailerId.present) {
      map['trailer_id'] = Variable<String>(trailerId.value);
    }
    if (trailerSite.present) {
      map['trailer_site'] = Variable<String>(trailerSite.value);
    }
    if (trailerThumbnail.present) {
      map['trailer_thumbnail'] = Variable<String>(trailerThumbnail.value);
    }
    if (genres.present) {
      map['genres'] = Variable<String>(genres.value);
    }
    if (format.present) {
      map['format'] = Variable<String>(format.value);
    }
    if (trending.present) {
      map['trending'] = Variable<int>(trending.value);
    }
    if (favourites.present) {
      map['favourites'] = Variable<int>(favourites.value);
    }
    if (popularRanking.present) {
      map['popular_ranking'] = Variable<int>(popularRanking.value);
    }
    if (ratedRanking.present) {
      map['rated_ranking'] = Variable<int>(ratedRanking.value);
    }
    if (nextAiringEpisode.present) {
      map['next_airing_episode'] = Variable<int>(nextAiringEpisode.value);
    }
    if (timeUntilAiring.present) {
      map['time_until_airing'] = Variable<int>(timeUntilAiring.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (isFavourite.present) {
      map['is_favourite'] = Variable<bool>(isFavourite.value);
    }
    if (nextAiringEpisodeUpdateTime.present) {
      map['next_airing_episode_update_time'] =
          Variable<DateTime>(nextAiringEpisodeUpdateTime.value);
    }
    if (siteUrl.present) {
      map['user_data_site_url'] = Variable<String>(siteUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaTableCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('englishTitle: $englishTitle, ')
          ..write('romajiTitle: $romajiTitle, ')
          ..write('nativeTitle: $nativeTitle, ')
          ..write('coverImageExtraLarge: $coverImageExtraLarge, ')
          ..write('coverImageLarge: $coverImageLarge, ')
          ..write('coverImageMedium: $coverImageMedium, ')
          ..write('coverImageColor: $coverImageColor, ')
          ..write('description: $description, ')
          ..write('episodes: $episodes, ')
          ..write('seasonYear: $seasonYear, ')
          ..write('season: $season, ')
          ..write('source: $source, ')
          ..write('status: $status, ')
          ..write('hashtag: $hashtag, ')
          ..write('bannerImage: $bannerImage, ')
          ..write('averageScore: $averageScore, ')
          ..write('trailerId: $trailerId, ')
          ..write('trailerSite: $trailerSite, ')
          ..write('trailerThumbnail: $trailerThumbnail, ')
          ..write('genres: $genres, ')
          ..write('format: $format, ')
          ..write('trending: $trending, ')
          ..write('favourites: $favourites, ')
          ..write('popularRanking: $popularRanking, ')
          ..write('ratedRanking: $ratedRanking, ')
          ..write('nextAiringEpisode: $nextAiringEpisode, ')
          ..write('timeUntilAiring: $timeUntilAiring, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('isFavourite: $isFavourite, ')
          ..write('nextAiringEpisodeUpdateTime: $nextAiringEpisodeUpdateTime, ')
          ..write('siteUrl: $siteUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudioMediaCrossRefTableTable extends StudioMediaCrossRefTable
    with TableInfo<$StudioMediaCrossRefTableTable, StudioMediaCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudioMediaCrossRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _studioIdMeta =
      const VerificationMeta('studioId');
  @override
  late final GeneratedColumn<String> studioId = GeneratedColumn<String>(
      'studio_media_cross_ref_studio_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'studio_media_cross_ref_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [studioId, mediaId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'studio_media_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<StudioMediaCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('studio_media_cross_ref_studio_id')) {
      context.handle(
          _studioIdMeta,
          studioId.isAcceptableOrUnknown(
              data['studio_media_cross_ref_studio_id']!, _studioIdMeta));
    } else if (isInserting) {
      context.missing(_studioIdMeta);
    }
    if (data.containsKey('studio_media_cross_ref_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['studio_media_cross_ref_media_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {studioId, mediaId};
  @override
  StudioMediaCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudioMediaCrossRefEntity(
      studioId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}studio_media_cross_ref_studio_id'])!,
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}studio_media_cross_ref_media_id'])!,
    );
  }

  @override
  $StudioMediaCrossRefTableTable createAlias(String alias) {
    return $StudioMediaCrossRefTableTable(attachedDatabase, alias);
  }
}

class StudioMediaCrossRefEntity extends DataClass
    implements Insertable<StudioMediaCrossRefEntity> {
  final String studioId;
  final String mediaId;
  const StudioMediaCrossRefEntity(
      {required this.studioId, required this.mediaId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['studio_media_cross_ref_studio_id'] = Variable<String>(studioId);
    map['studio_media_cross_ref_media_id'] = Variable<String>(mediaId);
    return map;
  }

  StudioMediaCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return StudioMediaCrossRefTableCompanion(
      studioId: Value(studioId),
      mediaId: Value(mediaId),
    );
  }

  factory StudioMediaCrossRefEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudioMediaCrossRefEntity(
      studioId: serializer.fromJson<String>(json['studioId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'studioId': serializer.toJson<String>(studioId),
      'mediaId': serializer.toJson<String>(mediaId),
    };
  }

  StudioMediaCrossRefEntity copyWith({String? studioId, String? mediaId}) =>
      StudioMediaCrossRefEntity(
        studioId: studioId ?? this.studioId,
        mediaId: mediaId ?? this.mediaId,
      );
  StudioMediaCrossRefEntity copyWithCompanion(
      StudioMediaCrossRefTableCompanion data) {
    return StudioMediaCrossRefEntity(
      studioId: data.studioId.present ? data.studioId.value : this.studioId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudioMediaCrossRefEntity(')
          ..write('studioId: $studioId, ')
          ..write('mediaId: $mediaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(studioId, mediaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudioMediaCrossRefEntity &&
          other.studioId == this.studioId &&
          other.mediaId == this.mediaId);
}

class StudioMediaCrossRefTableCompanion
    extends UpdateCompanion<StudioMediaCrossRefEntity> {
  final Value<String> studioId;
  final Value<String> mediaId;
  final Value<int> rowid;
  const StudioMediaCrossRefTableCompanion({
    this.studioId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudioMediaCrossRefTableCompanion.insert({
    required String studioId,
    required String mediaId,
    this.rowid = const Value.absent(),
  })  : studioId = Value(studioId),
        mediaId = Value(mediaId);
  static Insertable<StudioMediaCrossRefEntity> custom({
    Expression<String>? studioId,
    Expression<String>? mediaId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (studioId != null) 'studio_media_cross_ref_studio_id': studioId,
      if (mediaId != null) 'studio_media_cross_ref_media_id': mediaId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudioMediaCrossRefTableCompanion copyWith(
      {Value<String>? studioId, Value<String>? mediaId, Value<int>? rowid}) {
    return StudioMediaCrossRefTableCompanion(
      studioId: studioId ?? this.studioId,
      mediaId: mediaId ?? this.mediaId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (studioId.present) {
      map['studio_media_cross_ref_studio_id'] =
          Variable<String>(studioId.value);
    }
    if (mediaId.present) {
      map['studio_media_cross_ref_media_id'] = Variable<String>(mediaId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudioMediaCrossRefTableCompanion(')
          ..write('studioId: $studioId, ')
          ..write('mediaId: $mediaId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterRelatedMediaCrossRefTableTable
    extends CharacterRelatedMediaCrossRefTable
    with
        TableInfo<$CharacterRelatedMediaCrossRefTableTable,
            CharacterRelatedMediaCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterRelatedMediaCrossRefTableTable(this.attachedDatabase,
      [this._alias]);
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_and_media_relation_cross_ref_character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'character_and_media_relation_cross_ref_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [characterId, mediaId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_related_media_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CharacterRelatedMediaCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data
        .containsKey('character_and_media_relation_cross_ref_character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_and_media_relation_cross_ref_character_id']!,
              _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('character_and_media_relation_cross_ref_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['character_and_media_relation_cross_ref_media_id']!,
              _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, mediaId};
  @override
  CharacterRelatedMediaCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterRelatedMediaCrossRefEntity(
      characterId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data[
              '${effectivePrefix}character_and_media_relation_cross_ref_character_id'])!,
      mediaId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data[
              '${effectivePrefix}character_and_media_relation_cross_ref_media_id'])!,
    );
  }

  @override
  $CharacterRelatedMediaCrossRefTableTable createAlias(String alias) {
    return $CharacterRelatedMediaCrossRefTableTable(attachedDatabase, alias);
  }
}

class CharacterRelatedMediaCrossRefEntity extends DataClass
    implements Insertable<CharacterRelatedMediaCrossRefEntity> {
  final String characterId;
  final String mediaId;
  const CharacterRelatedMediaCrossRefEntity(
      {required this.characterId, required this.mediaId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_and_media_relation_cross_ref_character_id'] =
        Variable<String>(characterId);
    map['character_and_media_relation_cross_ref_media_id'] =
        Variable<String>(mediaId);
    return map;
  }

  CharacterRelatedMediaCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterRelatedMediaCrossRefTableCompanion(
      characterId: Value(characterId),
      mediaId: Value(mediaId),
    );
  }

  factory CharacterRelatedMediaCrossRefEntity.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterRelatedMediaCrossRefEntity(
      characterId: serializer.fromJson<String>(json['characterId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'mediaId': serializer.toJson<String>(mediaId),
    };
  }

  CharacterRelatedMediaCrossRefEntity copyWith(
          {String? characterId, String? mediaId}) =>
      CharacterRelatedMediaCrossRefEntity(
        characterId: characterId ?? this.characterId,
        mediaId: mediaId ?? this.mediaId,
      );
  CharacterRelatedMediaCrossRefEntity copyWithCompanion(
      CharacterRelatedMediaCrossRefTableCompanion data) {
    return CharacterRelatedMediaCrossRefEntity(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterRelatedMediaCrossRefEntity(')
          ..write('characterId: $characterId, ')
          ..write('mediaId: $mediaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, mediaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterRelatedMediaCrossRefEntity &&
          other.characterId == this.characterId &&
          other.mediaId == this.mediaId);
}

class CharacterRelatedMediaCrossRefTableCompanion
    extends UpdateCompanion<CharacterRelatedMediaCrossRefEntity> {
  final Value<String> characterId;
  final Value<String> mediaId;
  final Value<int> rowid;
  const CharacterRelatedMediaCrossRefTableCompanion({
    this.characterId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CharacterRelatedMediaCrossRefTableCompanion.insert({
    required String characterId,
    required String mediaId,
    this.rowid = const Value.absent(),
  })  : characterId = Value(characterId),
        mediaId = Value(mediaId);
  static Insertable<CharacterRelatedMediaCrossRefEntity> custom({
    Expression<String>? characterId,
    Expression<String>? mediaId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null)
        'character_and_media_relation_cross_ref_character_id': characterId,
      if (mediaId != null)
        'character_and_media_relation_cross_ref_media_id': mediaId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CharacterRelatedMediaCrossRefTableCompanion copyWith(
      {Value<String>? characterId, Value<String>? mediaId, Value<int>? rowid}) {
    return CharacterRelatedMediaCrossRefTableCompanion(
      characterId: characterId ?? this.characterId,
      mediaId: mediaId ?? this.mediaId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['character_and_media_relation_cross_ref_character_id'] =
          Variable<String>(characterId.value);
    }
    if (mediaId.present) {
      map['character_and_media_relation_cross_ref_media_id'] =
          Variable<String>(mediaId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterRelatedMediaCrossRefTableCompanion(')
          ..write('characterId: $characterId, ')
          ..write('mediaId: $mediaId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActivityFilterTypePagingCrossRefTableTable
    extends ActivityFilterTypePagingCrossRefTable
    with
        TableInfo<$ActivityFilterTypePagingCrossRefTableTable,
            ActivityFilterTypePagingCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityFilterTypePagingCrossRefTableTable(this.attachedDatabase,
      [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'activity_filter_type_cross_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _activityIdMeta =
      const VerificationMeta('activityId');
  @override
  late final GeneratedColumn<String> activityId = GeneratedColumn<String>(
      'activity_filter_type_cross_activity_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'activity_filter_type_cross_filter_category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, activityId, category];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_filter_type_paging_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ActivityFilterTypePagingCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('activity_filter_type_cross_id')) {
      context.handle(
          _idMeta,
          id.isAcceptableOrUnknown(
              data['activity_filter_type_cross_id']!, _idMeta));
    }
    if (data.containsKey('activity_filter_type_cross_activity_id')) {
      context.handle(
          _activityIdMeta,
          activityId.isAcceptableOrUnknown(
              data['activity_filter_type_cross_activity_id']!,
              _activityIdMeta));
    } else if (isInserting) {
      context.missing(_activityIdMeta);
    }
    if (data.containsKey('activity_filter_type_cross_filter_category')) {
      context.handle(
          _categoryMeta,
          category.isAcceptableOrUnknown(
              data['activity_filter_type_cross_filter_category']!,
              _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {activityId, category},
      ];
  @override
  ActivityFilterTypePagingCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityFilterTypePagingCrossRefEntity(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}activity_filter_type_cross_id'])!,
      activityId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}activity_filter_type_cross_activity_id'])!,
      category: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data[
              '${effectivePrefix}activity_filter_type_cross_filter_category'])!,
    );
  }

  @override
  $ActivityFilterTypePagingCrossRefTableTable createAlias(String alias) {
    return $ActivityFilterTypePagingCrossRefTableTable(attachedDatabase, alias);
  }
}

class ActivityFilterTypePagingCrossRefEntity extends DataClass
    implements Insertable<ActivityFilterTypePagingCrossRefEntity> {
  final int id;
  final String activityId;
  final String category;
  const ActivityFilterTypePagingCrossRefEntity(
      {required this.id, required this.activityId, required this.category});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['activity_filter_type_cross_id'] = Variable<int>(id);
    map['activity_filter_type_cross_activity_id'] =
        Variable<String>(activityId);
    map['activity_filter_type_cross_filter_category'] =
        Variable<String>(category);
    return map;
  }

  ActivityFilterTypePagingCrossRefTableCompanion toCompanion(
      bool nullToAbsent) {
    return ActivityFilterTypePagingCrossRefTableCompanion(
      id: Value(id),
      activityId: Value(activityId),
      category: Value(category),
    );
  }

  factory ActivityFilterTypePagingCrossRefEntity.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityFilterTypePagingCrossRefEntity(
      id: serializer.fromJson<int>(json['id']),
      activityId: serializer.fromJson<String>(json['activityId']),
      category: serializer.fromJson<String>(json['category']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'activityId': serializer.toJson<String>(activityId),
      'category': serializer.toJson<String>(category),
    };
  }

  ActivityFilterTypePagingCrossRefEntity copyWith(
          {int? id, String? activityId, String? category}) =>
      ActivityFilterTypePagingCrossRefEntity(
        id: id ?? this.id,
        activityId: activityId ?? this.activityId,
        category: category ?? this.category,
      );
  ActivityFilterTypePagingCrossRefEntity copyWithCompanion(
      ActivityFilterTypePagingCrossRefTableCompanion data) {
    return ActivityFilterTypePagingCrossRefEntity(
      id: data.id.present ? data.id.value : this.id,
      activityId:
          data.activityId.present ? data.activityId.value : this.activityId,
      category: data.category.present ? data.category.value : this.category,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityFilterTypePagingCrossRefEntity(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, activityId, category);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityFilterTypePagingCrossRefEntity &&
          other.id == this.id &&
          other.activityId == this.activityId &&
          other.category == this.category);
}

class ActivityFilterTypePagingCrossRefTableCompanion
    extends UpdateCompanion<ActivityFilterTypePagingCrossRefEntity> {
  final Value<int> id;
  final Value<String> activityId;
  final Value<String> category;
  const ActivityFilterTypePagingCrossRefTableCompanion({
    this.id = const Value.absent(),
    this.activityId = const Value.absent(),
    this.category = const Value.absent(),
  });
  ActivityFilterTypePagingCrossRefTableCompanion.insert({
    this.id = const Value.absent(),
    required String activityId,
    required String category,
  })  : activityId = Value(activityId),
        category = Value(category);
  static Insertable<ActivityFilterTypePagingCrossRefEntity> custom({
    Expression<int>? id,
    Expression<String>? activityId,
    Expression<String>? category,
  }) {
    return RawValuesInsertable({
      if (id != null) 'activity_filter_type_cross_id': id,
      if (activityId != null)
        'activity_filter_type_cross_activity_id': activityId,
      if (category != null)
        'activity_filter_type_cross_filter_category': category,
    });
  }

  ActivityFilterTypePagingCrossRefTableCompanion copyWith(
      {Value<int>? id, Value<String>? activityId, Value<String>? category}) {
    return ActivityFilterTypePagingCrossRefTableCompanion(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      category: category ?? this.category,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['activity_filter_type_cross_id'] = Variable<int>(id.value);
    }
    if (activityId.present) {
      map['activity_filter_type_cross_activity_id'] =
          Variable<String>(activityId.value);
    }
    if (category.present) {
      map['activity_filter_type_cross_filter_category'] =
          Variable<String>(category.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityFilterTypePagingCrossRefTableCompanion(')
          ..write('id: $id, ')
          ..write('activityId: $activityId, ')
          ..write('category: $category')
          ..write(')'))
        .toString();
  }
}

class $MediaCharacterPagingCrossRefTableTable
    extends MediaCharacterPagingCrossRefTable
    with
        TableInfo<$MediaCharacterPagingCrossRefTableTable,
            MediaCharacterPagingCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaCharacterPagingCrossRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'media_character_cross_anime_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'media_character_cross_character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeStampMeta =
      const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'media_character_cross_time_stamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [characterId, mediaId, timeStamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_character_paging_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MediaCharacterPagingCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_character_cross_anime_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['media_character_cross_anime_id']!, _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('media_character_cross_character_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['media_character_cross_character_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('media_character_cross_time_stamp')) {
      context.handle(
          _timeStampMeta,
          timeStamp.isAcceptableOrUnknown(
              data['media_character_cross_time_stamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {characterId, mediaId};
  @override
  MediaCharacterPagingCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaCharacterPagingCrossRefEntity(
      characterId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_character_cross_anime_id'])!,
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_character_cross_character_id'])!,
      timeStamp: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}media_character_cross_time_stamp'])!,
    );
  }

  @override
  $MediaCharacterPagingCrossRefTableTable createAlias(String alias) {
    return $MediaCharacterPagingCrossRefTableTable(attachedDatabase, alias);
  }
}

class MediaCharacterPagingCrossRefEntity extends DataClass
    implements Insertable<MediaCharacterPagingCrossRefEntity> {
  final String characterId;
  final String mediaId;
  final int timeStamp;
  const MediaCharacterPagingCrossRefEntity(
      {required this.characterId,
      required this.mediaId,
      required this.timeStamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_character_cross_anime_id'] = Variable<String>(characterId);
    map['media_character_cross_character_id'] = Variable<String>(mediaId);
    map['media_character_cross_time_stamp'] = Variable<int>(timeStamp);
    return map;
  }

  MediaCharacterPagingCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return MediaCharacterPagingCrossRefTableCompanion(
      characterId: Value(characterId),
      mediaId: Value(mediaId),
      timeStamp: Value(timeStamp),
    );
  }

  factory MediaCharacterPagingCrossRefEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaCharacterPagingCrossRefEntity(
      characterId: serializer.fromJson<String>(json['characterId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'characterId': serializer.toJson<String>(characterId),
      'mediaId': serializer.toJson<String>(mediaId),
      'timeStamp': serializer.toJson<int>(timeStamp),
    };
  }

  MediaCharacterPagingCrossRefEntity copyWith(
          {String? characterId, String? mediaId, int? timeStamp}) =>
      MediaCharacterPagingCrossRefEntity(
        characterId: characterId ?? this.characterId,
        mediaId: mediaId ?? this.mediaId,
        timeStamp: timeStamp ?? this.timeStamp,
      );
  MediaCharacterPagingCrossRefEntity copyWithCompanion(
      MediaCharacterPagingCrossRefTableCompanion data) {
    return MediaCharacterPagingCrossRefEntity(
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      timeStamp: data.timeStamp.present ? data.timeStamp.value : this.timeStamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaCharacterPagingCrossRefEntity(')
          ..write('characterId: $characterId, ')
          ..write('mediaId: $mediaId, ')
          ..write('timeStamp: $timeStamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(characterId, mediaId, timeStamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaCharacterPagingCrossRefEntity &&
          other.characterId == this.characterId &&
          other.mediaId == this.mediaId &&
          other.timeStamp == this.timeStamp);
}

class MediaCharacterPagingCrossRefTableCompanion
    extends UpdateCompanion<MediaCharacterPagingCrossRefEntity> {
  final Value<String> characterId;
  final Value<String> mediaId;
  final Value<int> timeStamp;
  final Value<int> rowid;
  const MediaCharacterPagingCrossRefTableCompanion({
    this.characterId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaCharacterPagingCrossRefTableCompanion.insert({
    required String characterId,
    required String mediaId,
    required int timeStamp,
    this.rowid = const Value.absent(),
  })  : characterId = Value(characterId),
        mediaId = Value(mediaId),
        timeStamp = Value(timeStamp);
  static Insertable<MediaCharacterPagingCrossRefEntity> custom({
    Expression<String>? characterId,
    Expression<String>? mediaId,
    Expression<int>? timeStamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (characterId != null) 'media_character_cross_anime_id': characterId,
      if (mediaId != null) 'media_character_cross_character_id': mediaId,
      if (timeStamp != null) 'media_character_cross_time_stamp': timeStamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaCharacterPagingCrossRefTableCompanion copyWith(
      {Value<String>? characterId,
      Value<String>? mediaId,
      Value<int>? timeStamp,
      Value<int>? rowid}) {
    return MediaCharacterPagingCrossRefTableCompanion(
      characterId: characterId ?? this.characterId,
      mediaId: mediaId ?? this.mediaId,
      timeStamp: timeStamp ?? this.timeStamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (characterId.present) {
      map['media_character_cross_anime_id'] =
          Variable<String>(characterId.value);
    }
    if (mediaId.present) {
      map['media_character_cross_character_id'] =
          Variable<String>(mediaId.value);
    }
    if (timeStamp.present) {
      map['media_character_cross_time_stamp'] = Variable<int>(timeStamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaCharacterPagingCrossRefTableCompanion(')
          ..write('characterId: $characterId, ')
          ..write('mediaId: $mediaId, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CharacterVoiceActorCrossRefTableTable
    extends CharacterVoiceActorCrossRefTable
    with
        TableInfo<$CharacterVoiceActorCrossRefTableTable,
            CharacterCharacterVoiceActorCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CharacterVoiceActorCrossRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'character_voice_actor_cross_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _characterIdMeta =
      const VerificationMeta('characterId');
  @override
  late final GeneratedColumn<String> characterId = GeneratedColumn<String>(
      'character_voice_actor_cross_character_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'character_voice_actor_cross_staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'character_voice_actor_cross_role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'character_voice_actor_cross_language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, characterId, staffId, role, language];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'character_voice_actor_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CharacterCharacterVoiceActorCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('character_voice_actor_cross_id')) {
      context.handle(
          _idMeta,
          id.isAcceptableOrUnknown(
              data['character_voice_actor_cross_id']!, _idMeta));
    }
    if (data.containsKey('character_voice_actor_cross_character_id')) {
      context.handle(
          _characterIdMeta,
          characterId.isAcceptableOrUnknown(
              data['character_voice_actor_cross_character_id']!,
              _characterIdMeta));
    } else if (isInserting) {
      context.missing(_characterIdMeta);
    }
    if (data.containsKey('character_voice_actor_cross_staff_id')) {
      context.handle(
          _staffIdMeta,
          staffId.isAcceptableOrUnknown(
              data['character_voice_actor_cross_staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('character_voice_actor_cross_role')) {
      context.handle(
          _roleMeta,
          role.isAcceptableOrUnknown(
              data['character_voice_actor_cross_role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('character_voice_actor_cross_language')) {
      context.handle(
          _languageMeta,
          language.isAcceptableOrUnknown(
              data['character_voice_actor_cross_language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {characterId, staffId},
      ];
  @override
  CharacterCharacterVoiceActorCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterCharacterVoiceActorCrossRefEntity(
      id: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}character_voice_actor_cross_id'])!,
      characterId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}character_voice_actor_cross_character_id'])!,
      staffId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}character_voice_actor_cross_staff_id'])!,
      role: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}character_voice_actor_cross_role'])!,
      language: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}character_voice_actor_cross_language'])!,
    );
  }

  @override
  $CharacterVoiceActorCrossRefTableTable createAlias(String alias) {
    return $CharacterVoiceActorCrossRefTableTable(attachedDatabase, alias);
  }
}

class CharacterCharacterVoiceActorCrossRefEntity extends DataClass
    implements Insertable<CharacterCharacterVoiceActorCrossRefEntity> {
  final int id;
  final String characterId;
  final String staffId;
  final String role;
  final String language;
  const CharacterCharacterVoiceActorCrossRefEntity(
      {required this.id,
      required this.characterId,
      required this.staffId,
      required this.role,
      required this.language});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['character_voice_actor_cross_id'] = Variable<int>(id);
    map['character_voice_actor_cross_character_id'] =
        Variable<String>(characterId);
    map['character_voice_actor_cross_staff_id'] = Variable<String>(staffId);
    map['character_voice_actor_cross_role'] = Variable<String>(role);
    map['character_voice_actor_cross_language'] = Variable<String>(language);
    return map;
  }

  CharacterVoiceActorCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return CharacterVoiceActorCrossRefTableCompanion(
      id: Value(id),
      characterId: Value(characterId),
      staffId: Value(staffId),
      role: Value(role),
      language: Value(language),
    );
  }

  factory CharacterCharacterVoiceActorCrossRefEntity.fromJson(
      Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterCharacterVoiceActorCrossRefEntity(
      id: serializer.fromJson<int>(json['id']),
      characterId: serializer.fromJson<String>(json['characterId']),
      staffId: serializer.fromJson<String>(json['staffId']),
      role: serializer.fromJson<String>(json['role']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'characterId': serializer.toJson<String>(characterId),
      'staffId': serializer.toJson<String>(staffId),
      'role': serializer.toJson<String>(role),
      'language': serializer.toJson<String>(language),
    };
  }

  CharacterCharacterVoiceActorCrossRefEntity copyWith(
          {int? id,
          String? characterId,
          String? staffId,
          String? role,
          String? language}) =>
      CharacterCharacterVoiceActorCrossRefEntity(
        id: id ?? this.id,
        characterId: characterId ?? this.characterId,
        staffId: staffId ?? this.staffId,
        role: role ?? this.role,
        language: language ?? this.language,
      );
  CharacterCharacterVoiceActorCrossRefEntity copyWithCompanion(
      CharacterVoiceActorCrossRefTableCompanion data) {
    return CharacterCharacterVoiceActorCrossRefEntity(
      id: data.id.present ? data.id.value : this.id,
      characterId:
          data.characterId.present ? data.characterId.value : this.characterId,
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      role: data.role.present ? data.role.value : this.role,
      language: data.language.present ? data.language.value : this.language,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CharacterCharacterVoiceActorCrossRefEntity(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('staffId: $staffId, ')
          ..write('role: $role, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, characterId, staffId, role, language);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterCharacterVoiceActorCrossRefEntity &&
          other.id == this.id &&
          other.characterId == this.characterId &&
          other.staffId == this.staffId &&
          other.role == this.role &&
          other.language == this.language);
}

class CharacterVoiceActorCrossRefTableCompanion
    extends UpdateCompanion<CharacterCharacterVoiceActorCrossRefEntity> {
  final Value<int> id;
  final Value<String> characterId;
  final Value<String> staffId;
  final Value<String> role;
  final Value<String> language;
  const CharacterVoiceActorCrossRefTableCompanion({
    this.id = const Value.absent(),
    this.characterId = const Value.absent(),
    this.staffId = const Value.absent(),
    this.role = const Value.absent(),
    this.language = const Value.absent(),
  });
  CharacterVoiceActorCrossRefTableCompanion.insert({
    this.id = const Value.absent(),
    required String characterId,
    required String staffId,
    required String role,
    required String language,
  })  : characterId = Value(characterId),
        staffId = Value(staffId),
        role = Value(role),
        language = Value(language);
  static Insertable<CharacterCharacterVoiceActorCrossRefEntity> custom({
    Expression<int>? id,
    Expression<String>? characterId,
    Expression<String>? staffId,
    Expression<String>? role,
    Expression<String>? language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'character_voice_actor_cross_id': id,
      if (characterId != null)
        'character_voice_actor_cross_character_id': characterId,
      if (staffId != null) 'character_voice_actor_cross_staff_id': staffId,
      if (role != null) 'character_voice_actor_cross_role': role,
      if (language != null) 'character_voice_actor_cross_language': language,
    });
  }

  CharacterVoiceActorCrossRefTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? characterId,
      Value<String>? staffId,
      Value<String>? role,
      Value<String>? language}) {
    return CharacterVoiceActorCrossRefTableCompanion(
      id: id ?? this.id,
      characterId: characterId ?? this.characterId,
      staffId: staffId ?? this.staffId,
      role: role ?? this.role,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['character_voice_actor_cross_id'] = Variable<int>(id.value);
    }
    if (characterId.present) {
      map['character_voice_actor_cross_character_id'] =
          Variable<String>(characterId.value);
    }
    if (staffId.present) {
      map['character_voice_actor_cross_staff_id'] =
          Variable<String>(staffId.value);
    }
    if (role.present) {
      map['character_voice_actor_cross_role'] = Variable<String>(role.value);
    }
    if (language.present) {
      map['character_voice_actor_cross_language'] =
          Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterVoiceActorCrossRefTableCompanion(')
          ..write('id: $id, ')
          ..write('characterId: $characterId, ')
          ..write('staffId: $staffId, ')
          ..write('role: $role, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $MediaRelationCrossRefTableTable extends MediaRelationCrossRefTable
    with
        TableInfo<$MediaRelationCrossRefTableTable,
            MediaRelationCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaRelationCrossRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ownerIdMeta =
      const VerificationMeta('ownerId');
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
      'media_relation_cross_ref_owner_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationIdMeta =
      const VerificationMeta('relationId');
  @override
  late final GeneratedColumn<String> relationId = GeneratedColumn<String>(
      'media_relation_cross_ref_relation_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relationTypeMeta =
      const VerificationMeta('relationType');
  @override
  late final GeneratedColumn<String> relationType = GeneratedColumn<String>(
      'media_staff_cross_ref_relation_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [ownerId, relationId, relationType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_relation_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MediaRelationCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_relation_cross_ref_owner_media_id')) {
      context.handle(
          _ownerIdMeta,
          ownerId.isAcceptableOrUnknown(
              data['media_relation_cross_ref_owner_media_id']!, _ownerIdMeta));
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('media_relation_cross_ref_relation_media_id')) {
      context.handle(
          _relationIdMeta,
          relationId.isAcceptableOrUnknown(
              data['media_relation_cross_ref_relation_media_id']!,
              _relationIdMeta));
    } else if (isInserting) {
      context.missing(_relationIdMeta);
    }
    if (data.containsKey('media_staff_cross_ref_relation_type')) {
      context.handle(
          _relationTypeMeta,
          relationType.isAcceptableOrUnknown(
              data['media_staff_cross_ref_relation_type']!, _relationTypeMeta));
    } else if (isInserting) {
      context.missing(_relationTypeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ownerId, relationId};
  @override
  MediaRelationCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaRelationCrossRefEntity(
      ownerId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_relation_cross_ref_owner_media_id'])!,
      relationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data[
              '${effectivePrefix}media_relation_cross_ref_relation_media_id'])!,
      relationType: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_staff_cross_ref_relation_type'])!,
    );
  }

  @override
  $MediaRelationCrossRefTableTable createAlias(String alias) {
    return $MediaRelationCrossRefTableTable(attachedDatabase, alias);
  }
}

class MediaRelationCrossRefEntity extends DataClass
    implements Insertable<MediaRelationCrossRefEntity> {
  final String ownerId;
  final String relationId;
  final String relationType;
  const MediaRelationCrossRefEntity(
      {required this.ownerId,
      required this.relationId,
      required this.relationType});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_relation_cross_ref_owner_media_id'] = Variable<String>(ownerId);
    map['media_relation_cross_ref_relation_media_id'] =
        Variable<String>(relationId);
    map['media_staff_cross_ref_relation_type'] = Variable<String>(relationType);
    return map;
  }

  MediaRelationCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return MediaRelationCrossRefTableCompanion(
      ownerId: Value(ownerId),
      relationId: Value(relationId),
      relationType: Value(relationType),
    );
  }

  factory MediaRelationCrossRefEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaRelationCrossRefEntity(
      ownerId: serializer.fromJson<String>(json['ownerId']),
      relationId: serializer.fromJson<String>(json['relationId']),
      relationType: serializer.fromJson<String>(json['relationType']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ownerId': serializer.toJson<String>(ownerId),
      'relationId': serializer.toJson<String>(relationId),
      'relationType': serializer.toJson<String>(relationType),
    };
  }

  MediaRelationCrossRefEntity copyWith(
          {String? ownerId, String? relationId, String? relationType}) =>
      MediaRelationCrossRefEntity(
        ownerId: ownerId ?? this.ownerId,
        relationId: relationId ?? this.relationId,
        relationType: relationType ?? this.relationType,
      );
  MediaRelationCrossRefEntity copyWithCompanion(
      MediaRelationCrossRefTableCompanion data) {
    return MediaRelationCrossRefEntity(
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      relationId:
          data.relationId.present ? data.relationId.value : this.relationId,
      relationType: data.relationType.present
          ? data.relationType.value
          : this.relationType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaRelationCrossRefEntity(')
          ..write('ownerId: $ownerId, ')
          ..write('relationId: $relationId, ')
          ..write('relationType: $relationType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ownerId, relationId, relationType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaRelationCrossRefEntity &&
          other.ownerId == this.ownerId &&
          other.relationId == this.relationId &&
          other.relationType == this.relationType);
}

class MediaRelationCrossRefTableCompanion
    extends UpdateCompanion<MediaRelationCrossRefEntity> {
  final Value<String> ownerId;
  final Value<String> relationId;
  final Value<String> relationType;
  final Value<int> rowid;
  const MediaRelationCrossRefTableCompanion({
    this.ownerId = const Value.absent(),
    this.relationId = const Value.absent(),
    this.relationType = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaRelationCrossRefTableCompanion.insert({
    required String ownerId,
    required String relationId,
    required String relationType,
    this.rowid = const Value.absent(),
  })  : ownerId = Value(ownerId),
        relationId = Value(relationId),
        relationType = Value(relationType);
  static Insertable<MediaRelationCrossRefEntity> custom({
    Expression<String>? ownerId,
    Expression<String>? relationId,
    Expression<String>? relationType,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ownerId != null) 'media_relation_cross_ref_owner_media_id': ownerId,
      if (relationId != null)
        'media_relation_cross_ref_relation_media_id': relationId,
      if (relationType != null)
        'media_staff_cross_ref_relation_type': relationType,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaRelationCrossRefTableCompanion copyWith(
      {Value<String>? ownerId,
      Value<String>? relationId,
      Value<String>? relationType,
      Value<int>? rowid}) {
    return MediaRelationCrossRefTableCompanion(
      ownerId: ownerId ?? this.ownerId,
      relationId: relationId ?? this.relationId,
      relationType: relationType ?? this.relationType,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ownerId.present) {
      map['media_relation_cross_ref_owner_media_id'] =
          Variable<String>(ownerId.value);
    }
    if (relationId.present) {
      map['media_relation_cross_ref_relation_media_id'] =
          Variable<String>(relationId.value);
    }
    if (relationType.present) {
      map['media_staff_cross_ref_relation_type'] =
          Variable<String>(relationType.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaRelationCrossRefTableCompanion(')
          ..write('ownerId: $ownerId, ')
          ..write('relationId: $relationId, ')
          ..write('relationType: $relationType, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaStaffPagingCrossRefTableTable extends MediaStaffPagingCrossRefTable
    with
        TableInfo<$MediaStaffPagingCrossRefTableTable,
            MediaStaffPagingCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaStaffPagingCrossRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _staffIdMeta =
      const VerificationMeta('staffId');
  @override
  late final GeneratedColumn<String> staffId = GeneratedColumn<String>(
      'media_staff_cross_staff_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'media_staff_cross_anime_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _staffRoleMeta =
      const VerificationMeta('staffRole');
  @override
  late final GeneratedColumn<String> staffRole = GeneratedColumn<String>(
      'media_staff_cross_staff_role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeStampMeta =
      const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'media_staff_cross_timeStamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [staffId, mediaId, staffRole, timeStamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_staff_paging_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MediaStaffPagingCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('media_staff_cross_staff_id')) {
      context.handle(
          _staffIdMeta,
          staffId.isAcceptableOrUnknown(
              data['media_staff_cross_staff_id']!, _staffIdMeta));
    } else if (isInserting) {
      context.missing(_staffIdMeta);
    }
    if (data.containsKey('media_staff_cross_anime_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['media_staff_cross_anime_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('media_staff_cross_staff_role')) {
      context.handle(
          _staffRoleMeta,
          staffRole.isAcceptableOrUnknown(
              data['media_staff_cross_staff_role']!, _staffRoleMeta));
    } else if (isInserting) {
      context.missing(_staffRoleMeta);
    }
    if (data.containsKey('media_staff_cross_timeStamp')) {
      context.handle(
          _timeStampMeta,
          timeStamp.isAcceptableOrUnknown(
              data['media_staff_cross_timeStamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {staffId, mediaId};
  @override
  MediaStaffPagingCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaStaffPagingCrossRefEntity(
      staffId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_staff_cross_staff_id'])!,
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_staff_cross_anime_id'])!,
      staffRole: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}media_staff_cross_staff_role'])!,
      timeStamp: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}media_staff_cross_timeStamp'])!,
    );
  }

  @override
  $MediaStaffPagingCrossRefTableTable createAlias(String alias) {
    return $MediaStaffPagingCrossRefTableTable(attachedDatabase, alias);
  }
}

class MediaStaffPagingCrossRefEntity extends DataClass
    implements Insertable<MediaStaffPagingCrossRefEntity> {
  final String staffId;
  final String mediaId;
  final String staffRole;
  final int timeStamp;
  const MediaStaffPagingCrossRefEntity(
      {required this.staffId,
      required this.mediaId,
      required this.staffRole,
      required this.timeStamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['media_staff_cross_staff_id'] = Variable<String>(staffId);
    map['media_staff_cross_anime_id'] = Variable<String>(mediaId);
    map['media_staff_cross_staff_role'] = Variable<String>(staffRole);
    map['media_staff_cross_timeStamp'] = Variable<int>(timeStamp);
    return map;
  }

  MediaStaffPagingCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return MediaStaffPagingCrossRefTableCompanion(
      staffId: Value(staffId),
      mediaId: Value(mediaId),
      staffRole: Value(staffRole),
      timeStamp: Value(timeStamp),
    );
  }

  factory MediaStaffPagingCrossRefEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaStaffPagingCrossRefEntity(
      staffId: serializer.fromJson<String>(json['staffId']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      staffRole: serializer.fromJson<String>(json['staffRole']),
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'staffId': serializer.toJson<String>(staffId),
      'mediaId': serializer.toJson<String>(mediaId),
      'staffRole': serializer.toJson<String>(staffRole),
      'timeStamp': serializer.toJson<int>(timeStamp),
    };
  }

  MediaStaffPagingCrossRefEntity copyWith(
          {String? staffId,
          String? mediaId,
          String? staffRole,
          int? timeStamp}) =>
      MediaStaffPagingCrossRefEntity(
        staffId: staffId ?? this.staffId,
        mediaId: mediaId ?? this.mediaId,
        staffRole: staffRole ?? this.staffRole,
        timeStamp: timeStamp ?? this.timeStamp,
      );
  MediaStaffPagingCrossRefEntity copyWithCompanion(
      MediaStaffPagingCrossRefTableCompanion data) {
    return MediaStaffPagingCrossRefEntity(
      staffId: data.staffId.present ? data.staffId.value : this.staffId,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      staffRole: data.staffRole.present ? data.staffRole.value : this.staffRole,
      timeStamp: data.timeStamp.present ? data.timeStamp.value : this.timeStamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaStaffPagingCrossRefEntity(')
          ..write('staffId: $staffId, ')
          ..write('mediaId: $mediaId, ')
          ..write('staffRole: $staffRole, ')
          ..write('timeStamp: $timeStamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(staffId, mediaId, staffRole, timeStamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaStaffPagingCrossRefEntity &&
          other.staffId == this.staffId &&
          other.mediaId == this.mediaId &&
          other.staffRole == this.staffRole &&
          other.timeStamp == this.timeStamp);
}

class MediaStaffPagingCrossRefTableCompanion
    extends UpdateCompanion<MediaStaffPagingCrossRefEntity> {
  final Value<String> staffId;
  final Value<String> mediaId;
  final Value<String> staffRole;
  final Value<int> timeStamp;
  final Value<int> rowid;
  const MediaStaffPagingCrossRefTableCompanion({
    this.staffId = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.staffRole = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaStaffPagingCrossRefTableCompanion.insert({
    required String staffId,
    required String mediaId,
    required String staffRole,
    required int timeStamp,
    this.rowid = const Value.absent(),
  })  : staffId = Value(staffId),
        mediaId = Value(mediaId),
        staffRole = Value(staffRole),
        timeStamp = Value(timeStamp);
  static Insertable<MediaStaffPagingCrossRefEntity> custom({
    Expression<String>? staffId,
    Expression<String>? mediaId,
    Expression<String>? staffRole,
    Expression<int>? timeStamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (staffId != null) 'media_staff_cross_staff_id': staffId,
      if (mediaId != null) 'media_staff_cross_anime_id': mediaId,
      if (staffRole != null) 'media_staff_cross_staff_role': staffRole,
      if (timeStamp != null) 'media_staff_cross_timeStamp': timeStamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaStaffPagingCrossRefTableCompanion copyWith(
      {Value<String>? staffId,
      Value<String>? mediaId,
      Value<String>? staffRole,
      Value<int>? timeStamp,
      Value<int>? rowid}) {
    return MediaStaffPagingCrossRefTableCompanion(
      staffId: staffId ?? this.staffId,
      mediaId: mediaId ?? this.mediaId,
      staffRole: staffRole ?? this.staffRole,
      timeStamp: timeStamp ?? this.timeStamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (staffId.present) {
      map['media_staff_cross_staff_id'] = Variable<String>(staffId.value);
    }
    if (mediaId.present) {
      map['media_staff_cross_anime_id'] = Variable<String>(mediaId.value);
    }
    if (staffRole.present) {
      map['media_staff_cross_staff_role'] = Variable<String>(staffRole.value);
    }
    if (timeStamp.present) {
      map['media_staff_cross_timeStamp'] = Variable<int>(timeStamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaStaffPagingCrossRefTableCompanion(')
          ..write('staffId: $staffId, ')
          ..write('mediaId: $mediaId, ')
          ..write('staffRole: $staffRole, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MediaExternalLinkTableTable extends MediaExternalLinkTable
    with TableInfo<$MediaExternalLinkTableTable, MediaExternalLinkEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaExternalLinkTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'external_link_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'external_link_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'external_link_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteMeta = const VerificationMeta('site');
  @override
  late final GeneratedColumn<String> site = GeneratedColumn<String>(
      'external_link_site', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'external_link_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siteIdMeta = const VerificationMeta('siteId');
  @override
  late final GeneratedColumn<int> siteId = GeneratedColumn<int>(
      'external_link_siteId', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'external_link_color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'external_link_icon', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mediaId, url, site, type, siteId, color, icon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_external_link_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MediaExternalLinkEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('external_link_id')) {
      context.handle(_idMeta,
          id.isAcceptableOrUnknown(data['external_link_id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('external_link_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['external_link_media_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('external_link_url')) {
      context.handle(_urlMeta,
          url.isAcceptableOrUnknown(data['external_link_url']!, _urlMeta));
    }
    if (data.containsKey('external_link_site')) {
      context.handle(_siteMeta,
          site.isAcceptableOrUnknown(data['external_link_site']!, _siteMeta));
    }
    if (data.containsKey('external_link_type')) {
      context.handle(_typeMeta,
          type.isAcceptableOrUnknown(data['external_link_type']!, _typeMeta));
    }
    if (data.containsKey('external_link_siteId')) {
      context.handle(
          _siteIdMeta,
          siteId.isAcceptableOrUnknown(
              data['external_link_siteId']!, _siteIdMeta));
    }
    if (data.containsKey('external_link_color')) {
      context.handle(
          _colorMeta,
          color.isAcceptableOrUnknown(
              data['external_link_color']!, _colorMeta));
    }
    if (data.containsKey('external_link_icon')) {
      context.handle(_iconMeta,
          icon.isAcceptableOrUnknown(data['external_link_icon']!, _iconMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MediaExternalLinkEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaExternalLinkEntity(
      id: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_link_id'])!,
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}external_link_media_id'])!,
      url: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_link_url']),
      site: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_link_site']),
      type: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_link_type']),
      siteId: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}external_link_siteId']),
      color: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_link_color']),
      icon: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}external_link_icon']),
    );
  }

  @override
  $MediaExternalLinkTableTable createAlias(String alias) {
    return $MediaExternalLinkTableTable(attachedDatabase, alias);
  }
}

class MediaExternalLinkEntity extends DataClass
    implements Insertable<MediaExternalLinkEntity> {
  final String id;
  final String mediaId;
  final String? url;
  final String? site;
  final String? type;
  final int? siteId;
  final String? color;
  final String? icon;
  const MediaExternalLinkEntity(
      {required this.id,
      required this.mediaId,
      this.url,
      this.site,
      this.type,
      this.siteId,
      this.color,
      this.icon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['external_link_id'] = Variable<String>(id);
    map['external_link_media_id'] = Variable<String>(mediaId);
    if (!nullToAbsent || url != null) {
      map['external_link_url'] = Variable<String>(url);
    }
    if (!nullToAbsent || site != null) {
      map['external_link_site'] = Variable<String>(site);
    }
    if (!nullToAbsent || type != null) {
      map['external_link_type'] = Variable<String>(type);
    }
    if (!nullToAbsent || siteId != null) {
      map['external_link_siteId'] = Variable<int>(siteId);
    }
    if (!nullToAbsent || color != null) {
      map['external_link_color'] = Variable<String>(color);
    }
    if (!nullToAbsent || icon != null) {
      map['external_link_icon'] = Variable<String>(icon);
    }
    return map;
  }

  MediaExternalLinkTableCompanion toCompanion(bool nullToAbsent) {
    return MediaExternalLinkTableCompanion(
      id: Value(id),
      mediaId: Value(mediaId),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      site: site == null && nullToAbsent ? const Value.absent() : Value(site),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      siteId:
          siteId == null && nullToAbsent ? const Value.absent() : Value(siteId),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
    );
  }

  factory MediaExternalLinkEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaExternalLinkEntity(
      id: serializer.fromJson<String>(json['id']),
      mediaId: serializer.fromJson<String>(json['mediaId']),
      url: serializer.fromJson<String?>(json['url']),
      site: serializer.fromJson<String?>(json['site']),
      type: serializer.fromJson<String?>(json['type']),
      siteId: serializer.fromJson<int?>(json['siteId']),
      color: serializer.fromJson<String?>(json['color']),
      icon: serializer.fromJson<String?>(json['icon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mediaId': serializer.toJson<String>(mediaId),
      'url': serializer.toJson<String?>(url),
      'site': serializer.toJson<String?>(site),
      'type': serializer.toJson<String?>(type),
      'siteId': serializer.toJson<int?>(siteId),
      'color': serializer.toJson<String?>(color),
      'icon': serializer.toJson<String?>(icon),
    };
  }

  MediaExternalLinkEntity copyWith(
          {String? id,
          String? mediaId,
          Value<String?> url = const Value.absent(),
          Value<String?> site = const Value.absent(),
          Value<String?> type = const Value.absent(),
          Value<int?> siteId = const Value.absent(),
          Value<String?> color = const Value.absent(),
          Value<String?> icon = const Value.absent()}) =>
      MediaExternalLinkEntity(
        id: id ?? this.id,
        mediaId: mediaId ?? this.mediaId,
        url: url.present ? url.value : this.url,
        site: site.present ? site.value : this.site,
        type: type.present ? type.value : this.type,
        siteId: siteId.present ? siteId.value : this.siteId,
        color: color.present ? color.value : this.color,
        icon: icon.present ? icon.value : this.icon,
      );
  MediaExternalLinkEntity copyWithCompanion(
      MediaExternalLinkTableCompanion data) {
    return MediaExternalLinkEntity(
      id: data.id.present ? data.id.value : this.id,
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      url: data.url.present ? data.url.value : this.url,
      site: data.site.present ? data.site.value : this.site,
      type: data.type.present ? data.type.value : this.type,
      siteId: data.siteId.present ? data.siteId.value : this.siteId,
      color: data.color.present ? data.color.value : this.color,
      icon: data.icon.present ? data.icon.value : this.icon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaExternalLinkEntity(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('url: $url, ')
          ..write('site: $site, ')
          ..write('type: $type, ')
          ..write('siteId: $siteId, ')
          ..write('color: $color, ')
          ..write('icon: $icon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mediaId, url, site, type, siteId, color, icon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaExternalLinkEntity &&
          other.id == this.id &&
          other.mediaId == this.mediaId &&
          other.url == this.url &&
          other.site == this.site &&
          other.type == this.type &&
          other.siteId == this.siteId &&
          other.color == this.color &&
          other.icon == this.icon);
}

class MediaExternalLinkTableCompanion
    extends UpdateCompanion<MediaExternalLinkEntity> {
  final Value<String> id;
  final Value<String> mediaId;
  final Value<String?> url;
  final Value<String?> site;
  final Value<String?> type;
  final Value<int?> siteId;
  final Value<String?> color;
  final Value<String?> icon;
  final Value<int> rowid;
  const MediaExternalLinkTableCompanion({
    this.id = const Value.absent(),
    this.mediaId = const Value.absent(),
    this.url = const Value.absent(),
    this.site = const Value.absent(),
    this.type = const Value.absent(),
    this.siteId = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaExternalLinkTableCompanion.insert({
    required String id,
    required String mediaId,
    this.url = const Value.absent(),
    this.site = const Value.absent(),
    this.type = const Value.absent(),
    this.siteId = const Value.absent(),
    this.color = const Value.absent(),
    this.icon = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mediaId = Value(mediaId);
  static Insertable<MediaExternalLinkEntity> custom({
    Expression<String>? id,
    Expression<String>? mediaId,
    Expression<String>? url,
    Expression<String>? site,
    Expression<String>? type,
    Expression<int>? siteId,
    Expression<String>? color,
    Expression<String>? icon,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'external_link_id': id,
      if (mediaId != null) 'external_link_media_id': mediaId,
      if (url != null) 'external_link_url': url,
      if (site != null) 'external_link_site': site,
      if (type != null) 'external_link_type': type,
      if (siteId != null) 'external_link_siteId': siteId,
      if (color != null) 'external_link_color': color,
      if (icon != null) 'external_link_icon': icon,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaExternalLinkTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? mediaId,
      Value<String?>? url,
      Value<String?>? site,
      Value<String?>? type,
      Value<int?>? siteId,
      Value<String?>? color,
      Value<String?>? icon,
      Value<int>? rowid}) {
    return MediaExternalLinkTableCompanion(
      id: id ?? this.id,
      mediaId: mediaId ?? this.mediaId,
      url: url ?? this.url,
      site: site ?? this.site,
      type: type ?? this.type,
      siteId: siteId ?? this.siteId,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['external_link_id'] = Variable<String>(id.value);
    }
    if (mediaId.present) {
      map['external_link_media_id'] = Variable<String>(mediaId.value);
    }
    if (url.present) {
      map['external_link_url'] = Variable<String>(url.value);
    }
    if (site.present) {
      map['external_link_site'] = Variable<String>(site.value);
    }
    if (type.present) {
      map['external_link_type'] = Variable<String>(type.value);
    }
    if (siteId.present) {
      map['external_link_siteId'] = Variable<int>(siteId.value);
    }
    if (color.present) {
      map['external_link_color'] = Variable<String>(color.value);
    }
    if (icon.present) {
      map['external_link_icon'] = Variable<String>(icon.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaExternalLinkTableCompanion(')
          ..write('id: $id, ')
          ..write('mediaId: $mediaId, ')
          ..write('url: $url, ')
          ..write('site: $site, ')
          ..write('type: $type, ')
          ..write('siteId: $siteId, ')
          ..write('color: $color, ')
          ..write('icon: $icon, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CategoryMediaPagingCrossRefTableTable
    extends CategoryMediaPagingCrossRefTable
    with
        TableInfo<$CategoryMediaPagingCrossRefTableTable,
            CategoryMediaPagingCrossRefEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryMediaPagingCrossRefTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'anime_category_cross_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'anime_category_cross_category_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _timeStampMeta =
      const VerificationMeta('timeStamp');
  @override
  late final GeneratedColumn<int> timeStamp = GeneratedColumn<int>(
      'anime_category_cross_time_stamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [mediaId, category, timeStamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_media_paging_cross_ref_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoryMediaPagingCrossRefEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('anime_category_cross_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['anime_category_cross_media_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('anime_category_cross_category_id')) {
      context.handle(
          _categoryMeta,
          category.isAcceptableOrUnknown(
              data['anime_category_cross_category_id']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('anime_category_cross_time_stamp')) {
      context.handle(
          _timeStampMeta,
          timeStamp.isAcceptableOrUnknown(
              data['anime_category_cross_time_stamp']!, _timeStampMeta));
    } else if (isInserting) {
      context.missing(_timeStampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {category, mediaId};
  @override
  CategoryMediaPagingCrossRefEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryMediaPagingCrossRefEntity(
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}anime_category_cross_media_id'])!,
      category: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}anime_category_cross_category_id'])!,
      timeStamp: attachedDatabase.typeMapping.read(DriftSqlType.int,
          data['${effectivePrefix}anime_category_cross_time_stamp'])!,
    );
  }

  @override
  $CategoryMediaPagingCrossRefTableTable createAlias(String alias) {
    return $CategoryMediaPagingCrossRefTableTable(attachedDatabase, alias);
  }
}

class CategoryMediaPagingCrossRefEntity extends DataClass
    implements Insertable<CategoryMediaPagingCrossRefEntity> {
  final String mediaId;
  final String category;
  final int timeStamp;
  const CategoryMediaPagingCrossRefEntity(
      {required this.mediaId, required this.category, required this.timeStamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['anime_category_cross_media_id'] = Variable<String>(mediaId);
    map['anime_category_cross_category_id'] = Variable<String>(category);
    map['anime_category_cross_time_stamp'] = Variable<int>(timeStamp);
    return map;
  }

  CategoryMediaPagingCrossRefTableCompanion toCompanion(bool nullToAbsent) {
    return CategoryMediaPagingCrossRefTableCompanion(
      mediaId: Value(mediaId),
      category: Value(category),
      timeStamp: Value(timeStamp),
    );
  }

  factory CategoryMediaPagingCrossRefEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryMediaPagingCrossRefEntity(
      mediaId: serializer.fromJson<String>(json['mediaId']),
      category: serializer.fromJson<String>(json['category']),
      timeStamp: serializer.fromJson<int>(json['timeStamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mediaId': serializer.toJson<String>(mediaId),
      'category': serializer.toJson<String>(category),
      'timeStamp': serializer.toJson<int>(timeStamp),
    };
  }

  CategoryMediaPagingCrossRefEntity copyWith(
          {String? mediaId, String? category, int? timeStamp}) =>
      CategoryMediaPagingCrossRefEntity(
        mediaId: mediaId ?? this.mediaId,
        category: category ?? this.category,
        timeStamp: timeStamp ?? this.timeStamp,
      );
  CategoryMediaPagingCrossRefEntity copyWithCompanion(
      CategoryMediaPagingCrossRefTableCompanion data) {
    return CategoryMediaPagingCrossRefEntity(
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      category: data.category.present ? data.category.value : this.category,
      timeStamp: data.timeStamp.present ? data.timeStamp.value : this.timeStamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryMediaPagingCrossRefEntity(')
          ..write('mediaId: $mediaId, ')
          ..write('category: $category, ')
          ..write('timeStamp: $timeStamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mediaId, category, timeStamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryMediaPagingCrossRefEntity &&
          other.mediaId == this.mediaId &&
          other.category == this.category &&
          other.timeStamp == this.timeStamp);
}

class CategoryMediaPagingCrossRefTableCompanion
    extends UpdateCompanion<CategoryMediaPagingCrossRefEntity> {
  final Value<String> mediaId;
  final Value<String> category;
  final Value<int> timeStamp;
  final Value<int> rowid;
  const CategoryMediaPagingCrossRefTableCompanion({
    this.mediaId = const Value.absent(),
    this.category = const Value.absent(),
    this.timeStamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryMediaPagingCrossRefTableCompanion.insert({
    required String mediaId,
    required String category,
    required int timeStamp,
    this.rowid = const Value.absent(),
  })  : mediaId = Value(mediaId),
        category = Value(category),
        timeStamp = Value(timeStamp);
  static Insertable<CategoryMediaPagingCrossRefEntity> custom({
    Expression<String>? mediaId,
    Expression<String>? category,
    Expression<int>? timeStamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mediaId != null) 'anime_category_cross_media_id': mediaId,
      if (category != null) 'anime_category_cross_category_id': category,
      if (timeStamp != null) 'anime_category_cross_time_stamp': timeStamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryMediaPagingCrossRefTableCompanion copyWith(
      {Value<String>? mediaId,
      Value<String>? category,
      Value<int>? timeStamp,
      Value<int>? rowid}) {
    return CategoryMediaPagingCrossRefTableCompanion(
      mediaId: mediaId ?? this.mediaId,
      category: category ?? this.category,
      timeStamp: timeStamp ?? this.timeStamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mediaId.present) {
      map['anime_category_cross_media_id'] = Variable<String>(mediaId.value);
    }
    if (category.present) {
      map['anime_category_cross_category_id'] =
          Variable<String>(category.value);
    }
    if (timeStamp.present) {
      map['anime_category_cross_time_stamp'] = Variable<int>(timeStamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryMediaPagingCrossRefTableCompanion(')
          ..write('mediaId: $mediaId, ')
          ..write('category: $category, ')
          ..write('timeStamp: $timeStamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoriteInfoTableTable extends FavoriteInfoTable
    with TableInfo<$FavoriteInfoTableTable, FavoriteInfoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'favorite_info_id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _favoriteTypeMeta =
      const VerificationMeta('favoriteType');
  @override
  late final GeneratedColumn<String> favoriteType = GeneratedColumn<String>(
      'favorite_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _infoIdMeta = const VerificationMeta('infoId');
  @override
  late final GeneratedColumn<String> infoId = GeneratedColumn<String>(
      'favorite_info_foreign_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'favorite_user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, favoriteType, infoId, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_info_table';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteInfoEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('favorite_info_id')) {
      context.handle(_idMeta,
          id.isAcceptableOrUnknown(data['favorite_info_id']!, _idMeta));
    }
    if (data.containsKey('favorite_type')) {
      context.handle(
          _favoriteTypeMeta,
          favoriteType.isAcceptableOrUnknown(
              data['favorite_type']!, _favoriteTypeMeta));
    } else if (isInserting) {
      context.missing(_favoriteTypeMeta);
    }
    if (data.containsKey('favorite_info_foreign_id')) {
      context.handle(
          _infoIdMeta,
          infoId.isAcceptableOrUnknown(
              data['favorite_info_foreign_id']!, _infoIdMeta));
    } else if (isInserting) {
      context.missing(_infoIdMeta);
    }
    if (data.containsKey('favorite_user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['favorite_user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteInfoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteInfoEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}favorite_info_id'])!,
      favoriteType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}favorite_type'])!,
      infoId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}favorite_info_foreign_id'])!,
      userId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}favorite_user_id'])!,
    );
  }

  @override
  $FavoriteInfoTableTable createAlias(String alias) {
    return $FavoriteInfoTableTable(attachedDatabase, alias);
  }
}

class FavoriteInfoEntity extends DataClass
    implements Insertable<FavoriteInfoEntity> {
  final int id;
  final String favoriteType;
  final String infoId;
  final String userId;
  const FavoriteInfoEntity(
      {required this.id,
      required this.favoriteType,
      required this.infoId,
      required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['favorite_info_id'] = Variable<int>(id);
    map['favorite_type'] = Variable<String>(favoriteType);
    map['favorite_info_foreign_id'] = Variable<String>(infoId);
    map['favorite_user_id'] = Variable<String>(userId);
    return map;
  }

  FavoriteInfoTableCompanion toCompanion(bool nullToAbsent) {
    return FavoriteInfoTableCompanion(
      id: Value(id),
      favoriteType: Value(favoriteType),
      infoId: Value(infoId),
      userId: Value(userId),
    );
  }

  factory FavoriteInfoEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FavoriteInfoEntity(
      id: serializer.fromJson<int>(json['id']),
      favoriteType: serializer.fromJson<String>(json['favoriteType']),
      infoId: serializer.fromJson<String>(json['infoId']),
      userId: serializer.fromJson<String>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'favoriteType': serializer.toJson<String>(favoriteType),
      'infoId': serializer.toJson<String>(infoId),
      'userId': serializer.toJson<String>(userId),
    };
  }

  FavoriteInfoEntity copyWith(
          {int? id, String? favoriteType, String? infoId, String? userId}) =>
      FavoriteInfoEntity(
        id: id ?? this.id,
        favoriteType: favoriteType ?? this.favoriteType,
        infoId: infoId ?? this.infoId,
        userId: userId ?? this.userId,
      );
  FavoriteInfoEntity copyWithCompanion(FavoriteInfoTableCompanion data) {
    return FavoriteInfoEntity(
      id: data.id.present ? data.id.value : this.id,
      favoriteType: data.favoriteType.present
          ? data.favoriteType.value
          : this.favoriteType,
      infoId: data.infoId.present ? data.infoId.value : this.infoId,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteInfoEntity(')
          ..write('id: $id, ')
          ..write('favoriteType: $favoriteType, ')
          ..write('infoId: $infoId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, favoriteType, infoId, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FavoriteInfoEntity &&
          other.id == this.id &&
          other.favoriteType == this.favoriteType &&
          other.infoId == this.infoId &&
          other.userId == this.userId);
}

class FavoriteInfoTableCompanion extends UpdateCompanion<FavoriteInfoEntity> {
  final Value<int> id;
  final Value<String> favoriteType;
  final Value<String> infoId;
  final Value<String> userId;
  const FavoriteInfoTableCompanion({
    this.id = const Value.absent(),
    this.favoriteType = const Value.absent(),
    this.infoId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  FavoriteInfoTableCompanion.insert({
    this.id = const Value.absent(),
    required String favoriteType,
    required String infoId,
    required String userId,
  })  : favoriteType = Value(favoriteType),
        infoId = Value(infoId),
        userId = Value(userId);
  static Insertable<FavoriteInfoEntity> custom({
    Expression<int>? id,
    Expression<String>? favoriteType,
    Expression<String>? infoId,
    Expression<String>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'favorite_info_id': id,
      if (favoriteType != null) 'favorite_type': favoriteType,
      if (infoId != null) 'favorite_info_foreign_id': infoId,
      if (userId != null) 'favorite_user_id': userId,
    });
  }

  FavoriteInfoTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? favoriteType,
      Value<String>? infoId,
      Value<String>? userId}) {
    return FavoriteInfoTableCompanion(
      id: id ?? this.id,
      favoriteType: favoriteType ?? this.favoriteType,
      infoId: infoId ?? this.infoId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['favorite_info_id'] = Variable<int>(id.value);
    }
    if (favoriteType.present) {
      map['favorite_type'] = Variable<String>(favoriteType.value);
    }
    if (infoId.present) {
      map['favorite_info_foreign_id'] = Variable<String>(infoId.value);
    }
    if (userId.present) {
      map['favorite_user_id'] = Variable<String>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteInfoTableCompanion(')
          ..write('id: $id, ')
          ..write('favoriteType: $favoriteType, ')
          ..write('infoId: $infoId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $EpisodeTableTable extends EpisodeTable
    with TableInfo<$EpisodeTableTable, EpisodeEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EpisodeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'episode_id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _animeIdMeta =
      const VerificationMeta('animeId');
  @override
  late final GeneratedColumn<String> animeId = GeneratedColumn<String>(
      'episode_anime_cross_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'episode_title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _episodeNumMeta =
      const VerificationMeta('episodeNum');
  @override
  late final GeneratedColumn<String> episodeNum = GeneratedColumn<String>(
      'episode_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playSourceTypeMeta =
      const VerificationMeta('playSourceType');
  @override
  late final GeneratedColumn<String> playSourceType = GeneratedColumn<String>(
      'episode_play_source_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playSourceIdMeta =
      const VerificationMeta('playSourceId');
  @override
  late final GeneratedColumn<String> playSourceId = GeneratedColumn<String>(
      'episode_play_source_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playSourceSiteUrlMeta =
      const VerificationMeta('playSourceSiteUrl');
  @override
  late final GeneratedColumn<String> playSourceSiteUrl =
      GeneratedColumn<String>(
          'episode_play_source_site_url', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _playableLinkMeta =
      const VerificationMeta('playableLink');
  @override
  late final GeneratedColumn<String> playableLink = GeneratedColumn<String>(
      'episode_site_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        animeId,
        title,
        episodeNum,
        playSourceType,
        playSourceId,
        playSourceSiteUrl,
        playableLink
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'episode_table';
  @override
  VerificationContext validateIntegrity(Insertable<EpisodeEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('episode_id')) {
      context.handle(
          _idMeta, id.isAcceptableOrUnknown(data['episode_id']!, _idMeta));
    }
    if (data.containsKey('episode_anime_cross_id')) {
      context.handle(
          _animeIdMeta,
          animeId.isAcceptableOrUnknown(
              data['episode_anime_cross_id']!, _animeIdMeta));
    } else if (isInserting) {
      context.missing(_animeIdMeta);
    }
    if (data.containsKey('episode_title')) {
      context.handle(_titleMeta,
          title.isAcceptableOrUnknown(data['episode_title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('episode_number')) {
      context.handle(
          _episodeNumMeta,
          episodeNum.isAcceptableOrUnknown(
              data['episode_number']!, _episodeNumMeta));
    } else if (isInserting) {
      context.missing(_episodeNumMeta);
    }
    if (data.containsKey('episode_play_source_type')) {
      context.handle(
          _playSourceTypeMeta,
          playSourceType.isAcceptableOrUnknown(
              data['episode_play_source_type']!, _playSourceTypeMeta));
    } else if (isInserting) {
      context.missing(_playSourceTypeMeta);
    }
    if (data.containsKey('episode_play_source_id')) {
      context.handle(
          _playSourceIdMeta,
          playSourceId.isAcceptableOrUnknown(
              data['episode_play_source_id']!, _playSourceIdMeta));
    } else if (isInserting) {
      context.missing(_playSourceIdMeta);
    }
    if (data.containsKey('episode_play_source_site_url')) {
      context.handle(
          _playSourceSiteUrlMeta,
          playSourceSiteUrl.isAcceptableOrUnknown(
              data['episode_play_source_site_url']!, _playSourceSiteUrlMeta));
    } else if (isInserting) {
      context.missing(_playSourceSiteUrlMeta);
    }
    if (data.containsKey('episode_site_url')) {
      context.handle(
          _playableLinkMeta,
          playableLink.isAcceptableOrUnknown(
              data['episode_site_url']!, _playableLinkMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EpisodeEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EpisodeEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}episode_id']),
      animeId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}episode_anime_cross_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}episode_title'])!,
      episodeNum: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}episode_number'])!,
      playSourceType: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}episode_play_source_type'])!,
      playSourceId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}episode_play_source_id'])!,
      playSourceSiteUrl: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}episode_play_source_site_url'])!,
      playableLink: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}episode_site_url']),
    );
  }

  @override
  $EpisodeTableTable createAlias(String alias) {
    return $EpisodeTableTable(attachedDatabase, alias);
  }
}

class EpisodeEntity extends DataClass implements Insertable<EpisodeEntity> {
  final int? id;
  final String animeId;
  final String title;
  final String episodeNum;
  final String playSourceType;
  final String playSourceId;
  final String playSourceSiteUrl;
  final String? playableLink;
  const EpisodeEntity(
      {this.id,
      required this.animeId,
      required this.title,
      required this.episodeNum,
      required this.playSourceType,
      required this.playSourceId,
      required this.playSourceSiteUrl,
      this.playableLink});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['episode_id'] = Variable<int>(id);
    }
    map['episode_anime_cross_id'] = Variable<String>(animeId);
    map['episode_title'] = Variable<String>(title);
    map['episode_number'] = Variable<String>(episodeNum);
    map['episode_play_source_type'] = Variable<String>(playSourceType);
    map['episode_play_source_id'] = Variable<String>(playSourceId);
    map['episode_play_source_site_url'] = Variable<String>(playSourceSiteUrl);
    if (!nullToAbsent || playableLink != null) {
      map['episode_site_url'] = Variable<String>(playableLink);
    }
    return map;
  }

  EpisodeTableCompanion toCompanion(bool nullToAbsent) {
    return EpisodeTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      animeId: Value(animeId),
      title: Value(title),
      episodeNum: Value(episodeNum),
      playSourceType: Value(playSourceType),
      playSourceId: Value(playSourceId),
      playSourceSiteUrl: Value(playSourceSiteUrl),
      playableLink: playableLink == null && nullToAbsent
          ? const Value.absent()
          : Value(playableLink),
    );
  }

  factory EpisodeEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EpisodeEntity(
      id: serializer.fromJson<int?>(json['id']),
      animeId: serializer.fromJson<String>(json['animeId']),
      title: serializer.fromJson<String>(json['title']),
      episodeNum: serializer.fromJson<String>(json['episodeNum']),
      playSourceType: serializer.fromJson<String>(json['playSourceType']),
      playSourceId: serializer.fromJson<String>(json['playSourceId']),
      playSourceSiteUrl: serializer.fromJson<String>(json['playSourceSiteUrl']),
      playableLink: serializer.fromJson<String?>(json['playableLink']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'animeId': serializer.toJson<String>(animeId),
      'title': serializer.toJson<String>(title),
      'episodeNum': serializer.toJson<String>(episodeNum),
      'playSourceType': serializer.toJson<String>(playSourceType),
      'playSourceId': serializer.toJson<String>(playSourceId),
      'playSourceSiteUrl': serializer.toJson<String>(playSourceSiteUrl),
      'playableLink': serializer.toJson<String?>(playableLink),
    };
  }

  EpisodeEntity copyWith(
          {Value<int?> id = const Value.absent(),
          String? animeId,
          String? title,
          String? episodeNum,
          String? playSourceType,
          String? playSourceId,
          String? playSourceSiteUrl,
          Value<String?> playableLink = const Value.absent()}) =>
      EpisodeEntity(
        id: id.present ? id.value : this.id,
        animeId: animeId ?? this.animeId,
        title: title ?? this.title,
        episodeNum: episodeNum ?? this.episodeNum,
        playSourceType: playSourceType ?? this.playSourceType,
        playSourceId: playSourceId ?? this.playSourceId,
        playSourceSiteUrl: playSourceSiteUrl ?? this.playSourceSiteUrl,
        playableLink:
            playableLink.present ? playableLink.value : this.playableLink,
      );
  EpisodeEntity copyWithCompanion(EpisodeTableCompanion data) {
    return EpisodeEntity(
      id: data.id.present ? data.id.value : this.id,
      animeId: data.animeId.present ? data.animeId.value : this.animeId,
      title: data.title.present ? data.title.value : this.title,
      episodeNum:
          data.episodeNum.present ? data.episodeNum.value : this.episodeNum,
      playSourceType: data.playSourceType.present
          ? data.playSourceType.value
          : this.playSourceType,
      playSourceId: data.playSourceId.present
          ? data.playSourceId.value
          : this.playSourceId,
      playSourceSiteUrl: data.playSourceSiteUrl.present
          ? data.playSourceSiteUrl.value
          : this.playSourceSiteUrl,
      playableLink: data.playableLink.present
          ? data.playableLink.value
          : this.playableLink,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeEntity(')
          ..write('id: $id, ')
          ..write('animeId: $animeId, ')
          ..write('title: $title, ')
          ..write('episodeNum: $episodeNum, ')
          ..write('playSourceType: $playSourceType, ')
          ..write('playSourceId: $playSourceId, ')
          ..write('playSourceSiteUrl: $playSourceSiteUrl, ')
          ..write('playableLink: $playableLink')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, animeId, title, episodeNum,
      playSourceType, playSourceId, playSourceSiteUrl, playableLink);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EpisodeEntity &&
          other.id == this.id &&
          other.animeId == this.animeId &&
          other.title == this.title &&
          other.episodeNum == this.episodeNum &&
          other.playSourceType == this.playSourceType &&
          other.playSourceId == this.playSourceId &&
          other.playSourceSiteUrl == this.playSourceSiteUrl &&
          other.playableLink == this.playableLink);
}

class EpisodeTableCompanion extends UpdateCompanion<EpisodeEntity> {
  final Value<int?> id;
  final Value<String> animeId;
  final Value<String> title;
  final Value<String> episodeNum;
  final Value<String> playSourceType;
  final Value<String> playSourceId;
  final Value<String> playSourceSiteUrl;
  final Value<String?> playableLink;
  const EpisodeTableCompanion({
    this.id = const Value.absent(),
    this.animeId = const Value.absent(),
    this.title = const Value.absent(),
    this.episodeNum = const Value.absent(),
    this.playSourceType = const Value.absent(),
    this.playSourceId = const Value.absent(),
    this.playSourceSiteUrl = const Value.absent(),
    this.playableLink = const Value.absent(),
  });
  EpisodeTableCompanion.insert({
    this.id = const Value.absent(),
    required String animeId,
    required String title,
    required String episodeNum,
    required String playSourceType,
    required String playSourceId,
    required String playSourceSiteUrl,
    this.playableLink = const Value.absent(),
  })  : animeId = Value(animeId),
        title = Value(title),
        episodeNum = Value(episodeNum),
        playSourceType = Value(playSourceType),
        playSourceId = Value(playSourceId),
        playSourceSiteUrl = Value(playSourceSiteUrl);
  static Insertable<EpisodeEntity> custom({
    Expression<int>? id,
    Expression<String>? animeId,
    Expression<String>? title,
    Expression<String>? episodeNum,
    Expression<String>? playSourceType,
    Expression<String>? playSourceId,
    Expression<String>? playSourceSiteUrl,
    Expression<String>? playableLink,
  }) {
    return RawValuesInsertable({
      if (id != null) 'episode_id': id,
      if (animeId != null) 'episode_anime_cross_id': animeId,
      if (title != null) 'episode_title': title,
      if (episodeNum != null) 'episode_number': episodeNum,
      if (playSourceType != null) 'episode_play_source_type': playSourceType,
      if (playSourceId != null) 'episode_play_source_id': playSourceId,
      if (playSourceSiteUrl != null)
        'episode_play_source_site_url': playSourceSiteUrl,
      if (playableLink != null) 'episode_site_url': playableLink,
    });
  }

  EpisodeTableCompanion copyWith(
      {Value<int?>? id,
      Value<String>? animeId,
      Value<String>? title,
      Value<String>? episodeNum,
      Value<String>? playSourceType,
      Value<String>? playSourceId,
      Value<String>? playSourceSiteUrl,
      Value<String?>? playableLink}) {
    return EpisodeTableCompanion(
      id: id ?? this.id,
      animeId: animeId ?? this.animeId,
      title: title ?? this.title,
      episodeNum: episodeNum ?? this.episodeNum,
      playSourceType: playSourceType ?? this.playSourceType,
      playSourceId: playSourceId ?? this.playSourceId,
      playSourceSiteUrl: playSourceSiteUrl ?? this.playSourceSiteUrl,
      playableLink: playableLink ?? this.playableLink,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['episode_id'] = Variable<int>(id.value);
    }
    if (animeId.present) {
      map['episode_anime_cross_id'] = Variable<String>(animeId.value);
    }
    if (title.present) {
      map['episode_title'] = Variable<String>(title.value);
    }
    if (episodeNum.present) {
      map['episode_number'] = Variable<String>(episodeNum.value);
    }
    if (playSourceType.present) {
      map['episode_play_source_type'] = Variable<String>(playSourceType.value);
    }
    if (playSourceId.present) {
      map['episode_play_source_id'] = Variable<String>(playSourceId.value);
    }
    if (playSourceSiteUrl.present) {
      map['episode_play_source_site_url'] =
          Variable<String>(playSourceSiteUrl.value);
    }
    if (playableLink.present) {
      map['episode_site_url'] = Variable<String>(playableLink.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeTableCompanion(')
          ..write('id: $id, ')
          ..write('animeId: $animeId, ')
          ..write('title: $title, ')
          ..write('episodeNum: $episodeNum, ')
          ..write('playSourceType: $playSourceType, ')
          ..write('playSourceId: $playSourceId, ')
          ..write('playSourceSiteUrl: $playSourceSiteUrl, ')
          ..write('playableLink: $playableLink')
          ..write(')'))
        .toString();
  }
}

class $ReleasedPackageTableTable extends ReleasedPackageTable
    with TableInfo<$ReleasedPackageTableTable, ReleasedPackageEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReleasedPackageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'released_package_id', aliasedName, true,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _apkDownloadUrlMeta =
      const VerificationMeta('apkDownloadUrl');
  @override
  late final GeneratedColumn<String> apkDownloadUrl = GeneratedColumn<String>(
      'released_package_apk_download_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagNameMeta =
      const VerificationMeta('tagName');
  @override
  late final GeneratedColumn<String> tagName = GeneratedColumn<String>(
      'released_package_tag_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, apkDownloadUrl, tagName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'released_package_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ReleasedPackageEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('released_package_id')) {
      context.handle(_idMeta,
          id.isAcceptableOrUnknown(data['released_package_id']!, _idMeta));
    }
    if (data.containsKey('released_package_apk_download_url')) {
      context.handle(
          _apkDownloadUrlMeta,
          apkDownloadUrl.isAcceptableOrUnknown(
              data['released_package_apk_download_url']!, _apkDownloadUrlMeta));
    } else if (isInserting) {
      context.missing(_apkDownloadUrlMeta);
    }
    if (data.containsKey('released_package_tag_name')) {
      context.handle(
          _tagNameMeta,
          tagName.isAcceptableOrUnknown(
              data['released_package_tag_name']!, _tagNameMeta));
    } else if (isInserting) {
      context.missing(_tagNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReleasedPackageEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReleasedPackageEntity(
      id: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}released_package_id']),
      apkDownloadUrl: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}released_package_apk_download_url'])!,
      tagName: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}released_package_tag_name'])!,
    );
  }

  @override
  $ReleasedPackageTableTable createAlias(String alias) {
    return $ReleasedPackageTableTable(attachedDatabase, alias);
  }
}

class ReleasedPackageEntity extends DataClass
    implements Insertable<ReleasedPackageEntity> {
  final int? id;
  final String apkDownloadUrl;
  final String tagName;
  const ReleasedPackageEntity(
      {this.id, required this.apkDownloadUrl, required this.tagName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['released_package_id'] = Variable<int>(id);
    }
    map['released_package_apk_download_url'] = Variable<String>(apkDownloadUrl);
    map['released_package_tag_name'] = Variable<String>(tagName);
    return map;
  }

  ReleasedPackageTableCompanion toCompanion(bool nullToAbsent) {
    return ReleasedPackageTableCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      apkDownloadUrl: Value(apkDownloadUrl),
      tagName: Value(tagName),
    );
  }

  factory ReleasedPackageEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReleasedPackageEntity(
      id: serializer.fromJson<int?>(json['id']),
      apkDownloadUrl: serializer.fromJson<String>(json['apkDownloadUrl']),
      tagName: serializer.fromJson<String>(json['tagName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'apkDownloadUrl': serializer.toJson<String>(apkDownloadUrl),
      'tagName': serializer.toJson<String>(tagName),
    };
  }

  ReleasedPackageEntity copyWith(
          {Value<int?> id = const Value.absent(),
          String? apkDownloadUrl,
          String? tagName}) =>
      ReleasedPackageEntity(
        id: id.present ? id.value : this.id,
        apkDownloadUrl: apkDownloadUrl ?? this.apkDownloadUrl,
        tagName: tagName ?? this.tagName,
      );
  ReleasedPackageEntity copyWithCompanion(ReleasedPackageTableCompanion data) {
    return ReleasedPackageEntity(
      id: data.id.present ? data.id.value : this.id,
      apkDownloadUrl: data.apkDownloadUrl.present
          ? data.apkDownloadUrl.value
          : this.apkDownloadUrl,
      tagName: data.tagName.present ? data.tagName.value : this.tagName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReleasedPackageEntity(')
          ..write('id: $id, ')
          ..write('apkDownloadUrl: $apkDownloadUrl, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, apkDownloadUrl, tagName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReleasedPackageEntity &&
          other.id == this.id &&
          other.apkDownloadUrl == this.apkDownloadUrl &&
          other.tagName == this.tagName);
}

class ReleasedPackageTableCompanion
    extends UpdateCompanion<ReleasedPackageEntity> {
  final Value<int?> id;
  final Value<String> apkDownloadUrl;
  final Value<String> tagName;
  const ReleasedPackageTableCompanion({
    this.id = const Value.absent(),
    this.apkDownloadUrl = const Value.absent(),
    this.tagName = const Value.absent(),
  });
  ReleasedPackageTableCompanion.insert({
    this.id = const Value.absent(),
    required String apkDownloadUrl,
    required String tagName,
  })  : apkDownloadUrl = Value(apkDownloadUrl),
        tagName = Value(tagName);
  static Insertable<ReleasedPackageEntity> custom({
    Expression<int>? id,
    Expression<String>? apkDownloadUrl,
    Expression<String>? tagName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'released_package_id': id,
      if (apkDownloadUrl != null)
        'released_package_apk_download_url': apkDownloadUrl,
      if (tagName != null) 'released_package_tag_name': tagName,
    });
  }

  ReleasedPackageTableCompanion copyWith(
      {Value<int?>? id,
      Value<String>? apkDownloadUrl,
      Value<String>? tagName}) {
    return ReleasedPackageTableCompanion(
      id: id ?? this.id,
      apkDownloadUrl: apkDownloadUrl ?? this.apkDownloadUrl,
      tagName: tagName ?? this.tagName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['released_package_id'] = Variable<int>(id.value);
    }
    if (apkDownloadUrl.present) {
      map['released_package_apk_download_url'] =
          Variable<String>(apkDownloadUrl.value);
    }
    if (tagName.present) {
      map['released_package_tag_name'] = Variable<String>(tagName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReleasedPackageTableCompanion(')
          ..write('id: $id, ')
          ..write('apkDownloadUrl: $apkDownloadUrl, ')
          ..write('tagName: $tagName')
          ..write(')'))
        .toString();
  }
}

class $MediaAiringScheduleUpdatedTableTable
    extends MediaAiringScheduleUpdatedTable
    with
        TableInfo<$MediaAiringScheduleUpdatedTableTable,
            MediaAiringScheduleUpdatedEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MediaAiringScheduleUpdatedTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedMediaIdMeta =
      const VerificationMeta('updatedMediaId');
  @override
  late final GeneratedColumn<String> updatedMediaId = GeneratedColumn<String>(
      'updated_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'new_episode_update_date_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [updatedMediaId, updateTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'media_airing_schedule_updated_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<MediaAiringScheduleUpdatedEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_media_id')) {
      context.handle(
          _updatedMediaIdMeta,
          updatedMediaId.isAcceptableOrUnknown(
              data['updated_media_id']!, _updatedMediaIdMeta));
    } else if (isInserting) {
      context.missing(_updatedMediaIdMeta);
    }
    if (data.containsKey('new_episode_update_date_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['new_episode_update_date_time']!, _updateTimeMeta));
    } else if (isInserting) {
      context.missing(_updateTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {updatedMediaId};
  @override
  MediaAiringScheduleUpdatedEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MediaAiringScheduleUpdatedEntity(
      updatedMediaId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}updated_media_id'])!,
      updateTime: attachedDatabase.typeMapping.read(DriftSqlType.dateTime,
          data['${effectivePrefix}new_episode_update_date_time'])!,
    );
  }

  @override
  $MediaAiringScheduleUpdatedTableTable createAlias(String alias) {
    return $MediaAiringScheduleUpdatedTableTable(attachedDatabase, alias);
  }
}

class MediaAiringScheduleUpdatedEntity extends DataClass
    implements Insertable<MediaAiringScheduleUpdatedEntity> {
  final String updatedMediaId;
  final DateTime updateTime;
  const MediaAiringScheduleUpdatedEntity(
      {required this.updatedMediaId, required this.updateTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['updated_media_id'] = Variable<String>(updatedMediaId);
    map['new_episode_update_date_time'] = Variable<DateTime>(updateTime);
    return map;
  }

  MediaAiringScheduleUpdatedTableCompanion toCompanion(bool nullToAbsent) {
    return MediaAiringScheduleUpdatedTableCompanion(
      updatedMediaId: Value(updatedMediaId),
      updateTime: Value(updateTime),
    );
  }

  factory MediaAiringScheduleUpdatedEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MediaAiringScheduleUpdatedEntity(
      updatedMediaId: serializer.fromJson<String>(json['updatedMediaId']),
      updateTime: serializer.fromJson<DateTime>(json['updateTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedMediaId': serializer.toJson<String>(updatedMediaId),
      'updateTime': serializer.toJson<DateTime>(updateTime),
    };
  }

  MediaAiringScheduleUpdatedEntity copyWith(
          {String? updatedMediaId, DateTime? updateTime}) =>
      MediaAiringScheduleUpdatedEntity(
        updatedMediaId: updatedMediaId ?? this.updatedMediaId,
        updateTime: updateTime ?? this.updateTime,
      );
  MediaAiringScheduleUpdatedEntity copyWithCompanion(
      MediaAiringScheduleUpdatedTableCompanion data) {
    return MediaAiringScheduleUpdatedEntity(
      updatedMediaId: data.updatedMediaId.present
          ? data.updatedMediaId.value
          : this.updatedMediaId,
      updateTime:
          data.updateTime.present ? data.updateTime.value : this.updateTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MediaAiringScheduleUpdatedEntity(')
          ..write('updatedMediaId: $updatedMediaId, ')
          ..write('updateTime: $updateTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(updatedMediaId, updateTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MediaAiringScheduleUpdatedEntity &&
          other.updatedMediaId == this.updatedMediaId &&
          other.updateTime == this.updateTime);
}

class MediaAiringScheduleUpdatedTableCompanion
    extends UpdateCompanion<MediaAiringScheduleUpdatedEntity> {
  final Value<String> updatedMediaId;
  final Value<DateTime> updateTime;
  final Value<int> rowid;
  const MediaAiringScheduleUpdatedTableCompanion({
    this.updatedMediaId = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MediaAiringScheduleUpdatedTableCompanion.insert({
    required String updatedMediaId,
    required DateTime updateTime,
    this.rowid = const Value.absent(),
  })  : updatedMediaId = Value(updatedMediaId),
        updateTime = Value(updateTime);
  static Insertable<MediaAiringScheduleUpdatedEntity> custom({
    Expression<String>? updatedMediaId,
    Expression<DateTime>? updateTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedMediaId != null) 'updated_media_id': updatedMediaId,
      if (updateTime != null) 'new_episode_update_date_time': updateTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MediaAiringScheduleUpdatedTableCompanion copyWith(
      {Value<String>? updatedMediaId,
      Value<DateTime>? updateTime,
      Value<int>? rowid}) {
    return MediaAiringScheduleUpdatedTableCompanion(
      updatedMediaId: updatedMediaId ?? this.updatedMediaId,
      updateTime: updateTime ?? this.updateTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedMediaId.present) {
      map['updated_media_id'] = Variable<String>(updatedMediaId.value);
    }
    if (updateTime.present) {
      map['new_episode_update_date_time'] =
          Variable<DateTime>(updateTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MediaAiringScheduleUpdatedTableCompanion(')
          ..write('updatedMediaId: $updatedMediaId, ')
          ..write('updateTime: $updateTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchResultTableTable extends SearchResultTable
    with TableInfo<$SearchResultTableTable, SearchResultEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchResultTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mediaIdMeta =
      const VerificationMeta('mediaId');
  @override
  late final GeneratedColumn<String> mediaId = GeneratedColumn<String>(
      'search_result_media_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mediaSourceMeta =
      const VerificationMeta('mediaSource');
  @override
  late final GeneratedColumn<String> mediaSource = GeneratedColumn<String>(
      'search_result_media_source', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cacheMeta = const VerificationMeta('cache');
  @override
  late final GeneratedColumn<String> cache = GeneratedColumn<String>(
      'search_result_cache', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [mediaId, mediaSource, cache];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_result_table';
  @override
  VerificationContext validateIntegrity(Insertable<SearchResultEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('search_result_media_id')) {
      context.handle(
          _mediaIdMeta,
          mediaId.isAcceptableOrUnknown(
              data['search_result_media_id']!, _mediaIdMeta));
    } else if (isInserting) {
      context.missing(_mediaIdMeta);
    }
    if (data.containsKey('search_result_media_source')) {
      context.handle(
          _mediaSourceMeta,
          mediaSource.isAcceptableOrUnknown(
              data['search_result_media_source']!, _mediaSourceMeta));
    } else if (isInserting) {
      context.missing(_mediaSourceMeta);
    }
    if (data.containsKey('search_result_cache')) {
      context.handle(
          _cacheMeta,
          cache.isAcceptableOrUnknown(
              data['search_result_cache']!, _cacheMeta));
    } else if (isInserting) {
      context.missing(_cacheMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mediaId, mediaSource};
  @override
  SearchResultEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchResultEntity(
      mediaId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}search_result_media_id'])!,
      mediaSource: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}search_result_media_source'])!,
      cache: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}search_result_cache'])!,
    );
  }

  @override
  $SearchResultTableTable createAlias(String alias) {
    return $SearchResultTableTable(attachedDatabase, alias);
  }
}

class SearchResultEntity extends DataClass
    implements Insertable<SearchResultEntity> {
  final String mediaId;
  final String mediaSource;
  final String cache;
  const SearchResultEntity(
      {required this.mediaId, required this.mediaSource, required this.cache});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['search_result_media_id'] = Variable<String>(mediaId);
    map['search_result_media_source'] = Variable<String>(mediaSource);
    map['search_result_cache'] = Variable<String>(cache);
    return map;
  }

  SearchResultTableCompanion toCompanion(bool nullToAbsent) {
    return SearchResultTableCompanion(
      mediaId: Value(mediaId),
      mediaSource: Value(mediaSource),
      cache: Value(cache),
    );
  }

  factory SearchResultEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchResultEntity(
      mediaId: serializer.fromJson<String>(json['mediaId']),
      mediaSource: serializer.fromJson<String>(json['mediaSource']),
      cache: serializer.fromJson<String>(json['cache']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mediaId': serializer.toJson<String>(mediaId),
      'mediaSource': serializer.toJson<String>(mediaSource),
      'cache': serializer.toJson<String>(cache),
    };
  }

  SearchResultEntity copyWith(
          {String? mediaId, String? mediaSource, String? cache}) =>
      SearchResultEntity(
        mediaId: mediaId ?? this.mediaId,
        mediaSource: mediaSource ?? this.mediaSource,
        cache: cache ?? this.cache,
      );
  SearchResultEntity copyWithCompanion(SearchResultTableCompanion data) {
    return SearchResultEntity(
      mediaId: data.mediaId.present ? data.mediaId.value : this.mediaId,
      mediaSource:
          data.mediaSource.present ? data.mediaSource.value : this.mediaSource,
      cache: data.cache.present ? data.cache.value : this.cache,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchResultEntity(')
          ..write('mediaId: $mediaId, ')
          ..write('mediaSource: $mediaSource, ')
          ..write('cache: $cache')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mediaId, mediaSource, cache);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchResultEntity &&
          other.mediaId == this.mediaId &&
          other.mediaSource == this.mediaSource &&
          other.cache == this.cache);
}

class SearchResultTableCompanion extends UpdateCompanion<SearchResultEntity> {
  final Value<String> mediaId;
  final Value<String> mediaSource;
  final Value<String> cache;
  final Value<int> rowid;
  const SearchResultTableCompanion({
    this.mediaId = const Value.absent(),
    this.mediaSource = const Value.absent(),
    this.cache = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchResultTableCompanion.insert({
    required String mediaId,
    required String mediaSource,
    required String cache,
    this.rowid = const Value.absent(),
  })  : mediaId = Value(mediaId),
        mediaSource = Value(mediaSource),
        cache = Value(cache);
  static Insertable<SearchResultEntity> custom({
    Expression<String>? mediaId,
    Expression<String>? mediaSource,
    Expression<String>? cache,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mediaId != null) 'search_result_media_id': mediaId,
      if (mediaSource != null) 'search_result_media_source': mediaSource,
      if (cache != null) 'search_result_cache': cache,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchResultTableCompanion copyWith(
      {Value<String>? mediaId,
      Value<String>? mediaSource,
      Value<String>? cache,
      Value<int>? rowid}) {
    return SearchResultTableCompanion(
      mediaId: mediaId ?? this.mediaId,
      mediaSource: mediaSource ?? this.mediaSource,
      cache: cache ?? this.cache,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mediaId.present) {
      map['search_result_media_id'] = Variable<String>(mediaId.value);
    }
    if (mediaSource.present) {
      map['search_result_media_source'] = Variable<String>(mediaSource.value);
    }
    if (cache.present) {
      map['search_result_cache'] = Variable<String>(cache.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchResultTableCompanion(')
          ..write('mediaId: $mediaId, ')
          ..write('mediaSource: $mediaSource, ')
          ..write('cache: $cache, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AniflowDatabase extends GeneratedDatabase {
  _$AniflowDatabase(QueryExecutor e) : super(e);
  $AniflowDatabaseManager get managers => $AniflowDatabaseManager(this);
  late final $UserTableTable userTable = $UserTableTable(this);
  late final $StudioTableTable studioTable = $StudioTableTable(this);
  late final $StaffTableTable staffTable = $StaffTableTable(this);
  late final $ActivityTableTable activityTable = $ActivityTableTable(this);
  late final $AiringScheduleTableTable airingScheduleTable =
      $AiringScheduleTableTable(this);
  late final $CharacterTableTable characterTable = $CharacterTableTable(this);
  late final $MediaListTableTable mediaListTable = $MediaListTableTable(this);
  late final $MediaTableTable mediaTable = $MediaTableTable(this);
  late final $StudioMediaCrossRefTableTable studioMediaCrossRefTable =
      $StudioMediaCrossRefTableTable(this);
  late final $CharacterRelatedMediaCrossRefTableTable
      characterRelatedMediaCrossRefTable =
      $CharacterRelatedMediaCrossRefTableTable(this);
  late final $ActivityFilterTypePagingCrossRefTableTable
      activityFilterTypePagingCrossRefTable =
      $ActivityFilterTypePagingCrossRefTableTable(this);
  late final $MediaCharacterPagingCrossRefTableTable
      mediaCharacterPagingCrossRefTable =
      $MediaCharacterPagingCrossRefTableTable(this);
  late final $CharacterVoiceActorCrossRefTableTable
      characterVoiceActorCrossRefTable =
      $CharacterVoiceActorCrossRefTableTable(this);
  late final $MediaRelationCrossRefTableTable mediaRelationCrossRefTable =
      $MediaRelationCrossRefTableTable(this);
  late final $MediaStaffPagingCrossRefTableTable mediaStaffPagingCrossRefTable =
      $MediaStaffPagingCrossRefTableTable(this);
  late final $MediaExternalLinkTableTable mediaExternalLinkTable =
      $MediaExternalLinkTableTable(this);
  late final $CategoryMediaPagingCrossRefTableTable
      categoryMediaPagingCrossRefTable =
      $CategoryMediaPagingCrossRefTableTable(this);
  late final $FavoriteInfoTableTable favoriteInfoTable =
      $FavoriteInfoTableTable(this);
  late final $EpisodeTableTable episodeTable = $EpisodeTableTable(this);
  late final $ReleasedPackageTableTable releasedPackageTable =
      $ReleasedPackageTableTable(this);
  late final $MediaAiringScheduleUpdatedTableTable
      mediaAiringScheduleUpdatedTable =
      $MediaAiringScheduleUpdatedTableTable(this);
  late final $SearchResultTableTable searchResultTable =
      $SearchResultTableTable(this);
  late final UserDao userDao = UserDao(this as AniflowDatabase);
  late final StudioDao studioDao = StudioDao(this as AniflowDatabase);
  late final StaffDao staffDao = StaffDao(this as AniflowDatabase);
  late final ActivityDao activityDao = ActivityDao(this as AniflowDatabase);
  late final AiringSchedulesDao airingSchedulesDao =
      AiringSchedulesDao(this as AniflowDatabase);
  late final CharacterDao characterDao = CharacterDao(this as AniflowDatabase);
  late final MediaListDao mediaListDao = MediaListDao(this as AniflowDatabase);
  late final MediaDao mediaDao = MediaDao(this as AniflowDatabase);
  late final FavoriteDao favoriteDao = FavoriteDao(this as AniflowDatabase);
  late final EpisodeDao episodeDao = EpisodeDao(this as AniflowDatabase);
  late final GithubReleaseDao githubReleaseDao =
      GithubReleaseDao(this as AniflowDatabase);
  late final SearchResultCacheDao searchResultCacheDao =
      SearchResultCacheDao(this as AniflowDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userTable,
        studioTable,
        staffTable,
        activityTable,
        airingScheduleTable,
        characterTable,
        mediaListTable,
        mediaTable,
        studioMediaCrossRefTable,
        characterRelatedMediaCrossRefTable,
        activityFilterTypePagingCrossRefTable,
        mediaCharacterPagingCrossRefTable,
        characterVoiceActorCrossRefTable,
        mediaRelationCrossRefTable,
        mediaStaffPagingCrossRefTable,
        mediaExternalLinkTable,
        categoryMediaPagingCrossRefTable,
        favoriteInfoTable,
        episodeTable,
        releasedPackageTable,
        mediaAiringScheduleUpdatedTable,
        searchResultTable
      ];
}

typedef $$UserTableTableCreateCompanionBuilder = UserTableCompanion Function({
  required String id,
  required String name,
  Value<String?> avatarImage,
  Value<String?> bannerImage,
  Value<String?> profileColor,
  Value<String?> siteUrl,
  Value<int?> unreadNotificationCount,
  Value<int> rowid,
});
typedef $$UserTableTableUpdateCompanionBuilder = UserTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> avatarImage,
  Value<String?> bannerImage,
  Value<String?> profileColor,
  Value<String?> siteUrl,
  Value<int?> unreadNotificationCount,
  Value<int> rowid,
});

class $$UserTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $UserTableTable> {
  $$UserTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get avatarImage => $composableBuilder(
      column: $table.avatarImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bannerImage => $composableBuilder(
      column: $table.bannerImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileColor => $composableBuilder(
      column: $table.profileColor, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unreadNotificationCount => $composableBuilder(
      column: $table.unreadNotificationCount,
      builder: (column) => ColumnFilters(column));
}

class $$UserTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $UserTableTable> {
  $$UserTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get avatarImage => $composableBuilder(
      column: $table.avatarImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bannerImage => $composableBuilder(
      column: $table.bannerImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileColor => $composableBuilder(
      column: $table.profileColor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unreadNotificationCount => $composableBuilder(
      column: $table.unreadNotificationCount,
      builder: (column) => ColumnOrderings(column));
}

class $$UserTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $UserTableTable> {
  $$UserTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get avatarImage => $composableBuilder(
      column: $table.avatarImage, builder: (column) => column);

  GeneratedColumn<String> get bannerImage => $composableBuilder(
      column: $table.bannerImage, builder: (column) => column);

  GeneratedColumn<String> get profileColor => $composableBuilder(
      column: $table.profileColor, builder: (column) => column);

  GeneratedColumn<String> get siteUrl =>
      $composableBuilder(column: $table.siteUrl, builder: (column) => column);

  GeneratedColumn<int> get unreadNotificationCount => $composableBuilder(
      column: $table.unreadNotificationCount, builder: (column) => column);
}

class $$UserTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $UserTableTable,
    UserEntity,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserEntity,
      BaseReferences<_$AniflowDatabase, $UserTableTable, UserEntity>
    ),
    UserEntity,
    PrefetchHooks Function()> {
  $$UserTableTableTableManager(_$AniflowDatabase db, $UserTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> avatarImage = const Value.absent(),
            Value<String?> bannerImage = const Value.absent(),
            Value<String?> profileColor = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int?> unreadNotificationCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserTableCompanion(
            id: id,
            name: name,
            avatarImage: avatarImage,
            bannerImage: bannerImage,
            profileColor: profileColor,
            siteUrl: siteUrl,
            unreadNotificationCount: unreadNotificationCount,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> avatarImage = const Value.absent(),
            Value<String?> bannerImage = const Value.absent(),
            Value<String?> profileColor = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int?> unreadNotificationCount = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserTableCompanion.insert(
            id: id,
            name: name,
            avatarImage: avatarImage,
            bannerImage: bannerImage,
            profileColor: profileColor,
            siteUrl: siteUrl,
            unreadNotificationCount: unreadNotificationCount,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $UserTableTable,
    UserEntity,
    $$UserTableTableFilterComposer,
    $$UserTableTableOrderingComposer,
    $$UserTableTableAnnotationComposer,
    $$UserTableTableCreateCompanionBuilder,
    $$UserTableTableUpdateCompanionBuilder,
    (
      UserEntity,
      BaseReferences<_$AniflowDatabase, $UserTableTable, UserEntity>
    ),
    UserEntity,
    PrefetchHooks Function()>;
typedef $$StudioTableTableCreateCompanionBuilder = StudioTableCompanion
    Function({
  required String id,
  required String name,
  Value<String?> siteUrl,
  required bool isAnimationStudio,
  required bool isFavourite,
  Value<int> rowid,
});
typedef $$StudioTableTableUpdateCompanionBuilder = StudioTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> siteUrl,
  Value<bool> isAnimationStudio,
  Value<bool> isFavourite,
  Value<int> rowid,
});

class $$StudioTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $StudioTableTable> {
  $$StudioTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAnimationStudio => $composableBuilder(
      column: $table.isAnimationStudio,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));
}

class $$StudioTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $StudioTableTable> {
  $$StudioTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAnimationStudio => $composableBuilder(
      column: $table.isAnimationStudio,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));
}

class $$StudioTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $StudioTableTable> {
  $$StudioTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get siteUrl =>
      $composableBuilder(column: $table.siteUrl, builder: (column) => column);

  GeneratedColumn<bool> get isAnimationStudio => $composableBuilder(
      column: $table.isAnimationStudio, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);
}

class $$StudioTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $StudioTableTable,
    StudioEntity,
    $$StudioTableTableFilterComposer,
    $$StudioTableTableOrderingComposer,
    $$StudioTableTableAnnotationComposer,
    $$StudioTableTableCreateCompanionBuilder,
    $$StudioTableTableUpdateCompanionBuilder,
    (
      StudioEntity,
      BaseReferences<_$AniflowDatabase, $StudioTableTable, StudioEntity>
    ),
    StudioEntity,
    PrefetchHooks Function()> {
  $$StudioTableTableTableManager(_$AniflowDatabase db, $StudioTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudioTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudioTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudioTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<bool> isAnimationStudio = const Value.absent(),
            Value<bool> isFavourite = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudioTableCompanion(
            id: id,
            name: name,
            siteUrl: siteUrl,
            isAnimationStudio: isAnimationStudio,
            isFavourite: isFavourite,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> siteUrl = const Value.absent(),
            required bool isAnimationStudio,
            required bool isFavourite,
            Value<int> rowid = const Value.absent(),
          }) =>
              StudioTableCompanion.insert(
            id: id,
            name: name,
            siteUrl: siteUrl,
            isAnimationStudio: isAnimationStudio,
            isFavourite: isFavourite,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudioTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $StudioTableTable,
    StudioEntity,
    $$StudioTableTableFilterComposer,
    $$StudioTableTableOrderingComposer,
    $$StudioTableTableAnnotationComposer,
    $$StudioTableTableCreateCompanionBuilder,
    $$StudioTableTableUpdateCompanionBuilder,
    (
      StudioEntity,
      BaseReferences<_$AniflowDatabase, $StudioTableTable, StudioEntity>
    ),
    StudioEntity,
    PrefetchHooks Function()>;
typedef $$StaffTableTableCreateCompanionBuilder = StaffTableCompanion Function({
  required String id,
  Value<String?> largeImage,
  Value<String?> mediumImage,
  Value<String?> firstName,
  Value<String?> middleName,
  Value<String?> lastName,
  Value<String?> fullName,
  Value<String?> nativeName,
  Value<String?> description,
  Value<String?> gender,
  Value<String?> siteUrl,
  Value<int?> dateOfBirth,
  Value<int?> dateOfDeath,
  Value<int?> age,
  Value<bool?> isFavourite,
  Value<String?> yearsActive,
  Value<String?> homeTown,
  Value<String?> bloodType,
  Value<int> rowid,
});
typedef $$StaffTableTableUpdateCompanionBuilder = StaffTableCompanion Function({
  Value<String> id,
  Value<String?> largeImage,
  Value<String?> mediumImage,
  Value<String?> firstName,
  Value<String?> middleName,
  Value<String?> lastName,
  Value<String?> fullName,
  Value<String?> nativeName,
  Value<String?> description,
  Value<String?> gender,
  Value<String?> siteUrl,
  Value<int?> dateOfBirth,
  Value<int?> dateOfDeath,
  Value<int?> age,
  Value<bool?> isFavourite,
  Value<String?> yearsActive,
  Value<String?> homeTown,
  Value<String?> bloodType,
  Value<int> rowid,
});

class $$StaffTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $StaffTableTable> {
  $$StaffTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get largeImage => $composableBuilder(
      column: $table.largeImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediumImage => $composableBuilder(
      column: $table.mediumImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nativeName => $composableBuilder(
      column: $table.nativeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get dateOfDeath => $composableBuilder(
      column: $table.dateOfDeath, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get yearsActive => $composableBuilder(
      column: $table.yearsActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get homeTown => $composableBuilder(
      column: $table.homeTown, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bloodType => $composableBuilder(
      column: $table.bloodType, builder: (column) => ColumnFilters(column));
}

class $$StaffTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $StaffTableTable> {
  $$StaffTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get largeImage => $composableBuilder(
      column: $table.largeImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediumImage => $composableBuilder(
      column: $table.mediumImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nativeName => $composableBuilder(
      column: $table.nativeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get dateOfDeath => $composableBuilder(
      column: $table.dateOfDeath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get yearsActive => $composableBuilder(
      column: $table.yearsActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get homeTown => $composableBuilder(
      column: $table.homeTown, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bloodType => $composableBuilder(
      column: $table.bloodType, builder: (column) => ColumnOrderings(column));
}

class $$StaffTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $StaffTableTable> {
  $$StaffTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get largeImage => $composableBuilder(
      column: $table.largeImage, builder: (column) => column);

  GeneratedColumn<String> get mediumImage => $composableBuilder(
      column: $table.mediumImage, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get nativeName => $composableBuilder(
      column: $table.nativeName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get siteUrl =>
      $composableBuilder(column: $table.siteUrl, builder: (column) => column);

  GeneratedColumn<int> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => column);

  GeneratedColumn<int> get dateOfDeath => $composableBuilder(
      column: $table.dateOfDeath, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);

  GeneratedColumn<String> get yearsActive => $composableBuilder(
      column: $table.yearsActive, builder: (column) => column);

  GeneratedColumn<String> get homeTown =>
      $composableBuilder(column: $table.homeTown, builder: (column) => column);

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);
}

class $$StaffTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $StaffTableTable,
    StaffEntity,
    $$StaffTableTableFilterComposer,
    $$StaffTableTableOrderingComposer,
    $$StaffTableTableAnnotationComposer,
    $$StaffTableTableCreateCompanionBuilder,
    $$StaffTableTableUpdateCompanionBuilder,
    (
      StaffEntity,
      BaseReferences<_$AniflowDatabase, $StaffTableTable, StaffEntity>
    ),
    StaffEntity,
    PrefetchHooks Function()> {
  $$StaffTableTableTableManager(_$AniflowDatabase db, $StaffTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StaffTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StaffTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StaffTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> largeImage = const Value.absent(),
            Value<String?> mediumImage = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> nativeName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int?> dateOfBirth = const Value.absent(),
            Value<int?> dateOfDeath = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<bool?> isFavourite = const Value.absent(),
            Value<String?> yearsActive = const Value.absent(),
            Value<String?> homeTown = const Value.absent(),
            Value<String?> bloodType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StaffTableCompanion(
            id: id,
            largeImage: largeImage,
            mediumImage: mediumImage,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            fullName: fullName,
            nativeName: nativeName,
            description: description,
            gender: gender,
            siteUrl: siteUrl,
            dateOfBirth: dateOfBirth,
            dateOfDeath: dateOfDeath,
            age: age,
            isFavourite: isFavourite,
            yearsActive: yearsActive,
            homeTown: homeTown,
            bloodType: bloodType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> largeImage = const Value.absent(),
            Value<String?> mediumImage = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> nativeName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int?> dateOfBirth = const Value.absent(),
            Value<int?> dateOfDeath = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<bool?> isFavourite = const Value.absent(),
            Value<String?> yearsActive = const Value.absent(),
            Value<String?> homeTown = const Value.absent(),
            Value<String?> bloodType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StaffTableCompanion.insert(
            id: id,
            largeImage: largeImage,
            mediumImage: mediumImage,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            fullName: fullName,
            nativeName: nativeName,
            description: description,
            gender: gender,
            siteUrl: siteUrl,
            dateOfBirth: dateOfBirth,
            dateOfDeath: dateOfDeath,
            age: age,
            isFavourite: isFavourite,
            yearsActive: yearsActive,
            homeTown: homeTown,
            bloodType: bloodType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StaffTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $StaffTableTable,
    StaffEntity,
    $$StaffTableTableFilterComposer,
    $$StaffTableTableOrderingComposer,
    $$StaffTableTableAnnotationComposer,
    $$StaffTableTableCreateCompanionBuilder,
    $$StaffTableTableUpdateCompanionBuilder,
    (
      StaffEntity,
      BaseReferences<_$AniflowDatabase, $StaffTableTable, StaffEntity>
    ),
    StaffEntity,
    PrefetchHooks Function()>;
typedef $$ActivityTableTableCreateCompanionBuilder = ActivityTableCompanion
    Function({
  required String id,
  required String userId,
  Value<String?> mediaId,
  Value<String?> textContent,
  Value<String?> status,
  Value<String?> progress,
  Value<String?> type,
  Value<String?> siteUrl,
  Value<int> replyCount,
  Value<int> likeCount,
  Value<int?> createdAt,
  Value<bool?> isLocked,
  Value<bool> isLiked,
  Value<bool?> isPinned,
  Value<int> rowid,
});
typedef $$ActivityTableTableUpdateCompanionBuilder = ActivityTableCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String?> mediaId,
  Value<String?> textContent,
  Value<String?> status,
  Value<String?> progress,
  Value<String?> type,
  Value<String?> siteUrl,
  Value<int> replyCount,
  Value<int> likeCount,
  Value<int?> createdAt,
  Value<bool?> isLocked,
  Value<bool> isLiked,
  Value<bool?> isPinned,
  Value<int> rowid,
});

class $$ActivityTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $ActivityTableTable> {
  $$ActivityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get textContent => $composableBuilder(
      column: $table.textContent, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get replyCount => $composableBuilder(
      column: $table.replyCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLocked => $composableBuilder(
      column: $table.isLocked, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isLiked => $composableBuilder(
      column: $table.isLiked, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPinned => $composableBuilder(
      column: $table.isPinned, builder: (column) => ColumnFilters(column));
}

class $$ActivityTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $ActivityTableTable> {
  $$ActivityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get textContent => $composableBuilder(
      column: $table.textContent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get replyCount => $composableBuilder(
      column: $table.replyCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get likeCount => $composableBuilder(
      column: $table.likeCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLocked => $composableBuilder(
      column: $table.isLocked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isLiked => $composableBuilder(
      column: $table.isLiked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPinned => $composableBuilder(
      column: $table.isPinned, builder: (column) => ColumnOrderings(column));
}

class $$ActivityTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $ActivityTableTable> {
  $$ActivityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get textContent => $composableBuilder(
      column: $table.textContent, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get siteUrl =>
      $composableBuilder(column: $table.siteUrl, builder: (column) => column);

  GeneratedColumn<int> get replyCount => $composableBuilder(
      column: $table.replyCount, builder: (column) => column);

  GeneratedColumn<int> get likeCount =>
      $composableBuilder(column: $table.likeCount, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isLocked =>
      $composableBuilder(column: $table.isLocked, builder: (column) => column);

  GeneratedColumn<bool> get isLiked =>
      $composableBuilder(column: $table.isLiked, builder: (column) => column);

  GeneratedColumn<bool> get isPinned =>
      $composableBuilder(column: $table.isPinned, builder: (column) => column);
}

class $$ActivityTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $ActivityTableTable,
    ActivityEntity,
    $$ActivityTableTableFilterComposer,
    $$ActivityTableTableOrderingComposer,
    $$ActivityTableTableAnnotationComposer,
    $$ActivityTableTableCreateCompanionBuilder,
    $$ActivityTableTableUpdateCompanionBuilder,
    (
      ActivityEntity,
      BaseReferences<_$AniflowDatabase, $ActivityTableTable, ActivityEntity>
    ),
    ActivityEntity,
    PrefetchHooks Function()> {
  $$ActivityTableTableTableManager(
      _$AniflowDatabase db, $ActivityTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String?> mediaId = const Value.absent(),
            Value<String?> textContent = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> progress = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int> replyCount = const Value.absent(),
            Value<int> likeCount = const Value.absent(),
            Value<int?> createdAt = const Value.absent(),
            Value<bool?> isLocked = const Value.absent(),
            Value<bool> isLiked = const Value.absent(),
            Value<bool?> isPinned = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActivityTableCompanion(
            id: id,
            userId: userId,
            mediaId: mediaId,
            textContent: textContent,
            status: status,
            progress: progress,
            type: type,
            siteUrl: siteUrl,
            replyCount: replyCount,
            likeCount: likeCount,
            createdAt: createdAt,
            isLocked: isLocked,
            isLiked: isLiked,
            isPinned: isPinned,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            Value<String?> mediaId = const Value.absent(),
            Value<String?> textContent = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> progress = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int> replyCount = const Value.absent(),
            Value<int> likeCount = const Value.absent(),
            Value<int?> createdAt = const Value.absent(),
            Value<bool?> isLocked = const Value.absent(),
            Value<bool> isLiked = const Value.absent(),
            Value<bool?> isPinned = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActivityTableCompanion.insert(
            id: id,
            userId: userId,
            mediaId: mediaId,
            textContent: textContent,
            status: status,
            progress: progress,
            type: type,
            siteUrl: siteUrl,
            replyCount: replyCount,
            likeCount: likeCount,
            createdAt: createdAt,
            isLocked: isLocked,
            isLiked: isLiked,
            isPinned: isPinned,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ActivityTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $ActivityTableTable,
    ActivityEntity,
    $$ActivityTableTableFilterComposer,
    $$ActivityTableTableOrderingComposer,
    $$ActivityTableTableAnnotationComposer,
    $$ActivityTableTableCreateCompanionBuilder,
    $$ActivityTableTableUpdateCompanionBuilder,
    (
      ActivityEntity,
      BaseReferences<_$AniflowDatabase, $ActivityTableTable, ActivityEntity>
    ),
    ActivityEntity,
    PrefetchHooks Function()>;
typedef $$AiringScheduleTableTableCreateCompanionBuilder
    = AiringScheduleTableCompanion Function({
  required String id,
  required String mediaId,
  Value<int?> airingAt,
  Value<int?> timeUntilAiring,
  Value<int?> episode,
  Value<int> rowid,
});
typedef $$AiringScheduleTableTableUpdateCompanionBuilder
    = AiringScheduleTableCompanion Function({
  Value<String> id,
  Value<String> mediaId,
  Value<int?> airingAt,
  Value<int?> timeUntilAiring,
  Value<int?> episode,
  Value<int> rowid,
});

class $$AiringScheduleTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $AiringScheduleTableTable> {
  $$AiringScheduleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get airingAt => $composableBuilder(
      column: $table.airingAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeUntilAiring => $composableBuilder(
      column: $table.timeUntilAiring,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get episode => $composableBuilder(
      column: $table.episode, builder: (column) => ColumnFilters(column));
}

class $$AiringScheduleTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $AiringScheduleTableTable> {
  $$AiringScheduleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get airingAt => $composableBuilder(
      column: $table.airingAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeUntilAiring => $composableBuilder(
      column: $table.timeUntilAiring,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get episode => $composableBuilder(
      column: $table.episode, builder: (column) => ColumnOrderings(column));
}

class $$AiringScheduleTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $AiringScheduleTableTable> {
  $$AiringScheduleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<int> get airingAt =>
      $composableBuilder(column: $table.airingAt, builder: (column) => column);

  GeneratedColumn<int> get timeUntilAiring => $composableBuilder(
      column: $table.timeUntilAiring, builder: (column) => column);

  GeneratedColumn<int> get episode =>
      $composableBuilder(column: $table.episode, builder: (column) => column);
}

class $$AiringScheduleTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $AiringScheduleTableTable,
    AiringScheduleEntity,
    $$AiringScheduleTableTableFilterComposer,
    $$AiringScheduleTableTableOrderingComposer,
    $$AiringScheduleTableTableAnnotationComposer,
    $$AiringScheduleTableTableCreateCompanionBuilder,
    $$AiringScheduleTableTableUpdateCompanionBuilder,
    (
      AiringScheduleEntity,
      BaseReferences<_$AniflowDatabase, $AiringScheduleTableTable,
          AiringScheduleEntity>
    ),
    AiringScheduleEntity,
    PrefetchHooks Function()> {
  $$AiringScheduleTableTableTableManager(
      _$AniflowDatabase db, $AiringScheduleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AiringScheduleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AiringScheduleTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AiringScheduleTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<int?> airingAt = const Value.absent(),
            Value<int?> timeUntilAiring = const Value.absent(),
            Value<int?> episode = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AiringScheduleTableCompanion(
            id: id,
            mediaId: mediaId,
            airingAt: airingAt,
            timeUntilAiring: timeUntilAiring,
            episode: episode,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String mediaId,
            Value<int?> airingAt = const Value.absent(),
            Value<int?> timeUntilAiring = const Value.absent(),
            Value<int?> episode = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AiringScheduleTableCompanion.insert(
            id: id,
            mediaId: mediaId,
            airingAt: airingAt,
            timeUntilAiring: timeUntilAiring,
            episode: episode,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AiringScheduleTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $AiringScheduleTableTable,
    AiringScheduleEntity,
    $$AiringScheduleTableTableFilterComposer,
    $$AiringScheduleTableTableOrderingComposer,
    $$AiringScheduleTableTableAnnotationComposer,
    $$AiringScheduleTableTableCreateCompanionBuilder,
    $$AiringScheduleTableTableUpdateCompanionBuilder,
    (
      AiringScheduleEntity,
      BaseReferences<_$AniflowDatabase, $AiringScheduleTableTable,
          AiringScheduleEntity>
    ),
    AiringScheduleEntity,
    PrefetchHooks Function()>;
typedef $$CharacterTableTableCreateCompanionBuilder = CharacterTableCompanion
    Function({
  required String id,
  Value<String?> largeImage,
  Value<String?> mediumImage,
  Value<String?> firstName,
  Value<String?> middleName,
  Value<String?> lastName,
  Value<String?> fullName,
  Value<String?> nativeName,
  Value<String?> description,
  Value<String?> gender,
  Value<String?> age,
  Value<String?> bloodType,
  Value<String?> siteUrl,
  Value<DateTime?> dateOfBirth,
  Value<int?> favourites,
  Value<bool?> isFavourite,
  Value<int> rowid,
});
typedef $$CharacterTableTableUpdateCompanionBuilder = CharacterTableCompanion
    Function({
  Value<String> id,
  Value<String?> largeImage,
  Value<String?> mediumImage,
  Value<String?> firstName,
  Value<String?> middleName,
  Value<String?> lastName,
  Value<String?> fullName,
  Value<String?> nativeName,
  Value<String?> description,
  Value<String?> gender,
  Value<String?> age,
  Value<String?> bloodType,
  Value<String?> siteUrl,
  Value<DateTime?> dateOfBirth,
  Value<int?> favourites,
  Value<bool?> isFavourite,
  Value<int> rowid,
});

class $$CharacterTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $CharacterTableTable> {
  $$CharacterTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get largeImage => $composableBuilder(
      column: $table.largeImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediumImage => $composableBuilder(
      column: $table.mediumImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nativeName => $composableBuilder(
      column: $table.nativeName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bloodType => $composableBuilder(
      column: $table.bloodType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get favourites => $composableBuilder(
      column: $table.favourites, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));
}

class $$CharacterTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $CharacterTableTable> {
  $$CharacterTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get largeImage => $composableBuilder(
      column: $table.largeImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediumImage => $composableBuilder(
      column: $table.mediumImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nativeName => $composableBuilder(
      column: $table.nativeName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get gender => $composableBuilder(
      column: $table.gender, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bloodType => $composableBuilder(
      column: $table.bloodType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get favourites => $composableBuilder(
      column: $table.favourites, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));
}

class $$CharacterTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $CharacterTableTable> {
  $$CharacterTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get largeImage => $composableBuilder(
      column: $table.largeImage, builder: (column) => column);

  GeneratedColumn<String> get mediumImage => $composableBuilder(
      column: $table.mediumImage, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get middleName => $composableBuilder(
      column: $table.middleName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get nativeName => $composableBuilder(
      column: $table.nativeName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get gender =>
      $composableBuilder(column: $table.gender, builder: (column) => column);

  GeneratedColumn<String> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);

  GeneratedColumn<String> get siteUrl =>
      $composableBuilder(column: $table.siteUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
      column: $table.dateOfBirth, builder: (column) => column);

  GeneratedColumn<int> get favourites => $composableBuilder(
      column: $table.favourites, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);
}

class $$CharacterTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $CharacterTableTable,
    CharacterEntity,
    $$CharacterTableTableFilterComposer,
    $$CharacterTableTableOrderingComposer,
    $$CharacterTableTableAnnotationComposer,
    $$CharacterTableTableCreateCompanionBuilder,
    $$CharacterTableTableUpdateCompanionBuilder,
    (
      CharacterEntity,
      BaseReferences<_$AniflowDatabase, $CharacterTableTable, CharacterEntity>
    ),
    CharacterEntity,
    PrefetchHooks Function()> {
  $$CharacterTableTableTableManager(
      _$AniflowDatabase db, $CharacterTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> largeImage = const Value.absent(),
            Value<String?> mediumImage = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> nativeName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> age = const Value.absent(),
            Value<String?> bloodType = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<DateTime?> dateOfBirth = const Value.absent(),
            Value<int?> favourites = const Value.absent(),
            Value<bool?> isFavourite = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterTableCompanion(
            id: id,
            largeImage: largeImage,
            mediumImage: mediumImage,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            fullName: fullName,
            nativeName: nativeName,
            description: description,
            gender: gender,
            age: age,
            bloodType: bloodType,
            siteUrl: siteUrl,
            dateOfBirth: dateOfBirth,
            favourites: favourites,
            isFavourite: isFavourite,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> largeImage = const Value.absent(),
            Value<String?> mediumImage = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String?> middleName = const Value.absent(),
            Value<String?> lastName = const Value.absent(),
            Value<String?> fullName = const Value.absent(),
            Value<String?> nativeName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> gender = const Value.absent(),
            Value<String?> age = const Value.absent(),
            Value<String?> bloodType = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<DateTime?> dateOfBirth = const Value.absent(),
            Value<int?> favourites = const Value.absent(),
            Value<bool?> isFavourite = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterTableCompanion.insert(
            id: id,
            largeImage: largeImage,
            mediumImage: mediumImage,
            firstName: firstName,
            middleName: middleName,
            lastName: lastName,
            fullName: fullName,
            nativeName: nativeName,
            description: description,
            gender: gender,
            age: age,
            bloodType: bloodType,
            siteUrl: siteUrl,
            dateOfBirth: dateOfBirth,
            favourites: favourites,
            isFavourite: isFavourite,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CharacterTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $CharacterTableTable,
    CharacterEntity,
    $$CharacterTableTableFilterComposer,
    $$CharacterTableTableOrderingComposer,
    $$CharacterTableTableAnnotationComposer,
    $$CharacterTableTableCreateCompanionBuilder,
    $$CharacterTableTableUpdateCompanionBuilder,
    (
      CharacterEntity,
      BaseReferences<_$AniflowDatabase, $CharacterTableTable, CharacterEntity>
    ),
    CharacterEntity,
    PrefetchHooks Function()>;
typedef $$MediaListTableTableCreateCompanionBuilder = MediaListTableCompanion
    Function({
  required String id,
  required String userId,
  required String mediaId,
  Value<String?> status,
  Value<String?> notes,
  Value<int?> progress,
  Value<int?> progressVolumes,
  Value<int?> startedAt,
  Value<int?> completedAt,
  Value<int?> updatedAt,
  Value<int?> repeat,
  Value<double?> score,
  Value<bool?> private,
  Value<int> rowid,
});
typedef $$MediaListTableTableUpdateCompanionBuilder = MediaListTableCompanion
    Function({
  Value<String> id,
  Value<String> userId,
  Value<String> mediaId,
  Value<String?> status,
  Value<String?> notes,
  Value<int?> progress,
  Value<int?> progressVolumes,
  Value<int?> startedAt,
  Value<int?> completedAt,
  Value<int?> updatedAt,
  Value<int?> repeat,
  Value<double?> score,
  Value<bool?> private,
  Value<int> rowid,
});

class $$MediaListTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $MediaListTableTable> {
  $$MediaListTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get progressVolumes => $composableBuilder(
      column: $table.progressVolumes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get private => $composableBuilder(
      column: $table.private, builder: (column) => ColumnFilters(column));
}

class $$MediaListTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $MediaListTableTable> {
  $$MediaListTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progress => $composableBuilder(
      column: $table.progress, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get progressVolumes => $composableBuilder(
      column: $table.progressVolumes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get startedAt => $composableBuilder(
      column: $table.startedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repeat => $composableBuilder(
      column: $table.repeat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get private => $composableBuilder(
      column: $table.private, builder: (column) => ColumnOrderings(column));
}

class $$MediaListTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $MediaListTableTable> {
  $$MediaListTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<int> get progressVolumes => $composableBuilder(
      column: $table.progressVolumes, builder: (column) => column);

  GeneratedColumn<int> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<int> get completedAt => $composableBuilder(
      column: $table.completedAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get repeat =>
      $composableBuilder(column: $table.repeat, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<bool> get private =>
      $composableBuilder(column: $table.private, builder: (column) => column);
}

class $$MediaListTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $MediaListTableTable,
    MediaListEntity,
    $$MediaListTableTableFilterComposer,
    $$MediaListTableTableOrderingComposer,
    $$MediaListTableTableAnnotationComposer,
    $$MediaListTableTableCreateCompanionBuilder,
    $$MediaListTableTableUpdateCompanionBuilder,
    (
      MediaListEntity,
      BaseReferences<_$AniflowDatabase, $MediaListTableTable, MediaListEntity>
    ),
    MediaListEntity,
    PrefetchHooks Function()> {
  $$MediaListTableTableTableManager(
      _$AniflowDatabase db, $MediaListTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaListTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaListTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaListTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> userId = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int?> progress = const Value.absent(),
            Value<int?> progressVolumes = const Value.absent(),
            Value<int?> startedAt = const Value.absent(),
            Value<int?> completedAt = const Value.absent(),
            Value<int?> updatedAt = const Value.absent(),
            Value<int?> repeat = const Value.absent(),
            Value<double?> score = const Value.absent(),
            Value<bool?> private = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaListTableCompanion(
            id: id,
            userId: userId,
            mediaId: mediaId,
            status: status,
            notes: notes,
            progress: progress,
            progressVolumes: progressVolumes,
            startedAt: startedAt,
            completedAt: completedAt,
            updatedAt: updatedAt,
            repeat: repeat,
            score: score,
            private: private,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String userId,
            required String mediaId,
            Value<String?> status = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int?> progress = const Value.absent(),
            Value<int?> progressVolumes = const Value.absent(),
            Value<int?> startedAt = const Value.absent(),
            Value<int?> completedAt = const Value.absent(),
            Value<int?> updatedAt = const Value.absent(),
            Value<int?> repeat = const Value.absent(),
            Value<double?> score = const Value.absent(),
            Value<bool?> private = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaListTableCompanion.insert(
            id: id,
            userId: userId,
            mediaId: mediaId,
            status: status,
            notes: notes,
            progress: progress,
            progressVolumes: progressVolumes,
            startedAt: startedAt,
            completedAt: completedAt,
            updatedAt: updatedAt,
            repeat: repeat,
            score: score,
            private: private,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaListTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $MediaListTableTable,
    MediaListEntity,
    $$MediaListTableTableFilterComposer,
    $$MediaListTableTableOrderingComposer,
    $$MediaListTableTableAnnotationComposer,
    $$MediaListTableTableCreateCompanionBuilder,
    $$MediaListTableTableUpdateCompanionBuilder,
    (
      MediaListEntity,
      BaseReferences<_$AniflowDatabase, $MediaListTableTable, MediaListEntity>
    ),
    MediaListEntity,
    PrefetchHooks Function()>;
typedef $$MediaTableTableCreateCompanionBuilder = MediaTableCompanion Function({
  required String id,
  Value<String?> type,
  Value<String?> englishTitle,
  Value<String?> romajiTitle,
  Value<String?> nativeTitle,
  Value<String?> coverImageExtraLarge,
  Value<String?> coverImageLarge,
  Value<String?> coverImageMedium,
  Value<String?> coverImageColor,
  Value<String?> description,
  Value<int?> episodes,
  Value<int?> seasonYear,
  Value<String?> season,
  Value<String?> source,
  Value<String?> status,
  Value<String?> hashtag,
  Value<String?> bannerImage,
  Value<int?> averageScore,
  Value<String?> trailerId,
  Value<String?> trailerSite,
  Value<String?> trailerThumbnail,
  Value<String?> genres,
  Value<String?> format,
  Value<int?> trending,
  Value<int?> favourites,
  Value<int?> popularRanking,
  Value<int?> ratedRanking,
  Value<int?> nextAiringEpisode,
  Value<int?> timeUntilAiring,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<bool?> isFavourite,
  Value<DateTime?> nextAiringEpisodeUpdateTime,
  Value<String?> siteUrl,
  Value<int> rowid,
});
typedef $$MediaTableTableUpdateCompanionBuilder = MediaTableCompanion Function({
  Value<String> id,
  Value<String?> type,
  Value<String?> englishTitle,
  Value<String?> romajiTitle,
  Value<String?> nativeTitle,
  Value<String?> coverImageExtraLarge,
  Value<String?> coverImageLarge,
  Value<String?> coverImageMedium,
  Value<String?> coverImageColor,
  Value<String?> description,
  Value<int?> episodes,
  Value<int?> seasonYear,
  Value<String?> season,
  Value<String?> source,
  Value<String?> status,
  Value<String?> hashtag,
  Value<String?> bannerImage,
  Value<int?> averageScore,
  Value<String?> trailerId,
  Value<String?> trailerSite,
  Value<String?> trailerThumbnail,
  Value<String?> genres,
  Value<String?> format,
  Value<int?> trending,
  Value<int?> favourites,
  Value<int?> popularRanking,
  Value<int?> ratedRanking,
  Value<int?> nextAiringEpisode,
  Value<int?> timeUntilAiring,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<bool?> isFavourite,
  Value<DateTime?> nextAiringEpisodeUpdateTime,
  Value<String?> siteUrl,
  Value<int> rowid,
});

class $$MediaTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $MediaTableTable> {
  $$MediaTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get englishTitle => $composableBuilder(
      column: $table.englishTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get romajiTitle => $composableBuilder(
      column: $table.romajiTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nativeTitle => $composableBuilder(
      column: $table.nativeTitle, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverImageExtraLarge => $composableBuilder(
      column: $table.coverImageExtraLarge,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverImageLarge => $composableBuilder(
      column: $table.coverImageLarge,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverImageMedium => $composableBuilder(
      column: $table.coverImageMedium,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get coverImageColor => $composableBuilder(
      column: $table.coverImageColor,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get episodes => $composableBuilder(
      column: $table.episodes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get seasonYear => $composableBuilder(
      column: $table.seasonYear, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get season => $composableBuilder(
      column: $table.season, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hashtag => $composableBuilder(
      column: $table.hashtag, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get bannerImage => $composableBuilder(
      column: $table.bannerImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get averageScore => $composableBuilder(
      column: $table.averageScore, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trailerId => $composableBuilder(
      column: $table.trailerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trailerSite => $composableBuilder(
      column: $table.trailerSite, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get trailerThumbnail => $composableBuilder(
      column: $table.trailerThumbnail,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get trending => $composableBuilder(
      column: $table.trending, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get favourites => $composableBuilder(
      column: $table.favourites, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get popularRanking => $composableBuilder(
      column: $table.popularRanking,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get ratedRanking => $composableBuilder(
      column: $table.ratedRanking, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nextAiringEpisode => $composableBuilder(
      column: $table.nextAiringEpisode,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeUntilAiring => $composableBuilder(
      column: $table.timeUntilAiring,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get nextAiringEpisodeUpdateTime => $composableBuilder(
      column: $table.nextAiringEpisodeUpdateTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnFilters(column));
}

class $$MediaTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $MediaTableTable> {
  $$MediaTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get englishTitle => $composableBuilder(
      column: $table.englishTitle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get romajiTitle => $composableBuilder(
      column: $table.romajiTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nativeTitle => $composableBuilder(
      column: $table.nativeTitle, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageExtraLarge => $composableBuilder(
      column: $table.coverImageExtraLarge,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageLarge => $composableBuilder(
      column: $table.coverImageLarge,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageMedium => $composableBuilder(
      column: $table.coverImageMedium,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get coverImageColor => $composableBuilder(
      column: $table.coverImageColor,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get episodes => $composableBuilder(
      column: $table.episodes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get seasonYear => $composableBuilder(
      column: $table.seasonYear, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get season => $composableBuilder(
      column: $table.season, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get source => $composableBuilder(
      column: $table.source, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hashtag => $composableBuilder(
      column: $table.hashtag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get bannerImage => $composableBuilder(
      column: $table.bannerImage, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get averageScore => $composableBuilder(
      column: $table.averageScore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trailerId => $composableBuilder(
      column: $table.trailerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trailerSite => $composableBuilder(
      column: $table.trailerSite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get trailerThumbnail => $composableBuilder(
      column: $table.trailerThumbnail,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get genres => $composableBuilder(
      column: $table.genres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get format => $composableBuilder(
      column: $table.format, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get trending => $composableBuilder(
      column: $table.trending, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get favourites => $composableBuilder(
      column: $table.favourites, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get popularRanking => $composableBuilder(
      column: $table.popularRanking,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get ratedRanking => $composableBuilder(
      column: $table.ratedRanking,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nextAiringEpisode => $composableBuilder(
      column: $table.nextAiringEpisode,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeUntilAiring => $composableBuilder(
      column: $table.timeUntilAiring,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get nextAiringEpisodeUpdateTime =>
      $composableBuilder(
          column: $table.nextAiringEpisodeUpdateTime,
          builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siteUrl => $composableBuilder(
      column: $table.siteUrl, builder: (column) => ColumnOrderings(column));
}

class $$MediaTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $MediaTableTable> {
  $$MediaTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get englishTitle => $composableBuilder(
      column: $table.englishTitle, builder: (column) => column);

  GeneratedColumn<String> get romajiTitle => $composableBuilder(
      column: $table.romajiTitle, builder: (column) => column);

  GeneratedColumn<String> get nativeTitle => $composableBuilder(
      column: $table.nativeTitle, builder: (column) => column);

  GeneratedColumn<String> get coverImageExtraLarge => $composableBuilder(
      column: $table.coverImageExtraLarge, builder: (column) => column);

  GeneratedColumn<String> get coverImageLarge => $composableBuilder(
      column: $table.coverImageLarge, builder: (column) => column);

  GeneratedColumn<String> get coverImageMedium => $composableBuilder(
      column: $table.coverImageMedium, builder: (column) => column);

  GeneratedColumn<String> get coverImageColor => $composableBuilder(
      column: $table.coverImageColor, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get episodes =>
      $composableBuilder(column: $table.episodes, builder: (column) => column);

  GeneratedColumn<int> get seasonYear => $composableBuilder(
      column: $table.seasonYear, builder: (column) => column);

  GeneratedColumn<String> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get hashtag =>
      $composableBuilder(column: $table.hashtag, builder: (column) => column);

  GeneratedColumn<String> get bannerImage => $composableBuilder(
      column: $table.bannerImage, builder: (column) => column);

  GeneratedColumn<int> get averageScore => $composableBuilder(
      column: $table.averageScore, builder: (column) => column);

  GeneratedColumn<String> get trailerId =>
      $composableBuilder(column: $table.trailerId, builder: (column) => column);

  GeneratedColumn<String> get trailerSite => $composableBuilder(
      column: $table.trailerSite, builder: (column) => column);

  GeneratedColumn<String> get trailerThumbnail => $composableBuilder(
      column: $table.trailerThumbnail, builder: (column) => column);

  GeneratedColumn<String> get genres =>
      $composableBuilder(column: $table.genres, builder: (column) => column);

  GeneratedColumn<String> get format =>
      $composableBuilder(column: $table.format, builder: (column) => column);

  GeneratedColumn<int> get trending =>
      $composableBuilder(column: $table.trending, builder: (column) => column);

  GeneratedColumn<int> get favourites => $composableBuilder(
      column: $table.favourites, builder: (column) => column);

  GeneratedColumn<int> get popularRanking => $composableBuilder(
      column: $table.popularRanking, builder: (column) => column);

  GeneratedColumn<int> get ratedRanking => $composableBuilder(
      column: $table.ratedRanking, builder: (column) => column);

  GeneratedColumn<int> get nextAiringEpisode => $composableBuilder(
      column: $table.nextAiringEpisode, builder: (column) => column);

  GeneratedColumn<int> get timeUntilAiring => $composableBuilder(
      column: $table.timeUntilAiring, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get isFavourite => $composableBuilder(
      column: $table.isFavourite, builder: (column) => column);

  GeneratedColumn<DateTime> get nextAiringEpisodeUpdateTime =>
      $composableBuilder(
          column: $table.nextAiringEpisodeUpdateTime,
          builder: (column) => column);

  GeneratedColumn<String> get siteUrl =>
      $composableBuilder(column: $table.siteUrl, builder: (column) => column);
}

class $$MediaTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $MediaTableTable,
    MediaEntity,
    $$MediaTableTableFilterComposer,
    $$MediaTableTableOrderingComposer,
    $$MediaTableTableAnnotationComposer,
    $$MediaTableTableCreateCompanionBuilder,
    $$MediaTableTableUpdateCompanionBuilder,
    (
      MediaEntity,
      BaseReferences<_$AniflowDatabase, $MediaTableTable, MediaEntity>
    ),
    MediaEntity,
    PrefetchHooks Function()> {
  $$MediaTableTableTableManager(_$AniflowDatabase db, $MediaTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<String?> englishTitle = const Value.absent(),
            Value<String?> romajiTitle = const Value.absent(),
            Value<String?> nativeTitle = const Value.absent(),
            Value<String?> coverImageExtraLarge = const Value.absent(),
            Value<String?> coverImageLarge = const Value.absent(),
            Value<String?> coverImageMedium = const Value.absent(),
            Value<String?> coverImageColor = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> episodes = const Value.absent(),
            Value<int?> seasonYear = const Value.absent(),
            Value<String?> season = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> hashtag = const Value.absent(),
            Value<String?> bannerImage = const Value.absent(),
            Value<int?> averageScore = const Value.absent(),
            Value<String?> trailerId = const Value.absent(),
            Value<String?> trailerSite = const Value.absent(),
            Value<String?> trailerThumbnail = const Value.absent(),
            Value<String?> genres = const Value.absent(),
            Value<String?> format = const Value.absent(),
            Value<int?> trending = const Value.absent(),
            Value<int?> favourites = const Value.absent(),
            Value<int?> popularRanking = const Value.absent(),
            Value<int?> ratedRanking = const Value.absent(),
            Value<int?> nextAiringEpisode = const Value.absent(),
            Value<int?> timeUntilAiring = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool?> isFavourite = const Value.absent(),
            Value<DateTime?> nextAiringEpisodeUpdateTime = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaTableCompanion(
            id: id,
            type: type,
            englishTitle: englishTitle,
            romajiTitle: romajiTitle,
            nativeTitle: nativeTitle,
            coverImageExtraLarge: coverImageExtraLarge,
            coverImageLarge: coverImageLarge,
            coverImageMedium: coverImageMedium,
            coverImageColor: coverImageColor,
            description: description,
            episodes: episodes,
            seasonYear: seasonYear,
            season: season,
            source: source,
            status: status,
            hashtag: hashtag,
            bannerImage: bannerImage,
            averageScore: averageScore,
            trailerId: trailerId,
            trailerSite: trailerSite,
            trailerThumbnail: trailerThumbnail,
            genres: genres,
            format: format,
            trending: trending,
            favourites: favourites,
            popularRanking: popularRanking,
            ratedRanking: ratedRanking,
            nextAiringEpisode: nextAiringEpisode,
            timeUntilAiring: timeUntilAiring,
            startDate: startDate,
            endDate: endDate,
            isFavourite: isFavourite,
            nextAiringEpisodeUpdateTime: nextAiringEpisodeUpdateTime,
            siteUrl: siteUrl,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> type = const Value.absent(),
            Value<String?> englishTitle = const Value.absent(),
            Value<String?> romajiTitle = const Value.absent(),
            Value<String?> nativeTitle = const Value.absent(),
            Value<String?> coverImageExtraLarge = const Value.absent(),
            Value<String?> coverImageLarge = const Value.absent(),
            Value<String?> coverImageMedium = const Value.absent(),
            Value<String?> coverImageColor = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int?> episodes = const Value.absent(),
            Value<int?> seasonYear = const Value.absent(),
            Value<String?> season = const Value.absent(),
            Value<String?> source = const Value.absent(),
            Value<String?> status = const Value.absent(),
            Value<String?> hashtag = const Value.absent(),
            Value<String?> bannerImage = const Value.absent(),
            Value<int?> averageScore = const Value.absent(),
            Value<String?> trailerId = const Value.absent(),
            Value<String?> trailerSite = const Value.absent(),
            Value<String?> trailerThumbnail = const Value.absent(),
            Value<String?> genres = const Value.absent(),
            Value<String?> format = const Value.absent(),
            Value<int?> trending = const Value.absent(),
            Value<int?> favourites = const Value.absent(),
            Value<int?> popularRanking = const Value.absent(),
            Value<int?> ratedRanking = const Value.absent(),
            Value<int?> nextAiringEpisode = const Value.absent(),
            Value<int?> timeUntilAiring = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<bool?> isFavourite = const Value.absent(),
            Value<DateTime?> nextAiringEpisodeUpdateTime = const Value.absent(),
            Value<String?> siteUrl = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaTableCompanion.insert(
            id: id,
            type: type,
            englishTitle: englishTitle,
            romajiTitle: romajiTitle,
            nativeTitle: nativeTitle,
            coverImageExtraLarge: coverImageExtraLarge,
            coverImageLarge: coverImageLarge,
            coverImageMedium: coverImageMedium,
            coverImageColor: coverImageColor,
            description: description,
            episodes: episodes,
            seasonYear: seasonYear,
            season: season,
            source: source,
            status: status,
            hashtag: hashtag,
            bannerImage: bannerImage,
            averageScore: averageScore,
            trailerId: trailerId,
            trailerSite: trailerSite,
            trailerThumbnail: trailerThumbnail,
            genres: genres,
            format: format,
            trending: trending,
            favourites: favourites,
            popularRanking: popularRanking,
            ratedRanking: ratedRanking,
            nextAiringEpisode: nextAiringEpisode,
            timeUntilAiring: timeUntilAiring,
            startDate: startDate,
            endDate: endDate,
            isFavourite: isFavourite,
            nextAiringEpisodeUpdateTime: nextAiringEpisodeUpdateTime,
            siteUrl: siteUrl,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $MediaTableTable,
    MediaEntity,
    $$MediaTableTableFilterComposer,
    $$MediaTableTableOrderingComposer,
    $$MediaTableTableAnnotationComposer,
    $$MediaTableTableCreateCompanionBuilder,
    $$MediaTableTableUpdateCompanionBuilder,
    (
      MediaEntity,
      BaseReferences<_$AniflowDatabase, $MediaTableTable, MediaEntity>
    ),
    MediaEntity,
    PrefetchHooks Function()>;
typedef $$StudioMediaCrossRefTableTableCreateCompanionBuilder
    = StudioMediaCrossRefTableCompanion Function({
  required String studioId,
  required String mediaId,
  Value<int> rowid,
});
typedef $$StudioMediaCrossRefTableTableUpdateCompanionBuilder
    = StudioMediaCrossRefTableCompanion Function({
  Value<String> studioId,
  Value<String> mediaId,
  Value<int> rowid,
});

class $$StudioMediaCrossRefTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $StudioMediaCrossRefTableTable> {
  $$StudioMediaCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get studioId => $composableBuilder(
      column: $table.studioId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));
}

class $$StudioMediaCrossRefTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $StudioMediaCrossRefTableTable> {
  $$StudioMediaCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get studioId => $composableBuilder(
      column: $table.studioId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));
}

class $$StudioMediaCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $StudioMediaCrossRefTableTable> {
  $$StudioMediaCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get studioId =>
      $composableBuilder(column: $table.studioId, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);
}

class $$StudioMediaCrossRefTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $StudioMediaCrossRefTableTable,
    StudioMediaCrossRefEntity,
    $$StudioMediaCrossRefTableTableFilterComposer,
    $$StudioMediaCrossRefTableTableOrderingComposer,
    $$StudioMediaCrossRefTableTableAnnotationComposer,
    $$StudioMediaCrossRefTableTableCreateCompanionBuilder,
    $$StudioMediaCrossRefTableTableUpdateCompanionBuilder,
    (
      StudioMediaCrossRefEntity,
      BaseReferences<_$AniflowDatabase, $StudioMediaCrossRefTableTable,
          StudioMediaCrossRefEntity>
    ),
    StudioMediaCrossRefEntity,
    PrefetchHooks Function()> {
  $$StudioMediaCrossRefTableTableTableManager(
      _$AniflowDatabase db, $StudioMediaCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudioMediaCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$StudioMediaCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudioMediaCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> studioId = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudioMediaCrossRefTableCompanion(
            studioId: studioId,
            mediaId: mediaId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String studioId,
            required String mediaId,
            Value<int> rowid = const Value.absent(),
          }) =>
              StudioMediaCrossRefTableCompanion.insert(
            studioId: studioId,
            mediaId: mediaId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudioMediaCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $StudioMediaCrossRefTableTable,
        StudioMediaCrossRefEntity,
        $$StudioMediaCrossRefTableTableFilterComposer,
        $$StudioMediaCrossRefTableTableOrderingComposer,
        $$StudioMediaCrossRefTableTableAnnotationComposer,
        $$StudioMediaCrossRefTableTableCreateCompanionBuilder,
        $$StudioMediaCrossRefTableTableUpdateCompanionBuilder,
        (
          StudioMediaCrossRefEntity,
          BaseReferences<_$AniflowDatabase, $StudioMediaCrossRefTableTable,
              StudioMediaCrossRefEntity>
        ),
        StudioMediaCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$CharacterRelatedMediaCrossRefTableTableCreateCompanionBuilder
    = CharacterRelatedMediaCrossRefTableCompanion Function({
  required String characterId,
  required String mediaId,
  Value<int> rowid,
});
typedef $$CharacterRelatedMediaCrossRefTableTableUpdateCompanionBuilder
    = CharacterRelatedMediaCrossRefTableCompanion Function({
  Value<String> characterId,
  Value<String> mediaId,
  Value<int> rowid,
});

class $$CharacterRelatedMediaCrossRefTableTableFilterComposer extends Composer<
    _$AniflowDatabase, $CharacterRelatedMediaCrossRefTableTable> {
  $$CharacterRelatedMediaCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));
}

class $$CharacterRelatedMediaCrossRefTableTableOrderingComposer
    extends Composer<_$AniflowDatabase,
        $CharacterRelatedMediaCrossRefTableTable> {
  $$CharacterRelatedMediaCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));
}

class $$CharacterRelatedMediaCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase,
        $CharacterRelatedMediaCrossRefTableTable> {
  $$CharacterRelatedMediaCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);
}

class $$CharacterRelatedMediaCrossRefTableTableTableManager
    extends RootTableManager<
        _$AniflowDatabase,
        $CharacterRelatedMediaCrossRefTableTable,
        CharacterRelatedMediaCrossRefEntity,
        $$CharacterRelatedMediaCrossRefTableTableFilterComposer,
        $$CharacterRelatedMediaCrossRefTableTableOrderingComposer,
        $$CharacterRelatedMediaCrossRefTableTableAnnotationComposer,
        $$CharacterRelatedMediaCrossRefTableTableCreateCompanionBuilder,
        $$CharacterRelatedMediaCrossRefTableTableUpdateCompanionBuilder,
        (
          CharacterRelatedMediaCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $CharacterRelatedMediaCrossRefTableTable,
              CharacterRelatedMediaCrossRefEntity>
        ),
        CharacterRelatedMediaCrossRefEntity,
        PrefetchHooks Function()> {
  $$CharacterRelatedMediaCrossRefTableTableTableManager(
      _$AniflowDatabase db, $CharacterRelatedMediaCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterRelatedMediaCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterRelatedMediaCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterRelatedMediaCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> characterId = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterRelatedMediaCrossRefTableCompanion(
            characterId: characterId,
            mediaId: mediaId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String characterId,
            required String mediaId,
            Value<int> rowid = const Value.absent(),
          }) =>
              CharacterRelatedMediaCrossRefTableCompanion.insert(
            characterId: characterId,
            mediaId: mediaId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CharacterRelatedMediaCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $CharacterRelatedMediaCrossRefTableTable,
        CharacterRelatedMediaCrossRefEntity,
        $$CharacterRelatedMediaCrossRefTableTableFilterComposer,
        $$CharacterRelatedMediaCrossRefTableTableOrderingComposer,
        $$CharacterRelatedMediaCrossRefTableTableAnnotationComposer,
        $$CharacterRelatedMediaCrossRefTableTableCreateCompanionBuilder,
        $$CharacterRelatedMediaCrossRefTableTableUpdateCompanionBuilder,
        (
          CharacterRelatedMediaCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $CharacterRelatedMediaCrossRefTableTable,
              CharacterRelatedMediaCrossRefEntity>
        ),
        CharacterRelatedMediaCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$ActivityFilterTypePagingCrossRefTableTableCreateCompanionBuilder
    = ActivityFilterTypePagingCrossRefTableCompanion Function({
  Value<int> id,
  required String activityId,
  required String category,
});
typedef $$ActivityFilterTypePagingCrossRefTableTableUpdateCompanionBuilder
    = ActivityFilterTypePagingCrossRefTableCompanion Function({
  Value<int> id,
  Value<String> activityId,
  Value<String> category,
});

class $$ActivityFilterTypePagingCrossRefTableTableFilterComposer
    extends Composer<_$AniflowDatabase,
        $ActivityFilterTypePagingCrossRefTableTable> {
  $$ActivityFilterTypePagingCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activityId => $composableBuilder(
      column: $table.activityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));
}

class $$ActivityFilterTypePagingCrossRefTableTableOrderingComposer
    extends Composer<_$AniflowDatabase,
        $ActivityFilterTypePagingCrossRefTableTable> {
  $$ActivityFilterTypePagingCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activityId => $composableBuilder(
      column: $table.activityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));
}

class $$ActivityFilterTypePagingCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase,
        $ActivityFilterTypePagingCrossRefTableTable> {
  $$ActivityFilterTypePagingCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get activityId => $composableBuilder(
      column: $table.activityId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);
}

class $$ActivityFilterTypePagingCrossRefTableTableTableManager
    extends RootTableManager<
        _$AniflowDatabase,
        $ActivityFilterTypePagingCrossRefTableTable,
        ActivityFilterTypePagingCrossRefEntity,
        $$ActivityFilterTypePagingCrossRefTableTableFilterComposer,
        $$ActivityFilterTypePagingCrossRefTableTableOrderingComposer,
        $$ActivityFilterTypePagingCrossRefTableTableAnnotationComposer,
        $$ActivityFilterTypePagingCrossRefTableTableCreateCompanionBuilder,
        $$ActivityFilterTypePagingCrossRefTableTableUpdateCompanionBuilder,
        (
          ActivityFilterTypePagingCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $ActivityFilterTypePagingCrossRefTableTable,
              ActivityFilterTypePagingCrossRefEntity>
        ),
        ActivityFilterTypePagingCrossRefEntity,
        PrefetchHooks Function()> {
  $$ActivityFilterTypePagingCrossRefTableTableTableManager(
      _$AniflowDatabase db, $ActivityFilterTypePagingCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityFilterTypePagingCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityFilterTypePagingCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityFilterTypePagingCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> activityId = const Value.absent(),
            Value<String> category = const Value.absent(),
          }) =>
              ActivityFilterTypePagingCrossRefTableCompanion(
            id: id,
            activityId: activityId,
            category: category,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String activityId,
            required String category,
          }) =>
              ActivityFilterTypePagingCrossRefTableCompanion.insert(
            id: id,
            activityId: activityId,
            category: category,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ActivityFilterTypePagingCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $ActivityFilterTypePagingCrossRefTableTable,
        ActivityFilterTypePagingCrossRefEntity,
        $$ActivityFilterTypePagingCrossRefTableTableFilterComposer,
        $$ActivityFilterTypePagingCrossRefTableTableOrderingComposer,
        $$ActivityFilterTypePagingCrossRefTableTableAnnotationComposer,
        $$ActivityFilterTypePagingCrossRefTableTableCreateCompanionBuilder,
        $$ActivityFilterTypePagingCrossRefTableTableUpdateCompanionBuilder,
        (
          ActivityFilterTypePagingCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $ActivityFilterTypePagingCrossRefTableTable,
              ActivityFilterTypePagingCrossRefEntity>
        ),
        ActivityFilterTypePagingCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$MediaCharacterPagingCrossRefTableTableCreateCompanionBuilder
    = MediaCharacterPagingCrossRefTableCompanion Function({
  required String characterId,
  required String mediaId,
  required int timeStamp,
  Value<int> rowid,
});
typedef $$MediaCharacterPagingCrossRefTableTableUpdateCompanionBuilder
    = MediaCharacterPagingCrossRefTableCompanion Function({
  Value<String> characterId,
  Value<String> mediaId,
  Value<int> timeStamp,
  Value<int> rowid,
});

class $$MediaCharacterPagingCrossRefTableTableFilterComposer extends Composer<
    _$AniflowDatabase, $MediaCharacterPagingCrossRefTableTable> {
  $$MediaCharacterPagingCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnFilters(column));
}

class $$MediaCharacterPagingCrossRefTableTableOrderingComposer extends Composer<
    _$AniflowDatabase, $MediaCharacterPagingCrossRefTableTable> {
  $$MediaCharacterPagingCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnOrderings(column));
}

class $$MediaCharacterPagingCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase,
        $MediaCharacterPagingCrossRefTableTable> {
  $$MediaCharacterPagingCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<int> get timeStamp =>
      $composableBuilder(column: $table.timeStamp, builder: (column) => column);
}

class $$MediaCharacterPagingCrossRefTableTableTableManager
    extends RootTableManager<
        _$AniflowDatabase,
        $MediaCharacterPagingCrossRefTableTable,
        MediaCharacterPagingCrossRefEntity,
        $$MediaCharacterPagingCrossRefTableTableFilterComposer,
        $$MediaCharacterPagingCrossRefTableTableOrderingComposer,
        $$MediaCharacterPagingCrossRefTableTableAnnotationComposer,
        $$MediaCharacterPagingCrossRefTableTableCreateCompanionBuilder,
        $$MediaCharacterPagingCrossRefTableTableUpdateCompanionBuilder,
        (
          MediaCharacterPagingCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $MediaCharacterPagingCrossRefTableTable,
              MediaCharacterPagingCrossRefEntity>
        ),
        MediaCharacterPagingCrossRefEntity,
        PrefetchHooks Function()> {
  $$MediaCharacterPagingCrossRefTableTableTableManager(
      _$AniflowDatabase db, $MediaCharacterPagingCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaCharacterPagingCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaCharacterPagingCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaCharacterPagingCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> characterId = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<int> timeStamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaCharacterPagingCrossRefTableCompanion(
            characterId: characterId,
            mediaId: mediaId,
            timeStamp: timeStamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String characterId,
            required String mediaId,
            required int timeStamp,
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaCharacterPagingCrossRefTableCompanion.insert(
            characterId: characterId,
            mediaId: mediaId,
            timeStamp: timeStamp,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaCharacterPagingCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $MediaCharacterPagingCrossRefTableTable,
        MediaCharacterPagingCrossRefEntity,
        $$MediaCharacterPagingCrossRefTableTableFilterComposer,
        $$MediaCharacterPagingCrossRefTableTableOrderingComposer,
        $$MediaCharacterPagingCrossRefTableTableAnnotationComposer,
        $$MediaCharacterPagingCrossRefTableTableCreateCompanionBuilder,
        $$MediaCharacterPagingCrossRefTableTableUpdateCompanionBuilder,
        (
          MediaCharacterPagingCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $MediaCharacterPagingCrossRefTableTable,
              MediaCharacterPagingCrossRefEntity>
        ),
        MediaCharacterPagingCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$CharacterVoiceActorCrossRefTableTableCreateCompanionBuilder
    = CharacterVoiceActorCrossRefTableCompanion Function({
  Value<int> id,
  required String characterId,
  required String staffId,
  required String role,
  required String language,
});
typedef $$CharacterVoiceActorCrossRefTableTableUpdateCompanionBuilder
    = CharacterVoiceActorCrossRefTableCompanion Function({
  Value<int> id,
  Value<String> characterId,
  Value<String> staffId,
  Value<String> role,
  Value<String> language,
});

class $$CharacterVoiceActorCrossRefTableTableFilterComposer extends Composer<
    _$AniflowDatabase, $CharacterVoiceActorCrossRefTableTable> {
  $$CharacterVoiceActorCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnFilters(column));
}

class $$CharacterVoiceActorCrossRefTableTableOrderingComposer extends Composer<
    _$AniflowDatabase, $CharacterVoiceActorCrossRefTableTable> {
  $$CharacterVoiceActorCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get language => $composableBuilder(
      column: $table.language, builder: (column) => ColumnOrderings(column));
}

class $$CharacterVoiceActorCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase,
        $CharacterVoiceActorCrossRefTableTable> {
  $$CharacterVoiceActorCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get characterId => $composableBuilder(
      column: $table.characterId, builder: (column) => column);

  GeneratedColumn<String> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);
}

class $$CharacterVoiceActorCrossRefTableTableTableManager
    extends RootTableManager<
        _$AniflowDatabase,
        $CharacterVoiceActorCrossRefTableTable,
        CharacterCharacterVoiceActorCrossRefEntity,
        $$CharacterVoiceActorCrossRefTableTableFilterComposer,
        $$CharacterVoiceActorCrossRefTableTableOrderingComposer,
        $$CharacterVoiceActorCrossRefTableTableAnnotationComposer,
        $$CharacterVoiceActorCrossRefTableTableCreateCompanionBuilder,
        $$CharacterVoiceActorCrossRefTableTableUpdateCompanionBuilder,
        (
          CharacterCharacterVoiceActorCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $CharacterVoiceActorCrossRefTableTable,
              CharacterCharacterVoiceActorCrossRefEntity>
        ),
        CharacterCharacterVoiceActorCrossRefEntity,
        PrefetchHooks Function()> {
  $$CharacterVoiceActorCrossRefTableTableTableManager(
      _$AniflowDatabase db, $CharacterVoiceActorCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CharacterVoiceActorCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CharacterVoiceActorCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CharacterVoiceActorCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> characterId = const Value.absent(),
            Value<String> staffId = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String> language = const Value.absent(),
          }) =>
              CharacterVoiceActorCrossRefTableCompanion(
            id: id,
            characterId: characterId,
            staffId: staffId,
            role: role,
            language: language,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String characterId,
            required String staffId,
            required String role,
            required String language,
          }) =>
              CharacterVoiceActorCrossRefTableCompanion.insert(
            id: id,
            characterId: characterId,
            staffId: staffId,
            role: role,
            language: language,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CharacterVoiceActorCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $CharacterVoiceActorCrossRefTableTable,
        CharacterCharacterVoiceActorCrossRefEntity,
        $$CharacterVoiceActorCrossRefTableTableFilterComposer,
        $$CharacterVoiceActorCrossRefTableTableOrderingComposer,
        $$CharacterVoiceActorCrossRefTableTableAnnotationComposer,
        $$CharacterVoiceActorCrossRefTableTableCreateCompanionBuilder,
        $$CharacterVoiceActorCrossRefTableTableUpdateCompanionBuilder,
        (
          CharacterCharacterVoiceActorCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $CharacterVoiceActorCrossRefTableTable,
              CharacterCharacterVoiceActorCrossRefEntity>
        ),
        CharacterCharacterVoiceActorCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$MediaRelationCrossRefTableTableCreateCompanionBuilder
    = MediaRelationCrossRefTableCompanion Function({
  required String ownerId,
  required String relationId,
  required String relationType,
  Value<int> rowid,
});
typedef $$MediaRelationCrossRefTableTableUpdateCompanionBuilder
    = MediaRelationCrossRefTableCompanion Function({
  Value<String> ownerId,
  Value<String> relationId,
  Value<String> relationType,
  Value<int> rowid,
});

class $$MediaRelationCrossRefTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $MediaRelationCrossRefTableTable> {
  $$MediaRelationCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relationId => $composableBuilder(
      column: $table.relationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relationType => $composableBuilder(
      column: $table.relationType, builder: (column) => ColumnFilters(column));
}

class $$MediaRelationCrossRefTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $MediaRelationCrossRefTableTable> {
  $$MediaRelationCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get ownerId => $composableBuilder(
      column: $table.ownerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relationId => $composableBuilder(
      column: $table.relationId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relationType => $composableBuilder(
      column: $table.relationType,
      builder: (column) => ColumnOrderings(column));
}

class $$MediaRelationCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $MediaRelationCrossRefTableTable> {
  $$MediaRelationCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get relationId => $composableBuilder(
      column: $table.relationId, builder: (column) => column);

  GeneratedColumn<String> get relationType => $composableBuilder(
      column: $table.relationType, builder: (column) => column);
}

class $$MediaRelationCrossRefTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $MediaRelationCrossRefTableTable,
    MediaRelationCrossRefEntity,
    $$MediaRelationCrossRefTableTableFilterComposer,
    $$MediaRelationCrossRefTableTableOrderingComposer,
    $$MediaRelationCrossRefTableTableAnnotationComposer,
    $$MediaRelationCrossRefTableTableCreateCompanionBuilder,
    $$MediaRelationCrossRefTableTableUpdateCompanionBuilder,
    (
      MediaRelationCrossRefEntity,
      BaseReferences<_$AniflowDatabase, $MediaRelationCrossRefTableTable,
          MediaRelationCrossRefEntity>
    ),
    MediaRelationCrossRefEntity,
    PrefetchHooks Function()> {
  $$MediaRelationCrossRefTableTableTableManager(
      _$AniflowDatabase db, $MediaRelationCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaRelationCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaRelationCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaRelationCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> ownerId = const Value.absent(),
            Value<String> relationId = const Value.absent(),
            Value<String> relationType = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaRelationCrossRefTableCompanion(
            ownerId: ownerId,
            relationId: relationId,
            relationType: relationType,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String ownerId,
            required String relationId,
            required String relationType,
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaRelationCrossRefTableCompanion.insert(
            ownerId: ownerId,
            relationId: relationId,
            relationType: relationType,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaRelationCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $MediaRelationCrossRefTableTable,
        MediaRelationCrossRefEntity,
        $$MediaRelationCrossRefTableTableFilterComposer,
        $$MediaRelationCrossRefTableTableOrderingComposer,
        $$MediaRelationCrossRefTableTableAnnotationComposer,
        $$MediaRelationCrossRefTableTableCreateCompanionBuilder,
        $$MediaRelationCrossRefTableTableUpdateCompanionBuilder,
        (
          MediaRelationCrossRefEntity,
          BaseReferences<_$AniflowDatabase, $MediaRelationCrossRefTableTable,
              MediaRelationCrossRefEntity>
        ),
        MediaRelationCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$MediaStaffPagingCrossRefTableTableCreateCompanionBuilder
    = MediaStaffPagingCrossRefTableCompanion Function({
  required String staffId,
  required String mediaId,
  required String staffRole,
  required int timeStamp,
  Value<int> rowid,
});
typedef $$MediaStaffPagingCrossRefTableTableUpdateCompanionBuilder
    = MediaStaffPagingCrossRefTableCompanion Function({
  Value<String> staffId,
  Value<String> mediaId,
  Value<String> staffRole,
  Value<int> timeStamp,
  Value<int> rowid,
});

class $$MediaStaffPagingCrossRefTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $MediaStaffPagingCrossRefTableTable> {
  $$MediaStaffPagingCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get staffRole => $composableBuilder(
      column: $table.staffRole, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnFilters(column));
}

class $$MediaStaffPagingCrossRefTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $MediaStaffPagingCrossRefTableTable> {
  $$MediaStaffPagingCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get staffId => $composableBuilder(
      column: $table.staffId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get staffRole => $composableBuilder(
      column: $table.staffRole, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnOrderings(column));
}

class $$MediaStaffPagingCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $MediaStaffPagingCrossRefTableTable> {
  $$MediaStaffPagingCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get staffId =>
      $composableBuilder(column: $table.staffId, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get staffRole =>
      $composableBuilder(column: $table.staffRole, builder: (column) => column);

  GeneratedColumn<int> get timeStamp =>
      $composableBuilder(column: $table.timeStamp, builder: (column) => column);
}

class $$MediaStaffPagingCrossRefTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $MediaStaffPagingCrossRefTableTable,
    MediaStaffPagingCrossRefEntity,
    $$MediaStaffPagingCrossRefTableTableFilterComposer,
    $$MediaStaffPagingCrossRefTableTableOrderingComposer,
    $$MediaStaffPagingCrossRefTableTableAnnotationComposer,
    $$MediaStaffPagingCrossRefTableTableCreateCompanionBuilder,
    $$MediaStaffPagingCrossRefTableTableUpdateCompanionBuilder,
    (
      MediaStaffPagingCrossRefEntity,
      BaseReferences<_$AniflowDatabase, $MediaStaffPagingCrossRefTableTable,
          MediaStaffPagingCrossRefEntity>
    ),
    MediaStaffPagingCrossRefEntity,
    PrefetchHooks Function()> {
  $$MediaStaffPagingCrossRefTableTableTableManager(
      _$AniflowDatabase db, $MediaStaffPagingCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaStaffPagingCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaStaffPagingCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaStaffPagingCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> staffId = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<String> staffRole = const Value.absent(),
            Value<int> timeStamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaStaffPagingCrossRefTableCompanion(
            staffId: staffId,
            mediaId: mediaId,
            staffRole: staffRole,
            timeStamp: timeStamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String staffId,
            required String mediaId,
            required String staffRole,
            required int timeStamp,
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaStaffPagingCrossRefTableCompanion.insert(
            staffId: staffId,
            mediaId: mediaId,
            staffRole: staffRole,
            timeStamp: timeStamp,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaStaffPagingCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $MediaStaffPagingCrossRefTableTable,
        MediaStaffPagingCrossRefEntity,
        $$MediaStaffPagingCrossRefTableTableFilterComposer,
        $$MediaStaffPagingCrossRefTableTableOrderingComposer,
        $$MediaStaffPagingCrossRefTableTableAnnotationComposer,
        $$MediaStaffPagingCrossRefTableTableCreateCompanionBuilder,
        $$MediaStaffPagingCrossRefTableTableUpdateCompanionBuilder,
        (
          MediaStaffPagingCrossRefEntity,
          BaseReferences<_$AniflowDatabase, $MediaStaffPagingCrossRefTableTable,
              MediaStaffPagingCrossRefEntity>
        ),
        MediaStaffPagingCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$MediaExternalLinkTableTableCreateCompanionBuilder
    = MediaExternalLinkTableCompanion Function({
  required String id,
  required String mediaId,
  Value<String?> url,
  Value<String?> site,
  Value<String?> type,
  Value<int?> siteId,
  Value<String?> color,
  Value<String?> icon,
  Value<int> rowid,
});
typedef $$MediaExternalLinkTableTableUpdateCompanionBuilder
    = MediaExternalLinkTableCompanion Function({
  Value<String> id,
  Value<String> mediaId,
  Value<String?> url,
  Value<String?> site,
  Value<String?> type,
  Value<int?> siteId,
  Value<String?> color,
  Value<String?> icon,
  Value<int> rowid,
});

class $$MediaExternalLinkTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $MediaExternalLinkTableTable> {
  $$MediaExternalLinkTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get site => $composableBuilder(
      column: $table.site, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get siteId => $composableBuilder(
      column: $table.siteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));
}

class $$MediaExternalLinkTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $MediaExternalLinkTableTable> {
  $$MediaExternalLinkTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get site => $composableBuilder(
      column: $table.site, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get siteId => $composableBuilder(
      column: $table.siteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));
}

class $$MediaExternalLinkTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $MediaExternalLinkTableTable> {
  $$MediaExternalLinkTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get site =>
      $composableBuilder(column: $table.site, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get siteId =>
      $composableBuilder(column: $table.siteId, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);
}

class $$MediaExternalLinkTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $MediaExternalLinkTableTable,
    MediaExternalLinkEntity,
    $$MediaExternalLinkTableTableFilterComposer,
    $$MediaExternalLinkTableTableOrderingComposer,
    $$MediaExternalLinkTableTableAnnotationComposer,
    $$MediaExternalLinkTableTableCreateCompanionBuilder,
    $$MediaExternalLinkTableTableUpdateCompanionBuilder,
    (
      MediaExternalLinkEntity,
      BaseReferences<_$AniflowDatabase, $MediaExternalLinkTableTable,
          MediaExternalLinkEntity>
    ),
    MediaExternalLinkEntity,
    PrefetchHooks Function()> {
  $$MediaExternalLinkTableTableTableManager(
      _$AniflowDatabase db, $MediaExternalLinkTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaExternalLinkTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaExternalLinkTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaExternalLinkTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> mediaId = const Value.absent(),
            Value<String?> url = const Value.absent(),
            Value<String?> site = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> siteId = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaExternalLinkTableCompanion(
            id: id,
            mediaId: mediaId,
            url: url,
            site: site,
            type: type,
            siteId: siteId,
            color: color,
            icon: icon,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String mediaId,
            Value<String?> url = const Value.absent(),
            Value<String?> site = const Value.absent(),
            Value<String?> type = const Value.absent(),
            Value<int?> siteId = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<String?> icon = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaExternalLinkTableCompanion.insert(
            id: id,
            mediaId: mediaId,
            url: url,
            site: site,
            type: type,
            siteId: siteId,
            color: color,
            icon: icon,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaExternalLinkTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $MediaExternalLinkTableTable,
        MediaExternalLinkEntity,
        $$MediaExternalLinkTableTableFilterComposer,
        $$MediaExternalLinkTableTableOrderingComposer,
        $$MediaExternalLinkTableTableAnnotationComposer,
        $$MediaExternalLinkTableTableCreateCompanionBuilder,
        $$MediaExternalLinkTableTableUpdateCompanionBuilder,
        (
          MediaExternalLinkEntity,
          BaseReferences<_$AniflowDatabase, $MediaExternalLinkTableTable,
              MediaExternalLinkEntity>
        ),
        MediaExternalLinkEntity,
        PrefetchHooks Function()>;
typedef $$CategoryMediaPagingCrossRefTableTableCreateCompanionBuilder
    = CategoryMediaPagingCrossRefTableCompanion Function({
  required String mediaId,
  required String category,
  required int timeStamp,
  Value<int> rowid,
});
typedef $$CategoryMediaPagingCrossRefTableTableUpdateCompanionBuilder
    = CategoryMediaPagingCrossRefTableCompanion Function({
  Value<String> mediaId,
  Value<String> category,
  Value<int> timeStamp,
  Value<int> rowid,
});

class $$CategoryMediaPagingCrossRefTableTableFilterComposer extends Composer<
    _$AniflowDatabase, $CategoryMediaPagingCrossRefTableTable> {
  $$CategoryMediaPagingCrossRefTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnFilters(column));
}

class $$CategoryMediaPagingCrossRefTableTableOrderingComposer extends Composer<
    _$AniflowDatabase, $CategoryMediaPagingCrossRefTableTable> {
  $$CategoryMediaPagingCrossRefTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get timeStamp => $composableBuilder(
      column: $table.timeStamp, builder: (column) => ColumnOrderings(column));
}

class $$CategoryMediaPagingCrossRefTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase,
        $CategoryMediaPagingCrossRefTableTable> {
  $$CategoryMediaPagingCrossRefTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get timeStamp =>
      $composableBuilder(column: $table.timeStamp, builder: (column) => column);
}

class $$CategoryMediaPagingCrossRefTableTableTableManager
    extends RootTableManager<
        _$AniflowDatabase,
        $CategoryMediaPagingCrossRefTableTable,
        CategoryMediaPagingCrossRefEntity,
        $$CategoryMediaPagingCrossRefTableTableFilterComposer,
        $$CategoryMediaPagingCrossRefTableTableOrderingComposer,
        $$CategoryMediaPagingCrossRefTableTableAnnotationComposer,
        $$CategoryMediaPagingCrossRefTableTableCreateCompanionBuilder,
        $$CategoryMediaPagingCrossRefTableTableUpdateCompanionBuilder,
        (
          CategoryMediaPagingCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $CategoryMediaPagingCrossRefTableTable,
              CategoryMediaPagingCrossRefEntity>
        ),
        CategoryMediaPagingCrossRefEntity,
        PrefetchHooks Function()> {
  $$CategoryMediaPagingCrossRefTableTableTableManager(
      _$AniflowDatabase db, $CategoryMediaPagingCrossRefTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoryMediaPagingCrossRefTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoryMediaPagingCrossRefTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoryMediaPagingCrossRefTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> mediaId = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> timeStamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryMediaPagingCrossRefTableCompanion(
            mediaId: mediaId,
            category: category,
            timeStamp: timeStamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String mediaId,
            required String category,
            required int timeStamp,
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryMediaPagingCrossRefTableCompanion.insert(
            mediaId: mediaId,
            category: category,
            timeStamp: timeStamp,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CategoryMediaPagingCrossRefTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $CategoryMediaPagingCrossRefTableTable,
        CategoryMediaPagingCrossRefEntity,
        $$CategoryMediaPagingCrossRefTableTableFilterComposer,
        $$CategoryMediaPagingCrossRefTableTableOrderingComposer,
        $$CategoryMediaPagingCrossRefTableTableAnnotationComposer,
        $$CategoryMediaPagingCrossRefTableTableCreateCompanionBuilder,
        $$CategoryMediaPagingCrossRefTableTableUpdateCompanionBuilder,
        (
          CategoryMediaPagingCrossRefEntity,
          BaseReferences<
              _$AniflowDatabase,
              $CategoryMediaPagingCrossRefTableTable,
              CategoryMediaPagingCrossRefEntity>
        ),
        CategoryMediaPagingCrossRefEntity,
        PrefetchHooks Function()>;
typedef $$FavoriteInfoTableTableCreateCompanionBuilder
    = FavoriteInfoTableCompanion Function({
  Value<int> id,
  required String favoriteType,
  required String infoId,
  required String userId,
});
typedef $$FavoriteInfoTableTableUpdateCompanionBuilder
    = FavoriteInfoTableCompanion Function({
  Value<int> id,
  Value<String> favoriteType,
  Value<String> infoId,
  Value<String> userId,
});

class $$FavoriteInfoTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $FavoriteInfoTableTable> {
  $$FavoriteInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get favoriteType => $composableBuilder(
      column: $table.favoriteType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get infoId => $composableBuilder(
      column: $table.infoId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnFilters(column));
}

class $$FavoriteInfoTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $FavoriteInfoTableTable> {
  $$FavoriteInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get favoriteType => $composableBuilder(
      column: $table.favoriteType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get infoId => $composableBuilder(
      column: $table.infoId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get userId => $composableBuilder(
      column: $table.userId, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteInfoTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $FavoriteInfoTableTable> {
  $$FavoriteInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get favoriteType => $composableBuilder(
      column: $table.favoriteType, builder: (column) => column);

  GeneratedColumn<String> get infoId =>
      $composableBuilder(column: $table.infoId, builder: (column) => column);

  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);
}

class $$FavoriteInfoTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $FavoriteInfoTableTable,
    FavoriteInfoEntity,
    $$FavoriteInfoTableTableFilterComposer,
    $$FavoriteInfoTableTableOrderingComposer,
    $$FavoriteInfoTableTableAnnotationComposer,
    $$FavoriteInfoTableTableCreateCompanionBuilder,
    $$FavoriteInfoTableTableUpdateCompanionBuilder,
    (
      FavoriteInfoEntity,
      BaseReferences<_$AniflowDatabase, $FavoriteInfoTableTable,
          FavoriteInfoEntity>
    ),
    FavoriteInfoEntity,
    PrefetchHooks Function()> {
  $$FavoriteInfoTableTableTableManager(
      _$AniflowDatabase db, $FavoriteInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteInfoTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> favoriteType = const Value.absent(),
            Value<String> infoId = const Value.absent(),
            Value<String> userId = const Value.absent(),
          }) =>
              FavoriteInfoTableCompanion(
            id: id,
            favoriteType: favoriteType,
            infoId: infoId,
            userId: userId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String favoriteType,
            required String infoId,
            required String userId,
          }) =>
              FavoriteInfoTableCompanion.insert(
            id: id,
            favoriteType: favoriteType,
            infoId: infoId,
            userId: userId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $FavoriteInfoTableTable,
    FavoriteInfoEntity,
    $$FavoriteInfoTableTableFilterComposer,
    $$FavoriteInfoTableTableOrderingComposer,
    $$FavoriteInfoTableTableAnnotationComposer,
    $$FavoriteInfoTableTableCreateCompanionBuilder,
    $$FavoriteInfoTableTableUpdateCompanionBuilder,
    (
      FavoriteInfoEntity,
      BaseReferences<_$AniflowDatabase, $FavoriteInfoTableTable,
          FavoriteInfoEntity>
    ),
    FavoriteInfoEntity,
    PrefetchHooks Function()>;
typedef $$EpisodeTableTableCreateCompanionBuilder = EpisodeTableCompanion
    Function({
  Value<int?> id,
  required String animeId,
  required String title,
  required String episodeNum,
  required String playSourceType,
  required String playSourceId,
  required String playSourceSiteUrl,
  Value<String?> playableLink,
});
typedef $$EpisodeTableTableUpdateCompanionBuilder = EpisodeTableCompanion
    Function({
  Value<int?> id,
  Value<String> animeId,
  Value<String> title,
  Value<String> episodeNum,
  Value<String> playSourceType,
  Value<String> playSourceId,
  Value<String> playSourceSiteUrl,
  Value<String?> playableLink,
});

class $$EpisodeTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $EpisodeTableTable> {
  $$EpisodeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get animeId => $composableBuilder(
      column: $table.animeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get episodeNum => $composableBuilder(
      column: $table.episodeNum, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playSourceType => $composableBuilder(
      column: $table.playSourceType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playSourceId => $composableBuilder(
      column: $table.playSourceId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playSourceSiteUrl => $composableBuilder(
      column: $table.playSourceSiteUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get playableLink => $composableBuilder(
      column: $table.playableLink, builder: (column) => ColumnFilters(column));
}

class $$EpisodeTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $EpisodeTableTable> {
  $$EpisodeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get animeId => $composableBuilder(
      column: $table.animeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get episodeNum => $composableBuilder(
      column: $table.episodeNum, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playSourceType => $composableBuilder(
      column: $table.playSourceType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playSourceId => $composableBuilder(
      column: $table.playSourceId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playSourceSiteUrl => $composableBuilder(
      column: $table.playSourceSiteUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get playableLink => $composableBuilder(
      column: $table.playableLink,
      builder: (column) => ColumnOrderings(column));
}

class $$EpisodeTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $EpisodeTableTable> {
  $$EpisodeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get animeId =>
      $composableBuilder(column: $table.animeId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get episodeNum => $composableBuilder(
      column: $table.episodeNum, builder: (column) => column);

  GeneratedColumn<String> get playSourceType => $composableBuilder(
      column: $table.playSourceType, builder: (column) => column);

  GeneratedColumn<String> get playSourceId => $composableBuilder(
      column: $table.playSourceId, builder: (column) => column);

  GeneratedColumn<String> get playSourceSiteUrl => $composableBuilder(
      column: $table.playSourceSiteUrl, builder: (column) => column);

  GeneratedColumn<String> get playableLink => $composableBuilder(
      column: $table.playableLink, builder: (column) => column);
}

class $$EpisodeTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $EpisodeTableTable,
    EpisodeEntity,
    $$EpisodeTableTableFilterComposer,
    $$EpisodeTableTableOrderingComposer,
    $$EpisodeTableTableAnnotationComposer,
    $$EpisodeTableTableCreateCompanionBuilder,
    $$EpisodeTableTableUpdateCompanionBuilder,
    (
      EpisodeEntity,
      BaseReferences<_$AniflowDatabase, $EpisodeTableTable, EpisodeEntity>
    ),
    EpisodeEntity,
    PrefetchHooks Function()> {
  $$EpisodeTableTableTableManager(
      _$AniflowDatabase db, $EpisodeTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EpisodeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EpisodeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EpisodeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> animeId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> episodeNum = const Value.absent(),
            Value<String> playSourceType = const Value.absent(),
            Value<String> playSourceId = const Value.absent(),
            Value<String> playSourceSiteUrl = const Value.absent(),
            Value<String?> playableLink = const Value.absent(),
          }) =>
              EpisodeTableCompanion(
            id: id,
            animeId: animeId,
            title: title,
            episodeNum: episodeNum,
            playSourceType: playSourceType,
            playSourceId: playSourceId,
            playSourceSiteUrl: playSourceSiteUrl,
            playableLink: playableLink,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String animeId,
            required String title,
            required String episodeNum,
            required String playSourceType,
            required String playSourceId,
            required String playSourceSiteUrl,
            Value<String?> playableLink = const Value.absent(),
          }) =>
              EpisodeTableCompanion.insert(
            id: id,
            animeId: animeId,
            title: title,
            episodeNum: episodeNum,
            playSourceType: playSourceType,
            playSourceId: playSourceId,
            playSourceSiteUrl: playSourceSiteUrl,
            playableLink: playableLink,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EpisodeTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $EpisodeTableTable,
    EpisodeEntity,
    $$EpisodeTableTableFilterComposer,
    $$EpisodeTableTableOrderingComposer,
    $$EpisodeTableTableAnnotationComposer,
    $$EpisodeTableTableCreateCompanionBuilder,
    $$EpisodeTableTableUpdateCompanionBuilder,
    (
      EpisodeEntity,
      BaseReferences<_$AniflowDatabase, $EpisodeTableTable, EpisodeEntity>
    ),
    EpisodeEntity,
    PrefetchHooks Function()>;
typedef $$ReleasedPackageTableTableCreateCompanionBuilder
    = ReleasedPackageTableCompanion Function({
  Value<int?> id,
  required String apkDownloadUrl,
  required String tagName,
});
typedef $$ReleasedPackageTableTableUpdateCompanionBuilder
    = ReleasedPackageTableCompanion Function({
  Value<int?> id,
  Value<String> apkDownloadUrl,
  Value<String> tagName,
});

class $$ReleasedPackageTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $ReleasedPackageTableTable> {
  $$ReleasedPackageTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get apkDownloadUrl => $composableBuilder(
      column: $table.apkDownloadUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tagName => $composableBuilder(
      column: $table.tagName, builder: (column) => ColumnFilters(column));
}

class $$ReleasedPackageTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $ReleasedPackageTableTable> {
  $$ReleasedPackageTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get apkDownloadUrl => $composableBuilder(
      column: $table.apkDownloadUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tagName => $composableBuilder(
      column: $table.tagName, builder: (column) => ColumnOrderings(column));
}

class $$ReleasedPackageTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $ReleasedPackageTableTable> {
  $$ReleasedPackageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get apkDownloadUrl => $composableBuilder(
      column: $table.apkDownloadUrl, builder: (column) => column);

  GeneratedColumn<String> get tagName =>
      $composableBuilder(column: $table.tagName, builder: (column) => column);
}

class $$ReleasedPackageTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $ReleasedPackageTableTable,
    ReleasedPackageEntity,
    $$ReleasedPackageTableTableFilterComposer,
    $$ReleasedPackageTableTableOrderingComposer,
    $$ReleasedPackageTableTableAnnotationComposer,
    $$ReleasedPackageTableTableCreateCompanionBuilder,
    $$ReleasedPackageTableTableUpdateCompanionBuilder,
    (
      ReleasedPackageEntity,
      BaseReferences<_$AniflowDatabase, $ReleasedPackageTableTable,
          ReleasedPackageEntity>
    ),
    ReleasedPackageEntity,
    PrefetchHooks Function()> {
  $$ReleasedPackageTableTableTableManager(
      _$AniflowDatabase db, $ReleasedPackageTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReleasedPackageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReleasedPackageTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReleasedPackageTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            Value<String> apkDownloadUrl = const Value.absent(),
            Value<String> tagName = const Value.absent(),
          }) =>
              ReleasedPackageTableCompanion(
            id: id,
            apkDownloadUrl: apkDownloadUrl,
            tagName: tagName,
          ),
          createCompanionCallback: ({
            Value<int?> id = const Value.absent(),
            required String apkDownloadUrl,
            required String tagName,
          }) =>
              ReleasedPackageTableCompanion.insert(
            id: id,
            apkDownloadUrl: apkDownloadUrl,
            tagName: tagName,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ReleasedPackageTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $ReleasedPackageTableTable,
        ReleasedPackageEntity,
        $$ReleasedPackageTableTableFilterComposer,
        $$ReleasedPackageTableTableOrderingComposer,
        $$ReleasedPackageTableTableAnnotationComposer,
        $$ReleasedPackageTableTableCreateCompanionBuilder,
        $$ReleasedPackageTableTableUpdateCompanionBuilder,
        (
          ReleasedPackageEntity,
          BaseReferences<_$AniflowDatabase, $ReleasedPackageTableTable,
              ReleasedPackageEntity>
        ),
        ReleasedPackageEntity,
        PrefetchHooks Function()>;
typedef $$MediaAiringScheduleUpdatedTableTableCreateCompanionBuilder
    = MediaAiringScheduleUpdatedTableCompanion Function({
  required String updatedMediaId,
  required DateTime updateTime,
  Value<int> rowid,
});
typedef $$MediaAiringScheduleUpdatedTableTableUpdateCompanionBuilder
    = MediaAiringScheduleUpdatedTableCompanion Function({
  Value<String> updatedMediaId,
  Value<DateTime> updateTime,
  Value<int> rowid,
});

class $$MediaAiringScheduleUpdatedTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $MediaAiringScheduleUpdatedTableTable> {
  $$MediaAiringScheduleUpdatedTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get updatedMediaId => $composableBuilder(
      column: $table.updatedMediaId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => ColumnFilters(column));
}

class $$MediaAiringScheduleUpdatedTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $MediaAiringScheduleUpdatedTableTable> {
  $$MediaAiringScheduleUpdatedTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get updatedMediaId => $composableBuilder(
      column: $table.updatedMediaId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => ColumnOrderings(column));
}

class $$MediaAiringScheduleUpdatedTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $MediaAiringScheduleUpdatedTableTable> {
  $$MediaAiringScheduleUpdatedTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get updatedMediaId => $composableBuilder(
      column: $table.updatedMediaId, builder: (column) => column);

  GeneratedColumn<DateTime> get updateTime => $composableBuilder(
      column: $table.updateTime, builder: (column) => column);
}

class $$MediaAiringScheduleUpdatedTableTableTableManager
    extends RootTableManager<
        _$AniflowDatabase,
        $MediaAiringScheduleUpdatedTableTable,
        MediaAiringScheduleUpdatedEntity,
        $$MediaAiringScheduleUpdatedTableTableFilterComposer,
        $$MediaAiringScheduleUpdatedTableTableOrderingComposer,
        $$MediaAiringScheduleUpdatedTableTableAnnotationComposer,
        $$MediaAiringScheduleUpdatedTableTableCreateCompanionBuilder,
        $$MediaAiringScheduleUpdatedTableTableUpdateCompanionBuilder,
        (
          MediaAiringScheduleUpdatedEntity,
          BaseReferences<
              _$AniflowDatabase,
              $MediaAiringScheduleUpdatedTableTable,
              MediaAiringScheduleUpdatedEntity>
        ),
        MediaAiringScheduleUpdatedEntity,
        PrefetchHooks Function()> {
  $$MediaAiringScheduleUpdatedTableTableTableManager(
      _$AniflowDatabase db, $MediaAiringScheduleUpdatedTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MediaAiringScheduleUpdatedTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$MediaAiringScheduleUpdatedTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MediaAiringScheduleUpdatedTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> updatedMediaId = const Value.absent(),
            Value<DateTime> updateTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaAiringScheduleUpdatedTableCompanion(
            updatedMediaId: updatedMediaId,
            updateTime: updateTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String updatedMediaId,
            required DateTime updateTime,
            Value<int> rowid = const Value.absent(),
          }) =>
              MediaAiringScheduleUpdatedTableCompanion.insert(
            updatedMediaId: updatedMediaId,
            updateTime: updateTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MediaAiringScheduleUpdatedTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AniflowDatabase,
        $MediaAiringScheduleUpdatedTableTable,
        MediaAiringScheduleUpdatedEntity,
        $$MediaAiringScheduleUpdatedTableTableFilterComposer,
        $$MediaAiringScheduleUpdatedTableTableOrderingComposer,
        $$MediaAiringScheduleUpdatedTableTableAnnotationComposer,
        $$MediaAiringScheduleUpdatedTableTableCreateCompanionBuilder,
        $$MediaAiringScheduleUpdatedTableTableUpdateCompanionBuilder,
        (
          MediaAiringScheduleUpdatedEntity,
          BaseReferences<
              _$AniflowDatabase,
              $MediaAiringScheduleUpdatedTableTable,
              MediaAiringScheduleUpdatedEntity>
        ),
        MediaAiringScheduleUpdatedEntity,
        PrefetchHooks Function()>;
typedef $$SearchResultTableTableCreateCompanionBuilder
    = SearchResultTableCompanion Function({
  required String mediaId,
  required String mediaSource,
  required String cache,
  Value<int> rowid,
});
typedef $$SearchResultTableTableUpdateCompanionBuilder
    = SearchResultTableCompanion Function({
  Value<String> mediaId,
  Value<String> mediaSource,
  Value<String> cache,
  Value<int> rowid,
});

class $$SearchResultTableTableFilterComposer
    extends Composer<_$AniflowDatabase, $SearchResultTableTable> {
  $$SearchResultTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mediaSource => $composableBuilder(
      column: $table.mediaSource, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get cache => $composableBuilder(
      column: $table.cache, builder: (column) => ColumnFilters(column));
}

class $$SearchResultTableTableOrderingComposer
    extends Composer<_$AniflowDatabase, $SearchResultTableTable> {
  $$SearchResultTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mediaId => $composableBuilder(
      column: $table.mediaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mediaSource => $composableBuilder(
      column: $table.mediaSource, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get cache => $composableBuilder(
      column: $table.cache, builder: (column) => ColumnOrderings(column));
}

class $$SearchResultTableTableAnnotationComposer
    extends Composer<_$AniflowDatabase, $SearchResultTableTable> {
  $$SearchResultTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mediaId =>
      $composableBuilder(column: $table.mediaId, builder: (column) => column);

  GeneratedColumn<String> get mediaSource => $composableBuilder(
      column: $table.mediaSource, builder: (column) => column);

  GeneratedColumn<String> get cache =>
      $composableBuilder(column: $table.cache, builder: (column) => column);
}

class $$SearchResultTableTableTableManager extends RootTableManager<
    _$AniflowDatabase,
    $SearchResultTableTable,
    SearchResultEntity,
    $$SearchResultTableTableFilterComposer,
    $$SearchResultTableTableOrderingComposer,
    $$SearchResultTableTableAnnotationComposer,
    $$SearchResultTableTableCreateCompanionBuilder,
    $$SearchResultTableTableUpdateCompanionBuilder,
    (
      SearchResultEntity,
      BaseReferences<_$AniflowDatabase, $SearchResultTableTable,
          SearchResultEntity>
    ),
    SearchResultEntity,
    PrefetchHooks Function()> {
  $$SearchResultTableTableTableManager(
      _$AniflowDatabase db, $SearchResultTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchResultTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchResultTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchResultTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> mediaId = const Value.absent(),
            Value<String> mediaSource = const Value.absent(),
            Value<String> cache = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchResultTableCompanion(
            mediaId: mediaId,
            mediaSource: mediaSource,
            cache: cache,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String mediaId,
            required String mediaSource,
            required String cache,
            Value<int> rowid = const Value.absent(),
          }) =>
              SearchResultTableCompanion.insert(
            mediaId: mediaId,
            mediaSource: mediaSource,
            cache: cache,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SearchResultTableTableProcessedTableManager = ProcessedTableManager<
    _$AniflowDatabase,
    $SearchResultTableTable,
    SearchResultEntity,
    $$SearchResultTableTableFilterComposer,
    $$SearchResultTableTableOrderingComposer,
    $$SearchResultTableTableAnnotationComposer,
    $$SearchResultTableTableCreateCompanionBuilder,
    $$SearchResultTableTableUpdateCompanionBuilder,
    (
      SearchResultEntity,
      BaseReferences<_$AniflowDatabase, $SearchResultTableTable,
          SearchResultEntity>
    ),
    SearchResultEntity,
    PrefetchHooks Function()>;

class $AniflowDatabaseManager {
  final _$AniflowDatabase _db;
  $AniflowDatabaseManager(this._db);
  $$UserTableTableTableManager get userTable =>
      $$UserTableTableTableManager(_db, _db.userTable);
  $$StudioTableTableTableManager get studioTable =>
      $$StudioTableTableTableManager(_db, _db.studioTable);
  $$StaffTableTableTableManager get staffTable =>
      $$StaffTableTableTableManager(_db, _db.staffTable);
  $$ActivityTableTableTableManager get activityTable =>
      $$ActivityTableTableTableManager(_db, _db.activityTable);
  $$AiringScheduleTableTableTableManager get airingScheduleTable =>
      $$AiringScheduleTableTableTableManager(_db, _db.airingScheduleTable);
  $$CharacterTableTableTableManager get characterTable =>
      $$CharacterTableTableTableManager(_db, _db.characterTable);
  $$MediaListTableTableTableManager get mediaListTable =>
      $$MediaListTableTableTableManager(_db, _db.mediaListTable);
  $$MediaTableTableTableManager get mediaTable =>
      $$MediaTableTableTableManager(_db, _db.mediaTable);
  $$StudioMediaCrossRefTableTableTableManager get studioMediaCrossRefTable =>
      $$StudioMediaCrossRefTableTableTableManager(
          _db, _db.studioMediaCrossRefTable);
  $$CharacterRelatedMediaCrossRefTableTableTableManager
      get characterRelatedMediaCrossRefTable =>
          $$CharacterRelatedMediaCrossRefTableTableTableManager(
              _db, _db.characterRelatedMediaCrossRefTable);
  $$ActivityFilterTypePagingCrossRefTableTableTableManager
      get activityFilterTypePagingCrossRefTable =>
          $$ActivityFilterTypePagingCrossRefTableTableTableManager(
              _db, _db.activityFilterTypePagingCrossRefTable);
  $$MediaCharacterPagingCrossRefTableTableTableManager
      get mediaCharacterPagingCrossRefTable =>
          $$MediaCharacterPagingCrossRefTableTableTableManager(
              _db, _db.mediaCharacterPagingCrossRefTable);
  $$CharacterVoiceActorCrossRefTableTableTableManager
      get characterVoiceActorCrossRefTable =>
          $$CharacterVoiceActorCrossRefTableTableTableManager(
              _db, _db.characterVoiceActorCrossRefTable);
  $$MediaRelationCrossRefTableTableTableManager
      get mediaRelationCrossRefTable =>
          $$MediaRelationCrossRefTableTableTableManager(
              _db, _db.mediaRelationCrossRefTable);
  $$MediaStaffPagingCrossRefTableTableTableManager
      get mediaStaffPagingCrossRefTable =>
          $$MediaStaffPagingCrossRefTableTableTableManager(
              _db, _db.mediaStaffPagingCrossRefTable);
  $$MediaExternalLinkTableTableTableManager get mediaExternalLinkTable =>
      $$MediaExternalLinkTableTableTableManager(
          _db, _db.mediaExternalLinkTable);
  $$CategoryMediaPagingCrossRefTableTableTableManager
      get categoryMediaPagingCrossRefTable =>
          $$CategoryMediaPagingCrossRefTableTableTableManager(
              _db, _db.categoryMediaPagingCrossRefTable);
  $$FavoriteInfoTableTableTableManager get favoriteInfoTable =>
      $$FavoriteInfoTableTableTableManager(_db, _db.favoriteInfoTable);
  $$EpisodeTableTableTableManager get episodeTable =>
      $$EpisodeTableTableTableManager(_db, _db.episodeTable);
  $$ReleasedPackageTableTableTableManager get releasedPackageTable =>
      $$ReleasedPackageTableTableTableManager(_db, _db.releasedPackageTable);
  $$MediaAiringScheduleUpdatedTableTableTableManager
      get mediaAiringScheduleUpdatedTable =>
          $$MediaAiringScheduleUpdatedTableTableTableManager(
              _db, _db.mediaAiringScheduleUpdatedTable);
  $$SearchResultTableTableTableManager get searchResultTable =>
      $$SearchResultTableTableTableManager(_db, _db.searchResultTable);
}
