import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:todo_list_web/api/model/error_response.dart';
import 'package:todo_list_web/ui/dialogs/dialog_widget.dart';
import 'package:todo_list_web/ui/pages/camera_page.dart';
import 'package:todo_list_web/ui/pages/todo_page.dart';
import 'package:todo_list_web/ui/store/login_store.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list_web/utils/extensions.dart';

import 'gps_page.dart';

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
              SvgPicture.asset(
                'assets/image/intro_icon.svg',
                width: 150,
              ),
              Observer(
                  builder: (_) => TextField(
                        decoration: InputDecoration(
                          labelStyle: context.textTheme.bodyText1,
                          errorText: _store.emailError,
                          labelText: context.string.emailLabel,
                        ),
                        onChanged: (text) => _store.email = text,
                      )),
              Observer(
                  builder: (_) => TextField(
                        decoration: InputDecoration(
                          labelStyle: context.theme.textTheme.bodyText1,
                          errorText: _store.passwordError,
                          labelText: context.string.passwordLabel,
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
                              .onError<ErrorResponse>((error, _) => showInformationDialog(
                                    context,
                                    title: 'Error',
                                    message: error.errorList?.message ?? 'unknown error',
                                  ))
                          : null,
                      child: Text(
                        context.string.loginButtonLabel,
                        style: context.textTheme.headline2,
                      ))),
              ElevatedButton(
                  onPressed: () => _openCamera(),
                  child: Text(
                    context.string.takePictureButtonLabel,
                    style: context.textTheme.headline1,
                  )),
              ElevatedButton(
                  onPressed: () => _openCaptureLocation(),
                  child: Text(
                    context.string.captureLocationButtonLabel,
                    style: context.theme.textTheme.headline1,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openCaptureLocation() async {
    final haveLocationPermission = await Permission.location.isGranted;
    if (!haveLocationPermission) {
      await showInformationDialog(context, title: 'Information', message: 'Please grant gps permissions for capture location');
    }

    var status = await Permission.location.request();
    if (status.isGranted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GPSPage(),
          ));
    } else if (status.isPermanentlyDenied) {
      showInformationDialog(context, title: 'Error', message: 'gps permission was permanently denied');
    } else if (status.isDenied) {
      showInformationDialog(context, title: 'Error', message: 'gps permission was denied');
    } else if (status.isLimited) {
      showInformationDialog(context, title: 'Error', message: 'gps permissions are limited');
    }
  }

  Future<void> _openCamera() async {
    final haveCameraPermission = await Permission.camera.isGranted;
    if (!haveCameraPermission) {
      await showInformationDialog(context, title: 'Information', message: 'Please grant camera permissions for taking pictures');
    }

    var status = await Permission.camera.request();
    if (status.isGranted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CameraPage(),
          ));
    } else if (status.isPermanentlyDenied) {
      showInformationDialog(context, title: 'Error', message: 'camera permission was permanently denied');
    } else if (status.isDenied) {
      showInformationDialog(context, title: 'Error', message: 'camera permission was denied');
    } else if (status.isLimited) {
      showInformationDialog(context, title: 'Error', message: 'camera permissions are limited');
    }
  }
}
