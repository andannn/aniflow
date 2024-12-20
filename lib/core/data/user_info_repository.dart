import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/dao/user_dao.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class UserInfoRepository {
  UserInfoRepository(this.userDao);

  final UserDao userDao;

  Future<UserModel> getUserDataById(String id) async {
    final userEntity = await userDao.getUser(id);
    return userEntity!.toModel();
  }
}
