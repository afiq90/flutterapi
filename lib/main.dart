import 'package:flutter/material.dart';
import 'screens/add_todo_screen.dart';
import 'screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'providers/todos.dart';
import 'screens/update_todo_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Todos(),
      child: MaterialApp(
        title: 'Flutter API CRUD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
        // home: UpdateTodoScreen(),
        routes: {
          AddNewTodoScreen.routeName: (ctx) => AddNewTodoScreen(),
          UpdateTodoScreen.routeName: (ctx) => UpdateTodoScreen(),
        },
      ),
    );
  }
}
