import 'package:todo/src/data/home_repository.dart';

import '../model/todo_model.dart';

class HomeController {
  final HomeRepository repository = HomeRepository();

  Future<List<TodoModel>> getList() async {
    var response = await repository.getTodoList();
    print(response);
    return response;
  }

  Future<bool> createTodo(TodoModel todo) async {
    var response = repository.createTodo(todo);
    print(response);
    return true;
  }
}
