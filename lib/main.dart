import 'package:flutter/material.dart';
import 'api/api.dart';
import 'models/todo.dart';
import 'widgets/todo_screen.dart';
import 'widgets/main_screen.dart';
import 'widgets/main_screen2.dart';
import 'widgets/main_screen3.dart';

import 'package:provider/provider.dart';
import 'providers/todos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Todos(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  NetworkApi api = NetworkApi();
  Future<Todo> firstTodoFromAPI;

  void initState() {
    super.initState();
    // Future.delayed(Duration.zero).then(
    //   Provider.of<Todos>(context).fetchTodos;
    // )
    // firstTodoFromAPI = api.fetchTodo();
    // firstTodoFromAPI = api.fetchTodoWithID();
    // api.fetchAllTodo();

    // api.todoPostRequest();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        // body: TodoForms(),
        body: MainScreen(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {print('button pressed');},
        ),
      ),
    );
  }
}
