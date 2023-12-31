// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_related_media.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.characterTable]
mixin CharacterColumns {
  static const String id = 'character_id';
  static const String image = 'character_image';
  static const String firstName = 'character_first_name';
  static const String middleName = 'character_middle_name';
  static const String lastName = 'character_last_name';
  static const String fullName = 'character_full_name';
  static const String nativeName = 'character_native_name';
  static const String description = 'character_description';
  static const String gender = 'character_gender';
  static const String dateOfBirth = 'character_dateOfBirth';
  static const String age = 'character_age';
  static const String bloodType = 'character_blood_type';
  static const String isFavourite = 'character_is_favourite';
  static const String siteUrl = 'character_site_url';
  static const String favourites = 'character_favourites';
}

/// [Tables.characterAndRelatedMediaCrossRef]
mixin CharacterAndRelatedMediaCrossRef {
  static const String characterId =
      'character_and_media_relation_cross_ref_character_id';
  static const String mediaId =
      'character_and_media_relation_cross_ref_media_id';
}

abstract class CharacterDao {
  Future insertCharacters({
    required List<CharacterEntity> entities,
    required ConflictAlgorithm conflictAlgorithm,
  });

  Future insertCharacterAndRelatedMedia(CharacterAndRelatedMedia entity);

  Future<CharacterEntity> getCharacter(String id);

  Future<CharacterAndRelatedMedia> getCharacterAndRelatedMedia(String id);

  Stream<CharacterAndRelatedMedia> getCharacterStream(String id);

  void notifyCharacterChanged(String characterId);
}

class CharacterDaoImpl extends CharacterDao {
  final AniflowDatabase database;

  CharacterDaoImpl(this.database);

  /// characterId to notifiers dict.
  final Map<String, ValueNotifier<int>> _notifiers = {};

  @override
  Future insertCharacterAndRelatedMedia(CharacterAndRelatedMedia entity) async {
    final batch = database.aniflowDB.batch();
    batch.insert(
      Tables.characterTable,
      entity.character.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (final media in entity.medias) {
      batch.insert(
        Tables.mediaTable,
        media.toJson(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
      batch.insert(
        Tables.characterAndRelatedMediaCrossRef,
        {
          CharacterAndRelatedMediaCrossRef.characterId: entity.character.id,
          CharacterAndRelatedMediaCrossRef.mediaId: media.id,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return batch
        .commit(noResult: true)
        .then((value) => notifyCharacterChanged(entity.character.id));
  }

  @override
  Future insertCharacters({
    required List<CharacterEntity> entities,
    required ConflictAlgorithm conflictAlgorithm,
  }) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.characterTable,
        entity.toJson(),
        conflictAlgorithm: conflictAlgorithm,
      );
    }
    return await batch.commit(noResult: true);
  }

  @override
  Future<CharacterAndRelatedMedia> getCharacterAndRelatedMedia(
    String id,
  ) async {
    final sql = 'select * from ${Tables.characterTable} as c \n'
        'left join ${Tables.characterAndRelatedMediaCrossRef} as cm \n'
        '  on cm.${CharacterAndRelatedMediaCrossRef.characterId} = c.${CharacterColumns.id} \n'
        'left join ${Tables.mediaTable} as m \n'
        '  on cm.${CharacterAndRelatedMediaCrossRef.mediaId} = m.${MediaTableColumns.id} \n'
        'where c.${CharacterColumns.id} = $id \n';

    List<Map<String, dynamic>> results = await database.aniflowDB.rawQuery(sql);

    return CharacterAndRelatedMedia(
      character: CharacterEntity.fromJson(results.first),
      medias: results
          .map((e) => MediaEntity.fromJson(e).checkValidOrNull())
          .whereNotNull()
          .toList(),
    );
  }

  @override
  Future<CharacterEntity> getCharacter(String id) async {
    final sql = 'select * from ${Tables.characterTable} as c \n'
        'where c.${CharacterColumns.id} = $id \n';

    List<Map<String, dynamic>> results = await database.aniflowDB.rawQuery(sql);

    return CharacterEntity.fromJson(results.first);
  }

  @override
  void notifyCharacterChanged(String characterId) {
    final notifier = _notifiers[characterId];
    if (notifier != null) {
      notifier.value = notifier.value++;
    }
  }

  @override
  Stream<CharacterAndRelatedMedia> getCharacterStream(String id) {
    final changeSource = _notifiers.putIfAbsent(id, () => ValueNotifier(0));
    return StreamUtil.createStream(
      changeSource,
      () => getCharacterAndRelatedMedia(id),
    );
  }
}
