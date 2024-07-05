import 'package:aniflow/app/di/get_it_di.dart';
import 'package:aniflow/core/background_task/executor.dart';
import 'package:aniflow/core/background_task/task.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:workmanager/workmanager.dart';

String _tag = 'callbackDispatcher';

/// entry point to receive callback of work-manager(android)
@pragma('vm:entry-point')
void callbackDispatcher() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await initDI(GetIt.instance);

  Workmanager().executeTask((taskName, inputData) async {
    logger.d('$_tag executeTask $taskName, inputData $inputData.');
    try {
      final task = TaskConverter().fromInputData(taskName, inputData);
      final executor = Executor.fromTask(task);
      if (executor == null) {
        logger.d('$_tag no executor.');
        return true;
      }

      final result = await executor.execute();
      return result;
    } on Exception catch (e) {
      logger.e(
          '$_tag Exception happened when do background task $taskName, exception: $e');
      await FirebaseCrashlytics.instance
          .recordFlutterError(FlutterErrorDetails(exception: e));
      return false;
    }
  });
}
