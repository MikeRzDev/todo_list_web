import 'package:flutter/material.dart';
import 'package:todo_list_web/sl/service_locator.dart';
import 'package:todo_list_web/storage/storage.dart';
import 'package:todo_list_web/ui/pages/login_page.dart';
import 'package:todo_list_web/ui/pages/todo_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sessionExists = await _sessionExists();
  startServiceLocator();
  runApp(MyApp(sessionExists: sessionExists));
}

Future<bool> _sessionExists() async {
    final storage = Storage();
    final session = await storage.getToken();
    return session != null;
}

class MyApp extends StatelessWidget {
  final bool sessionExists;

  const MyApp({Key? key, required this.sessionExists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: sessionExists ? TodoPage() : LoginPage(),
    );
  }
}
