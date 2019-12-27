import 'package:flutter/material.dart';
import '../api/api.dart';
import '../model/todo.dart';

class TodoForms extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  NetworkApi api = NetworkApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: "Title"),
              controller: _titleController,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autofocus: false,
              decoration: InputDecoration(hintText: "Body"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              autofocus: false,
              decoration: InputDecoration(hintText: "User ID"),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.amber,
              child: Text(
                'Create TODO',
                style: TextStyle(color: Colors.black87),
              ),
              onPressed: () {
                Todo newTodo = Todo(
                    title: _titleController.text,
                    id: 1,
                    userId: 1001,
                    completed: true);
                api.postToFirebase(newTodo);
                // print("title : ${_titleController.text}");
              },
            )
          ],
        ),
      ),
    );
  }
}
