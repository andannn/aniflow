import 'package:aniflow/app/di/get_it_di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@injectableInit
Future initDI(GetIt getIt) => getIt.init();