import 'package:todo_provider/models/category_model.dart';

class TaskModel {
  String taskId;
  String taskName;
  String taskDescription;
  String? taskDate;
  CategoryModel category;

  TaskModel({
    required this.taskId,
    required this.taskName,
    required this.taskDescription,
    required this.category,
  });
}
