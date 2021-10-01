// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _TodoApi implements TodoApi {
  _TodoApi(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DocumentList> getTodos() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DocumentList>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'API_TYPE': 'PRIVATE_API'},
                extra: _extra)
            .compose(_dio.options, 'documents/TodoExample',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DocumentList.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DocumentList> postTodo({required request}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DocumentList>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'API_TYPE': 'PRIVATE_API'},
                extra: _extra)
            .compose(_dio.options, 'documents/TodoExample',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DocumentList.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
