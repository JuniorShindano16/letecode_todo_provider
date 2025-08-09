import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/providers/filter_provider.dart';
import 'package:todo_provider/ui/widgets/filter_option_widget.dart';
import 'package:todo_provider/ui/widgets/task_item_widget.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Todo Management",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IntrinsicWidth(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Text(
                        "Tasks",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Positioned(
                        top: -15,
                        right: -15,
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Text(
                            filterProvider.taskTodoByFilter.length.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTaskScreen()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Color(0x4D2196F3)
                      ,
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Icon(Icons.add, size: 15, color: Colors.blue),
                        Text(
                          "New Task",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filterProvider.filters.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: FilterOptionWidget(
                      filter: filterProvider.filters[index],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: filterProvider.taskTodoByFilter.isEmpty
                  ? const Center(
                      child: Text(
                        "No task added yet",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filterProvider.taskTodoByFilter.length,
                      itemBuilder: (context, index) {
                        return TaskItemWidget(
                          taskTodo: filterProvider.taskTodoByFilter[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
