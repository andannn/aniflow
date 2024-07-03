import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/user_mapper.dart';
import 'package:aniflow/core/network/model/user_dto.dart';

extension UserMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      avatar: avatarImage ?? '',
      bannerImage: bannerImage,
      profileColor: ProfileColorDict.fromDict(profileColor),
      unreadNotificationCount: unreadNotificationCount ?? 0,
      siteUrl: siteUrl,
    );
  }
}

extension UserMapper2 on UserDto {
  UserModel toModel() {
    return toEntity().toModel();
  }
}
