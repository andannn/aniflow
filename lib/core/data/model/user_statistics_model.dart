import 'package:aniflow/core/network/model/user_genres_statics_dto.dart';
import 'package:equatable/equatable.dart';

sealed class UserStatisticsModel extends Equatable {
  final int count;
  final int minutesWatched;
  final double meanScore;
  final List<String> mediaIds;

  const UserStatisticsModel({
    required this.count,
    required this.minutesWatched,
    required this.meanScore,
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
          mediaIds: dto.mediaIds.map((e) => e.toString()).toList(),
          genre: dto.genre ?? '',
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
      required this.genre});

  @override
  List<Object?> get props => [...super.props, genre];
}
