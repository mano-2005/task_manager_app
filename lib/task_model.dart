class Task {
  String? id;
  String title;
  bool isDone;

  Task({this.id, required this.title, this.isDone = false});

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "isDone": isDone,
    };
  }

  factory Task.fromMap(String id, Map<String, dynamic> json) {
    return Task(
      id: id,
      title: json["title"],
      isDone: json["isDone"],
    );
  }
}