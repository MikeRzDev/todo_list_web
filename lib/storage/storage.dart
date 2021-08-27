import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_list_web/api/model/auth_token.dart';

const _AUTH_TOKEN = 'AUTH_TOKEN';

class Storage {
  final _storage = FlutterSecureStorage();

  /*Future<String?> getTokenOld() =>
      _storage.read(key: _AUTH_TOKEN).then((json) => json != null ? AuthToken.fromJson(jsonDecode(json)).idToken : null);*/

  Future<String?> getToken() async {
    final jsonString = await _storage.read(key: _AUTH_TOKEN);
    return jsonString != null ? AuthToken.fromJson(jsonDecode(jsonString)).idToken : null;
  }

  Future<void> saveToken(AuthToken token) => _storage.write(key: _AUTH_TOKEN, value: token.toString());

  Future<void> clearToken() => _storage.delete(key: _AUTH_TOKEN);
}
