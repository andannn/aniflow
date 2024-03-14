import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/network/model/user_dto.dart';

extension UserMapper on UserDto {
  UserEntity toEntity() => UserEntity(
    id: id.toString(),
    name: name,
    avatarImage: avatar['large']!,
    bannerImage: bannerImage,
    profileColor: options?.profileColor,
    unreadNotificationCount: unreadNotificationCount,
  );
}
