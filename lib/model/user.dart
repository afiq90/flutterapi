class User {
  int userId;
  int id;
  String title;
  bool completed;

  User({this.userId, this.id, this.title, this.completed});

  factory User.decodeJson(Map<String, dynamic> decodedData) {
    return User(
        userId: decodedData['userId'],
        id: decodedData['id'],
        title: decodedData['title'],
        completed: decodedData['completed']);
  }
}
