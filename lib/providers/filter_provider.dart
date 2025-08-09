
import 'package:flutter/cupertino.dart';
import 'package:todo_provider/models/filtre_model.dart';
import 'package:todo_provider/models/todo_model.dart';


class FilterProvider extends ChangeNotifier {
 final List<FilterModel> _filters = [
    FilterModel(id: "1", name: "All", isSelected: true),
    FilterModel(id: "2", name: "Done", isSelected: false),
    FilterModel(id: "3", name: "Not Done", isSelected: false),
    FilterModel(id: "4", name: "House", isSelected: false),
    FilterModel(id: "5", name: "Work", isSelected: false),
    FilterModel(id: "6", name: "Sport", isSelected: false),
    FilterModel(id: "7", name: "Study", isSelected: false),
    FilterModel(id: "8", name: "Fun", isSelected: false),
  ];
  List<FilterModel> get filters => _filters;
  FilterModel get selectedFilter => _filters.firstWhere((filter) => filter.isSelected);

  final List<TodoModel> _taskTodoByFilter = [];
  List<TodoModel> get taskTodoByFilter => _taskTodoByFilter;


 void selectFilter(FilterModel filter) {
   for (var f in _filters) {
     f.isSelected = f.id == filter.id;
   }
   notifyListeners();
 }

 void getTaskTodoByFilter(FilterModel filter, List<TodoModel> allTodos) {
   _taskTodoByFilter.clear();
   if (filter.name == "All") {
     _taskTodoByFilter.addAll(allTodos);
   } else if (filter.name == "Done") {
     _taskTodoByFilter.addAll(allTodos.where((todo) => todo.isDone));
   } else if (filter.name == "Not Done") {
     _taskTodoByFilter.addAll(allTodos.where((todo) => !todo.isDone));
   } else {
     _taskTodoByFilter.addAll(
       allTodos.where((todo) => todo.task.category.catName == filter.name),
     );
   }
   notifyListeners();
 }

}