import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:flutter/material.dart';

class MediaMarkWatchedMessage extends SnackBarMessage {
  const MediaMarkWatchedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.animeMarkWatched;
}

class MediaCompletedMessage extends SnackBarMessage {
  const MediaCompletedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.animeCompleted;
}

class DataRefreshFailedMessage extends SnackBarMessage {
  const DataRefreshFailedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.dataRefreshFailed;
}

class LoginFailedMessage extends SnackBarMessage {
  const LoginFailedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.loginFailedMessage;
}

class LoginSuccessMessage extends SnackBarMessage {
  const LoginSuccessMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.loginSuccessMessage;
}

class ConnectionTimeOutMessage extends SnackBarMessage {
  const ConnectionTimeOutMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.connectionTimeOutMessage;
}

class NetworkErrorMessage extends SnackBarMessage {
  const NetworkErrorMessage({super.varargs})
      : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.networkErrorMessage(varargs[0]);
}

class NoNetworkMessage extends SnackBarMessage {
  const NoNetworkMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.noNetworkMessage;
}
