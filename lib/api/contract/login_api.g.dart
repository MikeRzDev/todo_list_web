// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _LoginApi implements LoginApi {
  _LoginApi(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://identitytoolkit.googleapis.com/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<AuthToken> loginUser(
      {required authRequest, required firebaseApiKey}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'key': firebaseApiKey};
    final _data = <String, dynamic>{};
    _data.addAll(authRequest.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AuthToken>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'v1/accounts:signInWithPassword',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AuthToken.fromJson(_result.data!);
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
