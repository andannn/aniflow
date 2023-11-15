// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';

mixin StatusCode {
  // success.
  static const ok = 200;
  static const noInternet = 204;

  // error.
  static const badRequest = 400;
  static const unauthorized = 401;
  static const forbidden = 403;
  static const notFound = 404;
}

abstract class NetworkException implements Exception {}

class NoInternetException implements NetworkException {
  const NoInternetException();
}

class UnauthorizedException implements NetworkException {
  const UnauthorizedException();
}

class NotFoundException implements NetworkException {
  const NotFoundException();
}

class BadRequestException implements NetworkException {
  const BadRequestException();
}

class ConnectOutException implements NetworkException {
  const ConnectOutException();
}

class OtherNetworkException implements NetworkException {
  const OtherNetworkException();
}

extension DioErrorEx on DioException {
  NetworkException covertToNetWorkException() {
    if (response?.statusCode == StatusCode.unauthorized) {
      return const UnauthorizedException();
    } else if (response?.statusCode == StatusCode.notFound) {
      return const NotFoundException();
    } else if (type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.receiveTimeout) {
      return const ConnectOutException();
    } else {
      return const OtherNetworkException();
    }
  }
}
