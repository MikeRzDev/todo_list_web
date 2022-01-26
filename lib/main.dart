import 'package:flutter/material.dart';
import 'package:todo_list_web/sl/service_locator.dart';
import 'package:todo_list_web/storage/storage.dart';
import 'package:todo_list_web/theme/default_theme.dart';
import 'package:todo_list_web/ui/pages/login_page.dart';
import 'package:todo_list_web/ui/pages/todo_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

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
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: defaultTheme,
        home: sessionExists ? TodoPage() : LoginPage(),
      );
}
