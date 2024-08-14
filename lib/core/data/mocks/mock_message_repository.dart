import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [AfEnvironment.mock], as: MessageRepository)
class MockMessageRepository implements MessageRepository {
  @override
  Stream<DialogType> getDialogMessageStream() async* {}

  @override
  Stream<SnackBarMessage> getSnackBarMessageStream() async* {}

  @override
  void onDialogResult(result) {}

  @override
  Future<T?> showDialog<T>(DialogType type) {
    return Future.value();
  }

  @override
  void showMessage(Message message) {}
}
