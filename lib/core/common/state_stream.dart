import 'dart:async';

import 'package:rxdart/rxdart.dart';

abstract class StateStream<T> with Stream<T> {
  T get value;
}

abstract class MutableStateStream<T> extends StateStream<T> {
  MutableStateStream();

  Future setValue(T value);

  factory MutableStateStream.create({
    required T Function() onGetValue,
    required Future Function(T) onSetValue,
  }) =>
      _MutableStateStreamImpl(onGetValue: onGetValue, onSetValue: onSetValue);
}

class _MutableStateStreamImpl<T> extends MutableStateStream<T> {
  _MutableStateStreamImpl({
    required this.onSetValue,
    required this.onGetValue,
  }) {
    _stream = ReplaySubject<T>(maxSize: 1, onListen: _onListen);
  }

  late ReplaySubject<T> _stream;

  final T Function() onGetValue;
  final Future Function(T) onSetValue;

  @override
  Future setValue(T value) async {
    if (onGetValue() != value) {
      await onSetValue(value);
      _stream.add(value);
    }
  }

  @override
  T get value => onGetValue();

  @override
  StreamSubscription<T> listen(void Function(T event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _stream.distinct().listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  void _onListen() {
    _stream.add(onGetValue());
  }
}
