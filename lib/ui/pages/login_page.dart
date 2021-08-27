import 'package:flutter/material.dart';
import 'package:todo_list_web/api/firebase_api.dart';
import 'package:todo_list_web/api/model/error_response.dart';
import 'package:todo_list_web/storage/storage.dart';
import 'package:todo_list_web/ui/dialogs/dialog_widget.dart';
import 'package:todo_list_web/ui/pages/todo_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _firebaseApi = FirebaseApi();
  final _storage = Storage();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                    ),
                    onSaved: (email) {
                      this._email = email;
                    },
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    onSaved: (password) {
                      this._password = password;
                    },
                    validator: (password) {
                      if (password == null || password.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    }),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        login()
                            .then((_) => Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => TodoPage(),
                                ),
                                (_) => false))
                            .onError<ErrorResponse>((error, _) => showInformationDialog(context,
                                title: 'Error', message: error.errorList?.message ?? 'unknown error'));
                      }
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    final token = await _firebaseApi.login(_email!, _password!);
    await _storage.saveToken(token);
  }
}