import 'package:flutter/material.dart';
import 'package:todo_list_web/generated/l10n.dart';

extension ContextExtensions on BuildContext {
  S get string => S.of(this);
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;

}

extension FontExtensions on FontWeight {
  static FontWeight get semiBold => FontWeight.w600;
  FontWeight get black => FontWeight.w900;
  int get something => 5;
  FontWeight semiBolds() => FontWeight.w600;
}