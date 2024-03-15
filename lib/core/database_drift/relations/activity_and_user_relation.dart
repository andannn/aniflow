
import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/mappers/activity_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/media_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/user_mapper.dart';
import 'package:aniflow/core/network/model/ani_activity.dart';
import 'package:aniflow/core/network/model/list_activity_dto.dart';
import 'package:aniflow/core/network/model/text_activity_dto.dart';
import 'package:equatable/equatable.dart';

class ActivityAndUserRelation extends Equatable {
  const ActivityAndUserRelation({
    required this.user,
    required this.activity,
    this.media,
  });

  final UserEntity user;
  final ActivityEntity activity;
  final MediaEntity? media;

  @override
  List<Object?> get props => [user, activity, media];

  static ActivityAndUserRelation fromDto(AniActivity dto) {
    UserEntity user;
    MediaEntity? media;

    switch (dto) {
      case ListActivityDto():
        user = dto.user!.toEntity();
        media = dto.media!.toEntity();
      case TextActivityDto():
        user = dto.user!.toEntity();
      default:
        throw Exception('Invalid type');
    }

    return ActivityAndUserRelation(
      user: user,
      activity: dto.toEntity(),
      media: media,
    );
  }
}
