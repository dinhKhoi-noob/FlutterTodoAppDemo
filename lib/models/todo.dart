class Todo {
  String? name;
  String? id;
  int? priority;
  String? description;
  DateTime dueDate = DateTime.now();
  Todo({this.id, this.name, this.priority, this.description, dueDate});
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      name:json['name'],
      priority: json['priority'],
      description: json['description'],
      dueDate: json['dueDate']
    );
  }
}
