import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_list_web/api/model/error_response.dart';
import 'package:todo_list_web/ui/dialogs/dialog_widget.dart';
import 'package:todo_list_web/ui/pages/todo_page.dart';
import 'package:todo_list_web/ui/store/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _store = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(
                  builder: (_) => TextField(
                        decoration: InputDecoration(
                          errorText: _store.emailError,
                          labelText: 'E-Mail',
                        ),
                        onChanged: (text) => _store.email = text,
                      )),
              Observer(
                  builder: (_) => TextField(
                        decoration: InputDecoration(
                          errorText: _store.passwordError,
                          labelText: 'Password',
                        ),
                        onChanged: (text) => _store.password = text,
                      )),
              Observer(
                  builder: (_) => ElevatedButton(
                      onPressed: _store.isFormValid
                          ? () => _store
                              .login()
                              .then((_) => Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => TodoPage(),
                                  ),
                                  (_) => false))
                              .onError<ErrorResponse>((error, _) => showInformationDialog(context,
                                  title: 'Error', message: error.errorList?.message ?? 'unknown error'))
                          : null,
                      child: Text('Login')))
            ],
          ),
        ),
      ),
    );
  }
}
