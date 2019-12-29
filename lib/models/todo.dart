
class Todo {
  int userId;
  String id;
  String title;
  bool completed;

  Todo({this.userId, this.id, this.title, this.completed});

  factory Todo.decodeJson(Map<String, dynamic> decodedData) {
    return Todo(
        userId: decodedData['userId'],
        id: decodedData['id'],
        title: decodedData['title'],
        completed: decodedData['completed']);
  }
}
