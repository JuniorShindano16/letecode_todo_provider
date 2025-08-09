import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/ui/widgets/textField_widget.dart';

import '../../models/category_model.dart';
import '../../models/task_model.dart';
import '../../models/todo_model.dart';
import '../../providers/filter_provider.dart';
import '../../providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  final List<CategoryModel> categories = [
    CategoryModel(catId: "1", catName: "House"),
    CategoryModel(catId: "2", catName: "Study"),
    CategoryModel(catId: "3", catName: "Sport"),
    CategoryModel(catId: "4", catName: "Work"),
    CategoryModel(catId: "5", catName: "Fun"),
  ];

  CategoryModel? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final todoTaskProvider = Provider.of<TaskProvider>(context);
    final filterProvider = Provider.of<FilterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFieldWidget(controller: _nameController, hint: "Task name"),
            SizedBox(height: 16),
            TextFieldWidget(
              controller: _descController,
              hint: "Task description",
            ),
            SizedBox(height: 16),
            TextFieldWidget(controller: _dateController, hint: "Task date"),
            SizedBox(height: 16),
            DropdownButtonFormField<CategoryModel>(
              value: _selectedCategory,
              decoration: InputDecoration(
                hint: Text("Select a category"),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0x4D2196F3),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF2196F3),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              items: categories.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat.catName));
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),

            SizedBox(height: 24),

            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  TaskModel task = TaskModel(
                    taskId: DateTime.now().toString(),
                    taskName: _nameController.text,
                    taskDescription: _descController.text,
                    category: _selectedCategory!,
                  );

                  final todo = TodoModel(
                    id: DateTime.now().toString(),
                    task: task,
                  );

                  if (_nameController.text.isNotEmpty &&
                      _descController.text.isNotEmpty &&
                      _dateController.text.isNotEmpty &&
                      _selectedCategory != null) {
                    todoTaskProvider.addTodo(todo);

                    filterProvider.getTaskTodoByFilter(
                      filterProvider.selectedFilter,
                      todoTaskProvider.todos,
                    );


                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please fill all the fields"),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 3,
                ),
                child: Text(
                  "Add",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
