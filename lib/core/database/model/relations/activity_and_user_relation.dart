import 'package:aniflow/core/database/model/activity_entity.dart';
import 'package:aniflow/core/database/model/user_entity.dart';

class ActivityAndUserRelation {
  ActivityAndUserRelation({required this.user, required this.activity});

  final UserEntity user;
  final ActivityEntity activity;
}
