import 'package:aniflow/di/get_it_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
void initDI(GetIt getIt) => getIt.init();