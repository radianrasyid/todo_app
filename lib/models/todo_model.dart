class TodoModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoModel({
    required this.userId,
    required this.completed,
    required this.id,
    required this.title,
  });

  TodoModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    completed = json['completed'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}
