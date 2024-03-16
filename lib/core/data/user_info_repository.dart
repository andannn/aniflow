import 'package:aniflow/core/data/mappers/user_mapper.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';

abstract class UserInfoRepository {
  Future<UserModel> getUserDataById(String id);
}

class UserInfoRepositoryImpl extends UserInfoRepository {
  final userDao = AniflowDatabase2().userDao;

  @override
  Future<UserModel> getUserDataById(String id) async {
    final userEntity = await userDao.getUser(id);
    return userEntity!.toModel();
  }
}
