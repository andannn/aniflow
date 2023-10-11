
import 'package:anime_tracker/core/data/model/airing_schedule_model.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';

class AiringScheduleAndAnimeModel {
  AiringScheduleAndAnimeModel({required this.airingSchedule, required this.animeModel});

  final AiringScheduleModel airingSchedule;
  final AnimeModel animeModel;
}