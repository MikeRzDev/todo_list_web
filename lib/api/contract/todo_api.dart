import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:todo_list_web/api/config/api_headers.dart';
import 'package:todo_list_web/api/model/document_list.dart';
import 'package:todo_list_web/api/model/todo_request.dart';

part 'todo_api.g.dart';

@RestApi()
abstract class TodoApi {
  factory TodoApi(Dio dio, {String baseUrl}) = _TodoApi;

  @Headers(USE_PRIVATE_API)
  @GET('documents/TodoExample')
  Future<DocumentList> getTodos();

  @Headers(USE_PRIVATE_API)
  @POST('documents/TodoExample')
  Future<DocumentList> postTodo({@Body() required TodoRequest request});
}
