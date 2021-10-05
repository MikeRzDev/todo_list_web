import 'package:dio/dio.dart';
import 'package:todo_list_web/api/config/http_interceptor.dart';

import 'api_consts.dart';

Dio getDioClient() {
  final dio = Dio();
  dio.interceptors.add(LogInterceptor());
  dio.interceptors.add(HttpInterceptor());
  dio.options.baseUrl = BASE_URL;
  return dio;
}
