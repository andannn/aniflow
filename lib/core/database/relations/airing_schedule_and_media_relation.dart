import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class AiringScheduleAndMediaRelation extends Equatable {
  final AiringScheduleEntity airingSchedule;
  final MediaEntity mediaEntity;

  const AiringScheduleAndMediaRelation(
      {required this.airingSchedule, required this.mediaEntity});

  @override
  List<Object?> get props => [airingSchedule, mediaEntity];
}
