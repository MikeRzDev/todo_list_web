import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:todo_list_web/api/contract/todo_api.dart';
import 'package:todo_list_web/api/model/document_list.dart';
import 'package:todo_list_web/sl/service_locator.dart';

part 'todo_page_store.g.dart';

class TodoPageStore = _TodoPageStore with _$TodoPageStore;

abstract class _TodoPageStore with Store {
  final todoApi = TodoApi(locator<Dio>());

  Future<DocumentList> getTodos() => todoApi.getTodos();
}
