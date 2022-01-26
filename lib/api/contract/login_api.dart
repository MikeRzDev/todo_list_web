import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:todo_list_web/api/model/auth_request.dart';
import 'package:todo_list_web/api/model/auth_token.dart';
import 'package:todo_list_web/config/app_config.dart';

import '../config/api_consts.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: LOGIN_URL)
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('v1/accounts:signInWithPassword')
  Future<AuthToken> loginUser({
    @Body() required AuthRequest authRequest,
    @Query('key') String firebaseApiKey = FIREBASE_API_KEY,
  });
}
