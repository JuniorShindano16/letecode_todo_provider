import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/models/filtre_model.dart';

import '../../providers/filter_provider.dart';
import '../../providers/task_provider.dart';

class FilterOptionWidget extends StatelessWidget {
  final FilterModel filter;
  const FilterOptionWidget({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context);
    final taskProvider = Provider.of<TaskProvider>(context);
    return GestureDetector(
      onTap: () {
        filterProvider.selectFilter(filter);
        filterProvider.getTaskTodoByFilter(filter, taskProvider.todos);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        constraints: const BoxConstraints(
          minHeight: 20,
        ),
        decoration: BoxDecoration(
          color: filter.isSelected ? Colors.blue.shade50 : Colors.white,
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Text(
          filter.name,
          style: const TextStyle(
            color: Colors.blue,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
