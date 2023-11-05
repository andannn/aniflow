
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/user_data_dao.dart';

abstract class UserInfoRepository {
  Future<UserModel> getUserDataById(String id);
}

class UserInfoRepositoryImpl extends UserInfoRepository {
  final UserDataDao userDao = AniflowDatabase().getUserDataDao();

  @override
  Future<UserModel> getUserDataById(String id) async {
    final userEntity = await userDao.getUserData(id);
    return UserModel.fromDatabaseModel(userEntity)!;
  }
}
