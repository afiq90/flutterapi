import 'package:flutter/material.dart';
import '../api/api.dart';
import '../models/todo.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

//Get the API data properly from todos provider notifier
class _MainScreenState extends State<MainScreen> {
  bool _isInit = true;
  Todos todosData = Todos();
  NetworkApi api = NetworkApi();

  void initState() {
    super.initState();
    Provider.of<Todos>(context, listen: false).fetchAllTodos();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      // Provider.of<Todos>(context).addTodo(todoLists);
      // Provider.of<Todos>(context).fetchAllTodos().then((_) =>
      //   // todosData = Provider.of<Todos>(context)
      //   a = "ayam"
      // );
      // a = "rimauxxxx";
      // Provider.of<Todos>(context).fetchAllTodos();
      // api.fetchAllTodo().then((_) =>
      //     // todosData = Provider.of<Todos>(context)
      //     a = "ayam");
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    todosData = Provider.of<Todos>(context);

    print('todosData items = ${todosData.items}');

    // print('todosData count = ${todosData.length}');
    return Scaffold(
      body: Center(
        child: todosData.items.length > 0
            ? ListView.builder(
                itemCount: todosData.items.length,
                itemBuilder: (ctx, i) => ListTile(
                      title: Text(todosData.items[i].title),
                    ))
            : CircularProgressIndicator(),
      ),
    );
  }
}
