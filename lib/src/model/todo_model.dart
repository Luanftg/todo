import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
  final String? id;
  final String title;
  final String description;
  final bool? isDone;

  TodoModel({
    this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['_id'],
      title: map['title'] as String,
      description: map['description'] as String,
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(id: $id, title: $title, description: $description, isDone: $isDone)';
  }
}
