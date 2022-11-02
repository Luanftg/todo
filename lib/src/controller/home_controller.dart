import 'package:todo/src/data/home_repository.dart';

import '../model/todo_model.dart';

class HomeController {
  final HomeRepository repository = HomeRepository();

  Future<List<TodoModel>> getList() async {
    var response = await repository.getTodoList();
    return response;
  }

  Future<bool> createTodo(TodoModel todo) async {
    var response = await repository.createTodo(todo);
    return response;
  }
}
