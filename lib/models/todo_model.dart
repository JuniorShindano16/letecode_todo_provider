import 'package:todo_provider/models/task_model.dart';

class TodoModel {
  String id;
  TaskModel task ;
  bool isDone = false ;
  TodoModel({required this.id, required this.task});

}