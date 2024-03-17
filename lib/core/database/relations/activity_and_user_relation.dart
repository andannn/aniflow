
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class ActivityAndUserRelation extends Equatable {
  const ActivityAndUserRelation({
    required this.user,
    required this.activity,
    this.media,
  });

  final UserEntity? user;
  final ActivityEntity activity;
  final MediaEntity? media;

  @override
  List<Object?> get props => [user, activity, media];
}
