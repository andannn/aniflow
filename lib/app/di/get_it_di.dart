import 'package:aniflow/app/di/get_it_di.config.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
Future<GetIt> initDI(GetIt getIt) => getIt.init();

extension GetItEx on GetIt {
  Future dispose() {
    return Future.wait(
      [
        /// close database
        get<AniflowDatabase>().close(),
      ],
    );
  }
}
