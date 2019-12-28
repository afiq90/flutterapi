import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';

class Todos with ChangeNotifier {
  List<Todo> _items = [];

  List<Todo> get items => [..._items];

  NetworkApi api = NetworkApi();
  
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
    final extractedData = await api.fetchAllTodo();
    print('allData ${extractedData}');

    extractedData.forEach((todoID, todoData) {
      addTodo(Todo(
            id: todoID,
            userId: todoData['userId'],
            title: todoData['title'],
            completed: todoData['completed']));
    });
  
  }
}
