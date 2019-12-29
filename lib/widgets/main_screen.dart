import 'package:flutter/material.dart';
import '../api/api.dart';
import 'package:provider/provider.dart';
import '../providers/todos.dart';
import '../widgets/todo_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

//Get the API data properly from todos provider notifier
class _MainScreenState extends State<MainScreen> {
  bool _isInit = true;
  // Todos todosData = Todos();
  NetworkApi api = NetworkApi();

  void initState() {
    super.initState();
    print('this is init state');
    Future.delayed(Duration.zero, () {
      //   setState(() {
      //     // Here you can write your code for open new view
      //   });
      // Provider.of<Todos>(context, listen: true).fetchAllTodos();
    });

    // print('onValue $onValue')
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      // Provider.of<Todos>(context).addTodo(todoLists);
      // Provider.of<Todos>(context).fetchAllTodos().then((_) =>
      //   // todosData = Provider.of<Todos>(context)
      //   a = "ayam"
      // );
      // a = "rimauxxxx";
      // Provider.of<Todos>(context).fetchAllTodos();
      // api.fetchAllTodo().then((_) =>
      //     // todosData = Provider.of<Todos>(context)
      //     a = "ayam");
      // Provider.of<Todos>(context, listen: true).fetchAllTodos();
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Todos>(context, listen: true).fetchAllTodos();
    final todosData = Provider.of<Todos>(context);
    final todosDataItems = Provider.of<Todos>(context).items.toList();

    // print('todosData items = ${todosData.items}');

    Future<void> _refreshTodos(BuildContext context) async {
      await Provider.of<Todos>(context).fetchAllTodos();
    }

    // print('todosData count = ${todosData.items.length}');

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(AddNewTodoScreen.routeName).then(
              (_) => Provider.of<Todos>(context, listen: true).fetchAllTodos());
        },
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshTodos(context),
        // child: Center(
        //   child: todosDataItems.isEmpty
        //       ? Text('No Todo List Available')
        //       : ListView.builder(
        //           itemCount: todosDataItems.length,
        //           itemBuilder: (ctx, index) => todosDataItems.length > 0
        //               ? ListTile(title: Text(todosDataItems[index].title))
        //               : CircularProgressIndicator()),
        // ),
        child: Center(child: Consumer<Todos>(builder: (ctx, todoData, child) {
          // print('object nulllll?');
          if (todoData.items.isNotEmpty) {
            return ListView.builder(
                itemCount: todoData.items.length,
                itemBuilder: (ctx, index) =>
                    ListTile(title: Text(todoData.items[index].title)));
          } else {
            return Text('Empty todo');
          }

        })),
      ),

      //TODO: try use futurebuilder
      // body: FutureBuilder(
      //   future: Provider.of<Todos>(context, listen: true).fetchAllTodos(),
      //   builder: (ctx, dataSnapshot) {
      //     print('dataSnapshot $dataSnapshot');
      //     if (dataSnapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     } else {
      //       if (dataSnapshot.error != null) {
      //         // ...
      //         // Do error handling stuff
      //         return Center(
      //           child: Text('An error occurred!'),
      //         );
      //       } else {
      //         return Consumer<Todos>(
      //           builder: (ctx, todosData, child) => ListView.builder(
      //                 itemCount: todosData.items.length,
      //                 itemBuilder: (ctx, i) => Text(todosData.items[i].title),
      //               ),
      //         );
      //       }
      //     }
      //   }
      // ),
    );
  }
}
