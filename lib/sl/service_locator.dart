import 'package:get_it/get_it.dart';
import 'package:todo_list_web/ui/store/login_store.dart';

GetIt locator = GetIt.instance;

void startServiceLocator() {
  locator.registerFactory<LoginStore>(() => LoginStore());
}