import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'dart:async';
import '../api/api.dart';

class Todos with ChangeNotifier {
  List<Todo> _items = [];

  List<Todo> get items => [..._items];

  NetworkApi api = NetworkApi();

  void addTodo(Todo newTodo) {
    // _items.clear();
    _items.add(newTodo);
    notifyListeners();
  }

  void defaultTodo() {
    _items.add(Todo(
        id: 'asddd', userId: 1, title: 'assalamualaikumxxx', completed: false));
    notifyListeners();
  }

  Future fetchAllTodos() async {
    final extractedData = await api.fetchAllTodo();
    print('allData ${extractedData}');

    if (extractedData != null) {
     print('allData count ${extractedData.length}');
      _items.clear();
      extractedData.forEach((todoID, todoData) {
        addTodo(Todo(
            id: todoID,
            userId: todoData['userId'],
            title: todoData['title'],
            completed: todoData['completed']));
      });
    } else {
      _items = [];
      notifyListeners();
    }
  }

  Future<void> deleteTodoWithID(String id) async {
    api.deleteTodoWithID(id);
  }
}
