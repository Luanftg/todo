import 'dart:convert';

import 'package:todo/src/data/repository.dart';
import 'package:todo/src/model/todo_model.dart';
import 'package:http/http.dart' as http;

class HomeRepository implements Repository {
  var url = ('https://crudcrud.com/api/d74ef8fd0f3541859a0036460dad9bee');

  @override
  Future<bool> createTodo(TodoModel todo) async {
    var response = await http.post(
      Uri.parse('$url/todo'),
      body: todo.toJson(),
      headers: {
        "content-type": "application/json",
        "accept": "application/json"
      },
    );

    return response.body.isNotEmpty ? true : false;
  }

  @override
  Future<List<TodoModel>> getTodoList() async {
    var response = await http.get(Uri.parse('$url/todo'));
    final list = List.from(jsonDecode(response.body));
    final model = list.map((e) => TodoModel.fromMap(e)).toList();
    return model;
  }

  @override
  Future<bool> updateTodo(String id) {
    // TODO: implement updateTodo
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteTodo(String id) {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }
}
