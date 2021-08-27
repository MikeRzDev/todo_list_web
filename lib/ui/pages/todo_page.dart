import 'package:flutter/material.dart';
import 'package:todo_list_web/api/firebase_api.dart';
import 'package:todo_list_web/api/model/document_list.dart';
import 'package:todo_list_web/api/model/todo.dart';
import 'package:todo_list_web/api/model/todo_request.dart';
import 'package:todo_list_web/storage/storage.dart';
import 'package:todo_list_web/ui/dialogs/dialog_widget.dart';
import 'package:todo_list_web/ui/pages/login_page.dart';
import 'package:todo_list_web/ui/widgets/future_widget.dart';
import 'package:todo_list_web/ui/widgets/search_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _textController = TextEditingController();
  final _storage = Storage();
  final _firebaseApi = FirebaseApi();
  late Future<DocumentList> _documentList;

  @override
  void initState() {
    super.initState();
    _documentList = _firebaseApi.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () => _showLogoutDialog(),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            SearchWidget(controller: _textController, onPressed: _postAndLoadTodos2),
            SizedBox(height: 30),
            Expanded(
              child: FutureWidget<DocumentList>(
                future: _documentList,
                onSuccess: (documentList) => _buildTodoList(documentList.todoList),
                onError: (error) => _showErrorWidget(error),
                onWait: () => Center(child: CircularProgressIndicator()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog() => showInformationDialog(
        context,
        title: 'Information',
        message: 'Do you want to logout?',
        isTwoButton: true,
        okButtonText: 'Yes',
        cancelButtonText: 'No',
        onOkPressed: () => _logout(),
      );

  Future<void> _showErrorDialog(String errorText) => showInformationDialog(
        context,
        title: 'Error',
        message: errorText,
        isTwoButton: false,
        okButtonText: 'Continue',
      );

  Widget _showErrorWidget(String error) => Text(error);

  void _logout() {
    _storage.clearToken();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => LoginPage(),
        ),
        (_) => false);
  }

  Widget _buildTodoList(List<Todo?>? todoList) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList?.length ?? 0,
        itemBuilder: (_, index) => _buildTodoItem(todoList?[index]),
      );

  Widget _buildTodoItem(Todo? todo) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.cyan,
        ),
        padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
        child: Text(todo?.value ?? ''),
      );

  void _postAndLoadTodos() {
    final todoText = _textController.text;
    _firebaseApi.postTodos(TodoRequest.fromValue(todoText)).then((_) {
      _textController.text = '';
      setState(() {
        _documentList = _firebaseApi.getTodos();
      });
    }).onError<String>((error, _) => showInformationDialog(
          context,
          title: 'Error',
          message: error,
          isTwoButton: false,
          okButtonText: 'Continue',
        ));
  }

  Future<void> _postAndLoadTodos2() async {
    final todoText = _textController.text;
    await _firebaseApi.postTodos(TodoRequest.fromValue(todoText));
    setState(() {
      _documentList = _firebaseApi.getTodos();
    });
    _textController.text = '';
  }
}
