import 'package:aniflow/core/data/model/media_tag_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/network/model/user_genres_statics_dto.dart';
import 'package:aniflow/core/network/model/user_staff_statics_dto.dart';
import 'package:aniflow/core/network/model/user_studio_statics_dto.dart';
import 'package:aniflow/core/network/model/user_tag_statics_dto.dart';
import 'package:aniflow/core/network/model/user_voice_actor_statics_dto.dart';
import 'package:equatable/equatable.dart';

sealed class UserStatisticsModel extends Equatable {
  final int count;
  final int minutesWatched;
  final double meanScore;
  final int chaptersRead;
  final List<String> mediaIds;

  const UserStatisticsModel({
    required this.count,
    required this.minutesWatched,
    required this.meanScore,
    required this.chaptersRead,
    this.mediaIds = const [],
  });

  @override
  List<Object?> get props => [count, minutesWatched, meanScore, mediaIds];

  static UserStatisticsModel fromDto(dto) {
    switch (dto) {
      case UserGenreStaticsDto():
        return UserGenreStatisticsModel(
          count: dto.count ?? 0,
          minutesWatched: dto.minutesWatched ?? 0,
          meanScore: dto.meanScore ?? 0,
          chaptersRead: dto.chaptersRead ?? 0,
          mediaIds: dto.mediaIds.map((e) => e.toString()).toList(),
          genre: dto.genre ?? '',
        );
      case UserStudioStaticsDto():
        return UserStudioStatisticsModel(
          count: dto.count ?? 0,
          minutesWatched: dto.minutesWatched ?? 0,
          meanScore: dto.meanScore ?? 0,
          chaptersRead: dto.chaptersRead ?? 0,
          mediaIds: dto.mediaIds.map((e) => e.toString()).toList(),
          studio: StudioModel.fromDto(dto.studio!),
        );
      case UserStaffStaticsDto():
        return UserStaffStatisticsModel(
          count: dto.count ?? 0,
          minutesWatched: dto.minutesWatched ?? 0,
          meanScore: dto.meanScore ?? 0,
          chaptersRead: dto.chaptersRead ?? 0,
          mediaIds: dto.mediaIds.map((e) => e.toString()).toList(),
          staff: StaffModel.fromDto(dto.staff!),
        );
      case UserVoiceActorStaticsDto():
        return UserStaffStatisticsModel(
          count: dto.count ?? 0,
          minutesWatched: dto.minutesWatched ?? 0,
          meanScore: dto.meanScore ?? 0,
          chaptersRead: dto.chaptersRead ?? 0,
          mediaIds: dto.mediaIds.map((e) => e.toString()).toList(),
          staff: StaffModel.fromDto(dto.voiceActor!),
        );
      case UserTagStaticsDto():
        return UserTagStatisticsModel(
          count: dto.count ?? 0,
          minutesWatched: dto.minutesWatched ?? 0,
          meanScore: dto.meanScore ?? 0,
          chaptersRead: dto.chaptersRead ?? 0,
          mediaIds: dto.mediaIds.map((e) => e.toString()).toList(),
          mediaTag: MediaTagModel.fromDto(dto.tag!),
        );
      default:
        throw 'Invalid type';
    }
  }
}

class UserGenreStatisticsModel extends UserStatisticsModel {
  final String genre;

  const UserGenreStatisticsModel(
      {required super.count,
      required super.minutesWatched,
      required super.meanScore,
      required super.mediaIds,
      required this.genre,
      required super.chaptersRead});

  @override
  List<Object?> get props => [...super.props, genre];
}

class UserStudioStatisticsModel extends UserStatisticsModel {
  final StudioModel studio;

  const UserStudioStatisticsModel(
      {required super.count,
      required super.minutesWatched,
      required super.meanScore,
      required super.mediaIds,
      required this.studio,
      required super.chaptersRead});

  @override
  List<Object?> get props => [...super.props, studio];
}

class UserStaffStatisticsModel extends UserStatisticsModel {
  final StaffModel staff;

  const UserStaffStatisticsModel(
      {required super.count,
      required super.minutesWatched,
      required super.meanScore,
      required super.mediaIds,
      required this.staff,
      required super.chaptersRead});

  @override
  List<Object?> get props => [...super.props, staff];
}

class UserVoiceActorStatisticsModel extends UserStatisticsModel {
  final StaffModel voiceActor;

  const UserVoiceActorStatisticsModel(
      {required super.count,
      required super.minutesWatched,
      required super.meanScore,
      required super.mediaIds,
      required this.voiceActor,
      required super.chaptersRead});

  @override
  List<Object?> get props => [...super.props, voiceActor];
}

class UserTagStatisticsModel extends UserStatisticsModel {
  final MediaTagModel mediaTag;

  const UserTagStatisticsModel(
      {required super.count,
      required super.minutesWatched,
      required super.meanScore,
      required super.mediaIds,
      required this.mediaTag,
      required super.chaptersRead});

  @override
  List<Object?> get props => [...super.props, mediaTag];
}
