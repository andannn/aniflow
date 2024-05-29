import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/connectivity_util.dart';
import 'package:dio/dio.dart';

mixin ErrorHandler {
  static Future<Message?> convertExceptionToMessage(Exception exception) async {
    switch (exception) {
      case DioException():
        return await _toMessageType(exception);
    }

    return null;
  }

  static Future<Message?> _toMessageType(DioException exception) async {
    if (exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      return const ConnectionTimeOutMessage();
    }

    final statusCode = exception.response?.statusCode;
    if (statusCode != null) {
      return NetworkErrorMessage(varargs: [statusCode]);
    }

    final isConnected = await ConnectivityUtil.isNetworkConnected();
    if (!isConnected) {
      return const NoNetworkMessage();
    }

    return null;
  }
}
