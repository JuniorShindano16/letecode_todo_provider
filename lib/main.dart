import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/providers/filter_provider.dart';
import 'package:todo_provider/providers/task_provider.dart';

import 'my_app.dart';

void main() {
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<TaskProvider>(create: (_) => TaskProvider()),
          ChangeNotifierProvider<FilterProvider>(create: (_) => FilterProvider()),
        ],
        child: const MyApp(),
      )
  );
}




