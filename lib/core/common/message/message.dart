import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

const String _tag = 'Message';

sealed class Message extends Equatable {
  final SnackBarDuration duration;
  final List varargs;

  const Message({
    required this.duration,
    this.varargs = const [],
  });

  String translated(BuildContext context);

  @override
  List<Object?> get props => [...varargs, duration];
}

class MediaMarkWatchedMessage extends Message {
  const MediaMarkWatchedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.animeMarkWatched;
}

class MediaCompletedMessage extends Message {
  const MediaCompletedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.animeCompleted;
}

class DataRefreshFailedMessage extends Message {
  const DataRefreshFailedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) => context.appLocal.dataRefreshFailed;
}

class LoginFailedMessage extends Message {
  const LoginFailedMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.loginFailedMessage;
}

class LoginSuccessMessage extends Message {
  const LoginSuccessMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.loginSuccessMessage;
}

class ConnectionTimeOutMessage extends Message {
  const ConnectionTimeOutMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.connectionTimeOutMessage;
}

class NetworkErrorMessage extends Message {
  const NetworkErrorMessage({super.varargs})
      : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.networkErrorMessage(varargs[0]);
}

class NoNetworkMessage extends Message {
  const NoNetworkMessage() : super(duration: SnackBarDuration.medium);

  @override
  String translated(BuildContext context) =>
      context.appLocal.noNetworkMessage;
}

@lazySingleton
class MessageRepository {
  MessageRepository() {
    _messageSubject = PublishSubject(
      onListen: _onListen,
      onCancel: _onCancel,
    );
    _closeSnackBarSubject = PublishSubject();
  }

  late PublishSubject<Message> _messageSubject;
  late PublishSubject _closeSnackBarSubject;

  var _listenerCount = 0;

  Stream<Message> getMessageStream() => _messageSubject.distinct();

  Stream getCloseEventStream() => _closeSnackBarSubject;

  void showMessage(Message message) => _messageSubject.add(message);

  void closeSnackBar() => _closeSnackBarSubject.add(null);

  void _onListen() {
    logger.d('$_tag MessageController is listened, count ${++_listenerCount}');
  }

  void _onCancel() {
    logger.d('$_tag cancel to listen, count ${--_listenerCount}');
  }
}

extension MessageRepositoryEx on MessageRepository {
  void handleException(Exception exception) async {
    final message = await ErrorHandler.convertExceptionToMessage(exception);
    if (message != null) {
      showMessage(message);
    }
  }
}

mixin ShowSnackBarMixin<T extends StatefulWidget> on State<T> {
  late StreamSubscription _messageSub;
  late StreamSubscription _closeEventSub;
  ScaffoldFeatureController? _currentSnackBarController;

  @override
  void initState() {
    super.initState();

    final repo = GetIt.instance.get<MessageRepository>();
    _messageSub = repo.getMessageStream().listen(
      (message) {
        if (ModalRoute.of(context)?.isCurrent == false) {
          // current page is not top.
          return;
        }

        _showSnackBar(message);
      },
    );
    _closeEventSub = repo.getCloseEventStream().listen((_) {
      _currentSnackBarController?.close();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _messageSub.cancel();
    _closeEventSub.cancel();
  }

  void _showSnackBar(Message message) async {
    _currentSnackBarController = showSnackBarMessage(
      context: context,
      label: message.translated(context),
      duration: message.duration,
    );

    await _currentSnackBarController?.closed.then((reason) {
      logger.d('$_tag snack bar of message $message closed. reason: $reason.');
    });
  }
}
