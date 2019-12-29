import 'package:flutter/material.dart';
import 'api/api.dart';
import 'models/todo.dart';
import 'widgets/todo_screen.dart';
import 'widgets/main_screen.dart';
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
        home: MainScreen(),
        routes: {AddNewTodoScreen.routeName: (ctx) => AddNewTodoScreen()},
      ),
    );
  }
}



  

