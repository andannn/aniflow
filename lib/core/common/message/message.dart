import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/feature/settings/bloc/settings_category.dart';
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

abstract class DialogMessage extends Message {
  final String id;
  final StringBuilder? title;
  final StringBuilder? message;
  final StringBuilder? positiveLabel;
  final StringBuilder? negativeLabel;
  final void Function()? onClickPositive;
  final void Function()? onClickNegative;

  const DialogMessage({
    required this.id,
    this.title,
    this.message,
    this.positiveLabel,
    this.negativeLabel,
    this.onClickPositive,
    this.onClickNegative,
  });

  @override
  List<Object?> get props => [id];
}

@lazySingleton
class MessageRepository {
  MessageRepository() {
    _messageSubject = PublishSubject(
      onListen: _onListen,
      onCancel: _onCancel,
    );
  }

  late PublishSubject<Message> _messageSubject;

  var _listenerCount = 0;

  Stream<SnackBarMessage> getSnackBarMessageStream() =>
      _messageSubject.whereType<SnackBarMessage>().distinct();

  Stream<DialogMessage> getDialogMessageStream() =>
      _messageSubject.whereType<DialogMessage>();

  void showMessage(Message message) => _messageSubject.add(message);

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
