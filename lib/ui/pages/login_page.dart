import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo_list_web/api/model/error_response.dart';
import 'package:todo_list_web/ui/dialogs/dialog_widget.dart';
import 'package:todo_list_web/ui/pages/camera_page.dart';
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
                              .onError<ErrorResponse>((error, _) =>
                                  showInformationDialog(context,
                                      title: 'Error',
                                      message: error.errorList?.message ??
                                          'unknown error'))
                          : null,
                      child: Text('Login'))),
              ElevatedButton(
                  onPressed: () => _openCamera(), child: Text('Take Picture'))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openCamera() async {
    final haveCameraPermission = await Permission.camera.isGranted;
    if (!haveCameraPermission) {
      await showInformationDialog(context,
          title: 'Information',
          message: 'Please grant camera permissions for taking pictures');
    }

    var status = await Permission.camera.request();
    if (status.isGranted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CameraPage(),
          ));
    } else if (status.isPermanentlyDenied) {
      showInformationDialog(context,
          title: 'Error', message: 'camera permission was permanently denied');
    } else if (status.isDenied) {
      showInformationDialog(context,
          title: 'Error', message: 'camera permission was denied');
    } else if (status.isLimited) {
      showInformationDialog(context,
          title: 'Error', message: 'camera permissions are limited');
    }
  }
}
