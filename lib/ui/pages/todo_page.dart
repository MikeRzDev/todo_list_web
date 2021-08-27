import 'package:flutter/material.dart';
import 'package:todo_list_web/ui/widgets/search_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<String> _todoList = [];
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Todo List',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(height: 10),
            SearchWidget(controller: _textController, onPressed: _loadTodo),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _todoList.length,
                itemBuilder: (_, index) => _buildTodoItem(_todoList[index]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTodoItem(String todoText) => Container(
    color: Colors.cyan,
    child: Text(todoText),
  );

  void _loadTodo() => setState(() => _todoList.add(_textController.text));
}
