import 'dart:async';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

const String _tag = 'Message';

sealed class Message extends Equatable {
  const Message();
}

enum SnackBarDuration {
  short(Duration(milliseconds: 1000)),
  medium(Duration(milliseconds: 2000)),
  long(Duration(milliseconds: 4000));

  final Duration showDuration;

  const SnackBarDuration(this.showDuration);
}

abstract class SnackBarMessage extends Message {
  final SnackBarDuration duration;
  final List varargs;

  const SnackBarMessage({
    required this.duration,
    this.varargs = const [],
  });

  String translated(BuildContext context);

  @override
  List<Object?> get props => [...varargs, duration];
}

@LazySingleton(env: [AfEnvironment.impl])
class MessageRepository {
  MessageRepository() {
    _messageSubject = PublishSubject(
      onListen: _onListen,
      onCancel: _onCancel,
    );

    _dialogSubject = PublishSubject(
      onListen: _onListen,
      onCancel: _onCancel,
    );
  }

  late PublishSubject<Message> _messageSubject;

  late PublishSubject<DialogType> _dialogSubject;

  final PublishSubject<dynamic> _dialogResultSubject = PublishSubject();

  var _listenerCount = 0;

  Stream<SnackBarMessage> getSnackBarMessageStream() =>
      _messageSubject.whereType<SnackBarMessage>();

  Stream<DialogType> getDialogMessageStream() => _dialogSubject;

  void showMessage(Message message) => _messageSubject.add(message);

  Future<T?> showDialog<T>(DialogType type) {
    _dialogSubject.add(type);
    return _dialogResultSubject.whereType<T?>().first;
  }

  void onDialogResult(dynamic result) {
    logger.d('$_tag onDialogResult $result');
    _dialogResultSubject.add(result);
  }

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
