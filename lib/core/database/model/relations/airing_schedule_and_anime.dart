import 'package:anime_tracker/core/database/model/airing_schedules_entity.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';

class AiringScheduleAndAnime {
  final AiringSchedulesEntity airingSchedule;
  final AnimeEntity anime;

  AiringScheduleAndAnime({required this.airingSchedule, required this.anime});
}
