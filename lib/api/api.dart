import 'package:flutterapi/providers/todos.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
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

  Future<void> fetchTodoWithID() async {
    Todo firstTodo;

    try {
      final response = await http.get(
          'https://flutterapi-5afde.firebaseio.com/todos/-Lx7B0XNecXYUFmIO8JK.json');
      firstTodo = Todo.decodeJson(jsonDecode(response.body));
      // firstUser = User(userId: decodedData['userId'], id: decodedData['id'], title: decodedData['title'], completed: decodedData['completed']);
      print(firstTodo.title);
    } catch (error) {
      print('fetch error \($error)');
    }

  }

  Future<void> todoPostRequest() async {
    final String url = 'https://jsonplaceholder.typicode.com/posts';
    Map<String, String> headers = {
      "Content-type": "application/json; charset=UTF-8"
    };
    String json =
        '{"title" : "Hambidong", "body": "this is body text", "userIdx": "2"}';

    try {
      http.Response response =
          await http.post(url, headers: headers, body: json);

      int statusCode = response.statusCode;

      String body = response.body;
      print("post body: \($body)");
    } catch (error) {
      print('POST error \($error)');
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
      print("POST body: \($body)");
    } catch (error) {
      print('POST error ${error.toString}');
    }
  }
}
