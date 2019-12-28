import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Todos with ChangeNotifier {
  List<Todo> _items = [];

  List<Todo> get items => [..._items];
  
  void addTodo(Todo newTodo) {
    _items.add(newTodo);
    notifyListeners();
  }

  void defaultTodo() {
    _items.add(
        Todo(id: 'asddd', userId: 1, title: 'assalamualaikumxxx', completed: false));
    notifyListeners();
  }

  Future fetchAllTodos() async {

    try {
      final response =
          await http.get('https://flutterapi-5afde.firebaseio.com/todos.json');
      //transform data
      final extractedData = jsonDecode(response.body) as Map<String, dynamic>;
      
      extractedData.forEach((todoID, todoData) {
       
        addTodo(Todo(
            id: todoID,
            userId: todoData['userId'],
            title: todoData['title'],
            completed: todoData['completed']));
      });
          
    } catch (error) {
      print('fetch error \($error)');
    }
  }
}
