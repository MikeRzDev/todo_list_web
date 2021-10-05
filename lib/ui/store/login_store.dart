import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list_web/api/contract/login_api.dart';
import 'package:todo_list_web/api/model/auth_request.dart';
import 'package:todo_list_web/config/app_config.dart';
import 'package:todo_list_web/sl/service_locator.dart';
import 'package:todo_list_web/storage/storage.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final _firebaseRetrofit =
      LoginApi(locator<Dio>());
  final _storage = Storage();

  final key = FIREBASE_API_KEY;
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @observable
  String? email;

  @computed
  String? get emailError {
    if (email == null || _emailRegex.hasMatch(email ?? '')) {
      return null;
    } else {
      return 'please input a valid email';
    }
  }

  @observable
  String? password;

  @computed
  String? get passwordError {
    if (password == null || password!.length >= 6) {
      return null;
    } else {
      return 'please use a password with 8 or more chars';
    }
  }

  @computed
  bool get isFormValid =>
      isFieldValid(email, emailError) && isFieldValid(password, passwordError);

  bool isFieldValid(String? field, String? errorField) =>
      field != null && field.isNotEmpty && errorField == null;

  Future<void> login() async {
    try {
      final authRequest = AuthRequest(email: email, password: password);

      final token = await _firebaseRetrofit.loginUser(
          authRequest: authRequest, firebaseApiKey: key);
      await _storage.saveToken(token);
    } catch (ex) {
      print(ex);
    }
  }
}
