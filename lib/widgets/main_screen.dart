import 'package:flutter/material.dart';
import '../api/api.dart';
import '../models/todo.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

//Get the API data  from API services.
class _MainScreenState extends State<MainScreen> {
  NetworkApi api = NetworkApi();
  Future<List<Todo>> todoLists;
  bool _isInit = true;

  void initState() {
    super.initState();
    // Future.delayed(Duration.zero).then(
    //   Provider.of<Todos>(context).defaultTodo()
    // );

    // firstTodoFromAPI = api.fetchTodo();
    // firstTodoFromAPI = api.fetchTodoWithID();
    todoLists = api.fetchAllTodo();
    print('jkjkkk ${todoLists}');

    // todoLists.then(
    //   // Provider.of<Todos>(context, listen: false).addTodo(
    //   //   Todo(id: 'asddd', userId: 1, title: 'final fantasy', completed: false),
    //   // )
    //   // Provider.of<Todos>(context, listen: false).defaultTodo();
    // );
    // api.todoPostRequest();

    // todoLists.add(
    //     Todo(id: 'asddd', userId: 1, title: 'final fantasy', completed: false),
    //     Todo(id: 'asddd', userId: 1, title: 'fifa', completed: false),
    // Todo(id: 'asddd', userId: 1, title: 'ronaldo', completed: false)
    // );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      // Provider.of<Todos>(context, listen: false).defaultTodo();
      // Provider.of<Todos>(context, listen: false).addTodo(
      //   Todo(id: 'asddd', userId: 1, title: 'final fantasy', completed: false),
      // );

      // Provider.of<Todos>(context).addTodo(todoLists);

    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final todosData = Provider.of<Todos>(context).items;
    print('todosData = ${todosData.length}');
    return Scaffold(
      body: Center(
        // child: ListView.builder(
        //   itemCount: todosData.length,
        //   itemBuilder: (ctx, i) => Text(todosData[i].title),
        // ),
        child: FutureBuilder<List<Todo>>(
          future: todoLists,
          builder: (context, snapshot) {
            print('snapshot ${snapshot.data}');
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (ctx, i) => ListTile(
                        title: Text(snapshot.data[i].title),
                      ));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
