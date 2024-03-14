
import 'package:aniflow/core/database_drift/aniflow_database.dart';
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
  //
  // static ActivityAndUserRelation fromDto(AniActivity dto) {
  //   UserEntity user;
  //   MediaEntity? media;
  //
  //   switch (dto) {
  //     case ListActivityDto():
  //       user = UserEntity.fromDto(dto.user!);
  //       media = MediaEntity.fromNetworkModel(dto.media!);
  //     case TextActivityDto():
  //       user = UserEntity.fromDto(dto.user!);
  //     default:
  //       throw Exception('Invalid type');
  //   }
  //
  //   return ActivityAndUserRelation(
  //     user: user,
  //     activity: ActivityEntity.fromDto(dto),
  //     media: media,
  //   );
  // }
}
