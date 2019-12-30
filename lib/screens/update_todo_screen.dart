import 'package:flutter/material.dart';
import '../api/api.dart';
import '../models/todo.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';

class UpdateTodoScreen extends StatefulWidget {
  static const routeName = "UpdateTodo";

  @override
  _UpdateTodoScreenState createState() => _UpdateTodoScreenState();
}

class _UpdateTodoScreenState extends State<UpdateTodoScreen> {
  TextEditingController _titleController =
      TextEditingController(text: 'kambing');

  NetworkApi api = NetworkApi();
  var _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   final todoId = ModalRoute.of(context).settings.arguments as int;
    //   print('todoId = $todoId');
    //   Provider.of<Todos>(context).fetchSingleTodoWithId(todoId);
    // }
    // _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final todoIdIndex = ModalRoute.of(context).settings.arguments as int;
      print('todoIdIndex = $todoIdIndex');

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Todo'),
      ),
      body: Center(
        child: Consumer<Todos>(
          builder: (ctx, todoData, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                autocorrect: false,
                autofocus: false,
                controller:
                    TextEditingController(text: todoData.items[todoIdIndex].title),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                autocorrect: false,
                autofocus: false,
                controller: TextEditingController(
                    text: todoData.items[todoIdIndex].completed.toString()),
              ),
              SizedBox(
                height: 20,
              ),
              // TextField(
              //   autocorrect: false,
              //   autofocus: false,
              //   decoration: InputDecoration(hintText: "User ID"),
              //   controller: TextEditingController(text: todoData.items[0].id),
              // ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.amber,
                child: Text(
                  'Update',
                  style: TextStyle(color: Colors.black87),
                ),
                onPressed: () {
                  Todo newTodo = Todo(
                      title: _titleController.text,
                      // id: 1,
                      userId: 1001,
                      completed: true);
                  api.postToFirebase(newTodo);
                  Navigator.of(context).pop();
                  // print("title : ${_titleController.text}");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
