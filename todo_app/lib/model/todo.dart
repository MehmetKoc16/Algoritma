class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userid,
  });
  int? id;
  String? todo;
  bool? completed;
  int? userid;

  Todo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    completed = json["completed"];
    userid = json["userId"];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["completed"] = completed;
    data["userId"] = userid;

    return data;
  }
}
