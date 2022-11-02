import '../model/todo_model.dart';

abstract class Repository {
  Future<List<TodoModel>> getTodoList();
  Future<bool> createTodo(TodoModel todo);
  Future<bool> updateTodo(String id);
  Future<bool> deleteTodo(String id);
}
