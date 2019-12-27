import 'package:flutter/material.dart';
import '../api/api.dart';
import '../model/todo.dart';

class MainScreen extends StatelessWidget {

//TODO: create a provider to get the todo data from server
@override
  Widget build(BuildContext context) {
    return Scaffold(
      //  body: Center(
      //     child: FutureBuilder<Todo>(
      //       future: firstTodoFromAPI,
      //       builder: (context, snapshot) {
      //         if (snapshot.hasData) {
      //           return Column(
      //             mainAxisAlignment:  MainAxisAlignment.center,
      //             children: <Widget>[
      //               Text('userId : ${snapshot.data.userId}'),
      //               Text('id : ${snapshot.data.id}'),
      //               Text('title : ${snapshot.data.title}'),
      //               Text('completed : ${snapshot.data.completed}'),
      //             ],
      //           );
      //         } else if (snapshot.hasError) {
      //           return Text("${snapshot.error}");
      //         }

      //         // By default, show a loading spinner.
      //         return CircularProgressIndicator();
      //       },
      //     ),
      //   ),
       
    );
  }

}