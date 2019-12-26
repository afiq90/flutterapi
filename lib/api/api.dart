import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model/user.dart';

class NetworkApi {

  // GET Request
  // TODO: Improve with provider
  Future<User> fetchUser() async {
  User firstUser;
  
  try { 
      final response = await http.get('https://jsonplaceholder.typicode.com/todos/1');
      // var decodedData = jsonDecode(response.body);
      firstUser = User.decodeJson(jsonDecode(response.body));
      // firstUser = User(userId: decodedData['userId'], id: decodedData['id'], title: decodedData['title'], completed: decodedData['completed']);
      // print(firstUser.title);
   }
  catch (error ) {
    print('fetch error \($error)');
  }
  
  return firstUser;

}
}



