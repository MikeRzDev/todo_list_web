import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list_web/api/config/api_client.dart';
import 'package:todo_list_web/storage/storage.dart';
import 'package:todo_list_web/ui/store/login_store.dart';
import 'package:todo_list_web/ui/store/todo_page_store.dart';

GetIt locator = GetIt.instance;

void startServiceLocator() {
  locator.registerSingleton<Storage>(Storage());
  locator.registerSingleton<Dio>(getDioClient());
  locator.registerFactory<LoginStore>(() => LoginStore());
  locator.registerFactory<TodoPageStore>(() => TodoPageStore());
}