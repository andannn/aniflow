
// ignore_for_file: lines_longer_than_80_chars, use_build_context_synchronously

import 'package:aniflow/core/common/util/connectivity_util.dart';
import 'package:aniflow/core/design_system/widget/aniflow_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

mixin ErrorHandler {
  static void handleException({required Exception exception, BuildContext? context}) {
    switch (exception) {
      case DioException():
        _handleNetworkException(context, exception);
    }
  }

  static void _handleNetworkException(BuildContext? context, DioException exception) async {
    if (exception.type == DioExceptionType.sendTimeout ||
        exception.type == DioExceptionType.receiveTimeout) {
      showSnackBarMessage(context: context, label: 'Connection timeout...');
      return;
    }

    final statusCode = exception.response?.statusCode;
    if (statusCode != null) {
      showSnackBarMessage(context: context, label: 'Network Error (status code: $statusCode).');
      return;
    }

    final isConnected = await ConnectivityUtil.isNetworkConnected();
    if (!isConnected) {
      showSnackBarMessage(context: context, label: 'No network.', duration: SnackBarDuration.short);
      return;
    }
  }
}