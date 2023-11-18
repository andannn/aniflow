import 'package:dio/dio.dart';

Options createQueryOptions(String token) {
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  if (token.isNotEmpty) {
    headers['Authorization'] = 'Bearer $token';
  }
  return Options(
    headers: headers,
  );
}
