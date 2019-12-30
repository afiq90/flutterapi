import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../models/todo.dart';

class NetworkApi {
  // GET Request
  // TODO: Improve with provider
  // Future<Todo> fetchTodo() async {
  //   Todo firstTodo;

  //   try {
  //     final response =
  //         await http.get('https://jsonplaceholder.typicode.com/todos/1');
  //     // var decodedData = jsonDecode(response.body);
  //     firstTodo = Todo.decodeJson(jsonDecode(response.body));
  //     // firstUser = User(userId: decodedData['userId'], id: decodedData['id'], title: decodedData['title'], completed: decodedData['completed']);
  //     // print(firstUser.title);
  //   } catch (error) {
  //     print('fetch error \($error)');
  //   }

  //   return firstTodo;
  // }

  Future<Map<String, dynamic>> fetchAllTodo() async {
    var extractedData;

    try {
      final response =
          await http.get('https://flutterapi-5afde.firebaseio.com/todos.json');
      //transform data
      extractedData = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (error) {
      print('fetch error \($error)');
    }

    return extractedData;
  }

  // Future<Map<String, dynamic>> fetchTodoWithID(String id) async {
  //   var fetchedData; 

  //   try {
  //     final response = await http.get(
  //         'https://flutterapi-5afde.firebaseio.com/todos/$id.json');
  //       fetchedData = jsonDecode(response.body) as Map<String, dynamic>;
  //     // firstTodo = .decodeJson(jsonDecode(response.body));
  //     // firstUser = User(userId: decodedData['userId'], id: decodedData['id'], title: decodedData['title'], completed: decodedData['completed']);
  //     // print('ayamas: ${response.body}');
  //   } catch (error) {
  //     print('fetch error \($error)');
  //   }

  //  return fetchedData;
  // }

  Future<void> deleteTodoWithID(String id) async{
    try {
      final response = await http.delete(
          'https://flutterapi-5afde.firebaseio.com/todos/$id.json');
      // firstUser = User(userId: decodedData['userId'], id: decodedData['id'], title: decodedData['title'], completed: decodedData['completed']);
      print('delete todo with id $id');
    } catch (error) {
      print('fetch error \($error)');
    }
  }

  Future<void> postToFirebase(Todo todo) async {
    final String url = 'https://flutterapi-5afde.firebaseio.com/todos.json';

    var newTodo = json.encode({
      "userId": todo.userId,
      "id": todo.id,
      "title": todo.title,
      "completed": todo.completed
    });

    try {
      http.Response response = await http.post(url, body: newTodo);

      int statusCode = response.statusCode;

      String body = response.body;
      print("Create POST body: \($body)");
    } catch (error) {
      print('Create POST error ${error.toString}');
    }
  }

  Future<void> updateTodo(String id, Todo updatedTodo) async {
    final String url = 'https://flutterapi-5afde.firebaseio.com/todos/$id.json';

    var newTodo = json.encode({
      // "userId": todo.userId,
      // "id": todo.id,
      "title": updatedTodo.title,
      "completed": true
    });

    try {
      http.Response response = await http.patch(url, body: newTodo);

      int statusCode = response.statusCode;

      String body = response.body;
      print("Update POST body: \($body)");
    } catch (error) {
      print('Update POST error ${error.toString}');
    }
  }
}
