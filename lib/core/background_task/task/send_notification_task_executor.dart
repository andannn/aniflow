import 'package:aniflow/core/background_task/excutor.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:injectable/injectable.dart';

const String _tag = "SendNotificationTaskExecutor";

@injectable
class SendNotificationTaskExecutor implements Executor {
  const SendNotificationTaskExecutor();

  @override
  Future<bool> execute() async {
    logger.d('$_tag start');
    return true;
  }
}
