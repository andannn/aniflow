import 'package:dio/dio.dart';

Options createQueryOptions(String token) {
  return Options(
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );
}