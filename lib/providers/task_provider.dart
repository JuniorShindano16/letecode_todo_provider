import 'package:flutter/cupertino.dart';
import 'package:todo_provider/models/todo_model.dart';


class TaskProvider extends ChangeNotifier {

  final List <TodoModel> _todos = [];
  List <TodoModel> get todos => _todos;

  TodoModel getTodoById(String id) {
    return _todos.firstWhere((todo) => todo.id == id);
  }

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void toggleTodoStatus(TodoModel todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
  }



}
