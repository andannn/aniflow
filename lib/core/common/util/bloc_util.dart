import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension BlocEx<Event, State> on Bloc<Event, State> {
  void safeAdd(Event event) {
    if (!isClosed) {
      add(event);
    } else {
      logger.d('BlocEx: $runtimeType is closed when add event: $event.');
    }
  }
}
