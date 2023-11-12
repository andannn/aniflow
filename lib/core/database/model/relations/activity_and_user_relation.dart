import 'package:aniflow/core/database/model/activity_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/user_entity.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';

class ActivityAndUserRelation {
  ActivityAndUserRelation({
    required this.user,
    required this.activity,
    this.media,
  });

  final UserEntity user;
  final ActivityEntity activity;
  final MediaEntity? media;

  static ActivityAndUserRelation fromDto(AniActivity dto) {
    UserEntity user;
    MediaEntity? media;

    switch (dto) {
      case ListActivityDto():
        user = UserEntity.fromDto(dto.user!);
        media = MediaEntity.fromNetworkModel(dto.media!);
      case TextActivityDto():
        user = UserEntity.fromDto(dto.user!);
      default:
        throw Exception('Invalid type');
    }

    return ActivityAndUserRelation(
      user: user,
      activity: ActivityEntity.fromDto(dto),
      media: media,
    );
  }
}
