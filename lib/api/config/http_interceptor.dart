import 'package:dio/dio.dart';
import 'package:todo_list_web/api/config/api_headers.dart';
import 'package:todo_list_web/sl/service_locator.dart';
import 'package:todo_list_web/storage/storage.dart';

class HttpInterceptor extends InterceptorsWrapper {
  final Storage _storage = locator<Storage>();

  bool _hasAuthHeader(RequestOptions options) => options.headers.containsKey(AUTHORIZATION);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    handler.next(_hasAuthHeader(options) ? options : await _authorizeRequest(options));
  }

  Future<RequestOptions> _authorizeRequest(RequestOptions request) async {
    final apiType = request.headers[API_TYPE] ?? NO_API;
    request.headers.remove(API_TYPE);
    switch (apiType) {
      case PRIVATE_API:
        {
          final token = await _storage.getToken();
          request.headers[AUTHORIZATION] = "Bearer $token";
          break;
        }
    }
    return request;
  }
}
