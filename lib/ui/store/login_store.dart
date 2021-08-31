import 'package:mobx/mobx.dart';
import 'package:todo_list_web/api/firebase_api.dart';
import 'package:todo_list_web/storage/storage.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final Storage _storage = Storage();

  final RegExp _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

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
  bool get isFormValid => isFieldValid(email, emailError) && isFieldValid(password, passwordError);

  bool isFieldValid(String? field, String? errorField) => field != null && field.isNotEmpty && errorField == null;

  Future<void> login() async {
    final token = await _firebaseApi.login(email!, password!);
    await _storage.saveToken(token);
  }
}
