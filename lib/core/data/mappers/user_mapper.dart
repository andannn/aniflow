import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';

extension UserMapper on UserEntity {
  UserModel toModel() {
    return UserModel(
      id: id,
      name: name,
      avatar: avatarImage ?? '',
      bannerImage: bannerImage,
      profileColor: ProfileColorDict.fromDict(profileColor),
      unreadNotificationCount: unreadNotificationCount ?? 0,
    );
  }
}
