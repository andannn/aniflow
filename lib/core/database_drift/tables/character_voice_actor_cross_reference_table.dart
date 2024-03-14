import 'package:drift/drift.dart';

@DataClassName('CharacterCharacterVoiceActorCrossRefEntity')
class CharacterVoiceActorCrossRefTable extends Table {

  @override
  List<Set<Column<Object>>>? get uniqueKeys => [{characterId, staffId}];

  IntColumn get id =>
      integer().named('character_voice_actor_cross_id').autoIncrement()();

  TextColumn get characterId =>
      text().named('character_voice_actor_cross_character_id')();

  TextColumn get staffId =>
      text().named('character_voice_actor_cross_staff_id')();

  TextColumn get role => text().named('character_voice_actor_cross_role')();

  TextColumn get language =>
      text().named('character_voice_actor_cross_language')();
}
