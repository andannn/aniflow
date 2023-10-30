import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_external_link_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/model/relations/media_relation_entities_with_owner_id.dart';
import 'package:aniflow/core/database/model/relations/staff_and_role_relation.dart';

class MediaWithDetailInfo {
  final MediaEntity mediaEntity;
  final List<CharacterAndVoiceActorRelation> characterAndVoiceActors;
  final List<StaffAndRoleRelation> staffs;
  final List<MediaExternalLinkEntity> externalLinks;
  final List<MediaRelationEntity> mediaRelations;

  MediaWithDetailInfo({
    required this.mediaEntity,
    required this.characterAndVoiceActors,
    required this.staffs,
    required this.externalLinks,
    required this.mediaRelations,
  });
}
