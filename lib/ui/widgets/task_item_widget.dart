import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/todo_model.dart';
import '../../providers/filter_provider.dart';
import '../../providers/task_provider.dart';

class TaskItemWidget extends StatefulWidget {
  final TodoModel taskTodo;

  const TaskItemWidget({super.key, required this.taskTodo});

  @override
  State<TaskItemWidget> createState() => _TaskItemWidgetState();
}

class _TaskItemWidgetState extends State<TaskItemWidget> {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TaskProvider>(context);
    final filterProvider = Provider.of<FilterProvider>(context);

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.shade50,
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 1,
          ),
          BoxShadow(
            color:Colors.blue.shade100,
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    widget.taskTodo.task.taskName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Text(
                      widget.taskTodo.task.taskDescription,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Checkbox(
                value: widget.taskTodo.isDone,
                onChanged: (value) {
                  final todoGot = todoProvider.getTodoById(widget.taskTodo.id);
                  todoProvider.toggleTodoStatus(todoGot);
                  filterProvider.getTaskTodoByFilter(
                    filterProvider.selectedFilter,
                    todoProvider.todos,
                  );
                },
                activeColor: Colors.blue,
              ),
            ],
          ),
          Divider(color: Colors.grey),
          Row(
            children: [
              Text(
                widget.taskTodo.task.category.catName,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
              ),
              Spacer(),
              Row(
                spacing: 10,
                children: [
                  Text("Status : "),
                  Icon(
                    Icons.circle,
                    color: widget.taskTodo.isDone
                        ? Colors.green
                        : Colors.redAccent,
                  ),
                ],
              ),

              IconButton(onPressed: (){
                todoProvider.removeTodo(widget.taskTodo);
                filterProvider.getTaskTodoByFilter(
                  filterProvider.selectedFilter,
                  todoProvider.todos,
                );

              }, icon: Icon(Icons.delete))

            ],
          ),
        ],
      ),
    );
  }
}
