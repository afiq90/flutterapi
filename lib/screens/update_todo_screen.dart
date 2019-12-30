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
  // TextEditingController _titleController = TextEditingController(text: 'lol');
  TextEditingController _titleController = TextEditingController();

  NetworkApi api = NetworkApi();
  var _isInit = true;

  @override
  void initState() {
    super.initState();

    // _titleController.addListener(setTextFieldValue);
  }

  // void setTextFieldValue() {
  // //   _titleController.text = _titleController.text;
  // }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    // _titleController.dispose();
    super.dispose();
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
    // final TextEditingController _titleController = TextEditingController(text: Provider.of<Todos>(context, listen: false).items[todoIdIndex].title);
    _titleController.text =
        Provider.of<Todos>(context, listen: false).items[todoIdIndex].title;

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
                autofocus: true,
                // decoration: InputDecoration(
                //     hintText: todoData.items[todoIdIndex].title),
                controller: _titleController,
                // controller: TextEditingController(
                //     text: todoData.items[todoIdIndex].title),
                // onChanged: (text) {
                //   print("title text field: $text");
                // },
                onTap: () {
                  _titleController.clear();
                },
                onSubmitted: (text) {
                  print('onsubmit $text');
                },
              ),
              SizedBox(
                height: 20,
              ),
              //TODO: Maybe can change this one to drop down button or toggle button
              ToggleButtons(
                children: <Widget>[
                  Icon(Icons.check, color: Colors.green,),
                  Icon(Icons.highlight_off, color: Colors.red,),
                ],
                onPressed: (int index) {
                  setState(() {
                    // isSelected[index] = !isSelected[index];
                  });
                },
                isSelected: [true,false],
              ),
              // TextField(
              //   autocorrect: false,
              //   autofocus: false,
              //   controller: TextEditingController(
              //       text: todoData.items[todoIdIndex].completed.toString()),
              // ),
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
                      // userId: 1001,
                      completed: true);
                  // print("title : ${_titleController.text}");
                  api.updateTodo(todoData.items[todoIdIndex].id, newTodo);
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
