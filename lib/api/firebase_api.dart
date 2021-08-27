import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_list_web/api/model/auth_request.dart';
import 'package:todo_list_web/api/model/auth_token.dart';
import 'package:todo_list_web/api/model/error_response.dart';

const _FIREBASE_LOGIN_URL =
    'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBW_rLDKGYLjPeSpjJXb8aAV9hkwn_Z5ko';

class FirebaseApi {
  Future<AuthToken> login(String email, String password) async {
    final authRequest = AuthRequest(email: email, password: password);
    AuthToken? token;
    try {
      final response = await http.post(
        Uri.parse(_FIREBASE_LOGIN_URL),
        body: authRequest.toString(),
      );
      if (response.statusCode >= 400) {
        final error = ErrorResponse.fromJson(jsonDecode(response.body));
        throw error;
      } else {
        token = AuthToken.fromJson(jsonDecode(response.body));
      }
    } catch (ex) {
      throw ex;
    }
    return token;
  }
}
